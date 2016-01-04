Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id E93E773179
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:55:45 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id to18so217063047igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=XpOOR0xm/mXRg5DUauY1SYf2nrqhMS1K+hK/fXh/uqk=;
	b=bx8YkOv34F8uMQReHe2Gg/r8uIt6LC0cEFIaOo/to4trV8p0dIXL21AvGkgu9UQvF7
	N165NdDubrqCvY5cbNa9asg8jdByrfm77qIekexELYY3gdxVrI2pPrgnI4p/6/GELgW3
	53qcmd0v4D4u9eu1ZEm75tGbvVAuh6jeYP+TL39TvIFE180AQRLzSUCreoxo8pKl8NfN
	BEdQYBIjFH+lh5ekMV41HZ+vYdBrkDMKt+FoUXxVOZpzUPdRW42YKBh5KI8FYQ+Z94vN
	2MDQHlMfUuTfxH/6AlMrCR/ZII7mxmP8VLIrY+sqL6zm3U3Y9kFyV/offekTLCIG1mjk
	1GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=XpOOR0xm/mXRg5DUauY1SYf2nrqhMS1K+hK/fXh/uqk=;
	b=Zsi3qg64F8KSuFGfovL36bqgxg4QttJSBSkvACOKDaSAefkZhOf87kNndWO7FQ5t5i
	fq+ba9qvQjvSyZJSk57NkYg7z1P1CuQKH4gbhoUwPddMOAlHziG1aAzngEb64GhBaOE+
	yOCSTeGCh0tYRAm1bG+9z5lN20pL1uZ/uT5/f3rqJ7U06ZeUNQ2xVXbML3vPJeLe0QGM
	Zkn4ETJZ5/1Yojs+tzGe56CKcLioJWb1bxC/CSOGr2XIJfMUHy42i5aw5Y0RjmaGyx4i
	7Qb4eXicZZ/zEtVO2SFmkC2DrHuJJtADSQnexjco/jDHQaYytnXP5peBEcFLShIrfdqu
	nWqg==
X-Gm-Message-State: ALoCoQkLIzwcaHxKsa4mm6FP5IFJ32NLSzBH3rRJNGzlIOx1VGcwsh9ANuXODtwNjHjKtFJhX/4VyvMJJFg/XTMa0j/dc5KbcQ==
X-Received: by 10.50.128.164 with SMTP id np4mr25464687igb.26.1451904946382;
	Mon, 04 Jan 2016 02:55:46 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F59E.dip0.t-ipconnect.de. [93.232.245.158])
	by smtp.gmail.com with ESMTPSA id
	g67sm24344383ioe.34.2016.01.04.02.55.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:55:45 -0800 (PST)
Message-ID: <1451904943.23712.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 04 Jan 2016 11:55:43 +0100
In-Reply-To: <1451307640.4129.16.camel@linuxfoundation.org>
References: <1451307640.4129.16.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Split do_rootfs into image specific tasks?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 10:55:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-12-28 at 13:00 +0000, Richard Purdie wrote:
> I've heard complaints from people trying to create more interesting
> image types about how hard it is to understand the rootfs/image
> generation code and that its a pain to develop/test/debug.
[...]
> I guess the real question is whether people like this direction and how
> much should we change the API in order to improve things? Could we
> afford a pretty heavy rewrite in this area to give a good end result?

I think it is indeed a step in the right direction. Having to re-create
the rootfs directory each time one makes a change to an image creation
class or image configuration made experimenting with such changes
awkward and slow.

However, the question remains how far this rewrite should go. The
current semantic model of an "image" is essentially "rootfs + boot
loader + kernel", and the current "image" recipes define both the
content of the rootfs and additional parameter for turning that one
rootfs into an image.

That's arguably the most common scenario, but it is only a special case.
Other image layouts may have multiple partitions, each with certain
files. For example, there might be a read-only rootfs, an overlay
partition for the rootfs and a data partition for user files (for the
sake of the argument, assume that it needs to be pre-populated with
certain files).

In my opinion, the proposed changes allow implementing a more general
image class. Such a class would have to create additional tasks (like
do_overlayfs and do_userfs where it installs files based on some
additional recipe variables), then in do_image_foobar combine these
additional directories into the full disk image.

This can be done without using any existing code, but probably there are
overlaps in functionality and opportunities for code reuse. For example,
converting a directory into a ext2/ext3/ext4/btrfs file system is a
common problem. Having that in a Python utility method would be useful
(but not needed immediately).

The "populate rootfs" code may also be a candidate for moving into an
utility method, although it may be harder to determine exactly which
variables it depends on and might not even be needed.

So, bottom line, I think it makes sense to move ahead as proposed and
refine later in cooperation with distros trying to implement their own
special disk layout.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




