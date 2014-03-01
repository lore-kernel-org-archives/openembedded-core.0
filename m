Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 984B46F484
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:04:10 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id lh14so2083877vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KGFF9LQj55FEp8OHK+u2nfRmmjhkPkl3LU1FoFc/ZWE=;
	b=kxjFzZvlAqTIpXfAmnKHCwEMOp0b8Z6DZtMQAig4xFDwhR7Z7VD0TFncbnwLKFRQYO
	2fxnxzL5K/J3bujh6bPY50NIFz2p6nBkHzn/VsezXb5rXH1L8UFZd7FuoMsrm0mb0nc4
	PpXJFo5PnHZoIBvIRm90zh+YzN4uuBSVT6Kn5fDLSmbEX4pBVHtL/kLTG+jq2ItR0/Bk
	wOO5KihaDl0G6tu2AtgSkzmLBpu5XRLrvnhgVQORFog79G1yHUC6W9tTQQ3I1LN2UCwo
	MAIoWWIh924egJUCzHmtLyUJtw0nWaZedK8OlV1co8L6ei2NSBZY3rSw3V2QQRACn1AN
	zVKQ==
X-Received: by 10.58.100.100 with SMTP id ex4mr8830163veb.2.1393697050595;
	Sat, 01 Mar 2014 10:04:10 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sat, 1 Mar 2014 10:03:30 -0800 (PST)
In-Reply-To: <53121CF2.6090402@topic.nl>
References: <53121CF2.6090402@topic.nl>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 1 Mar 2014 18:03:30 +0000
X-Google-Sender-Auth: rw372WRZXsZJDjirt9N4PbehyW4
Message-ID: <CANyK_8fBSHAtoQ2ZyG4yJK87N42Wn5bb+xHanbvkNw3w7NxEbA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: rootfs fails to build in current master
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
X-List-Received-Date: Sat, 01 Mar 2014 18:04:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 March 2014 17:46, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I get this mysterious error at rootfs after updating to current master:
>
> Exception: AttributeError: 'module' object has no attribute
> 'shell_trap_code'
>
>
> I haven't been following OE for a while, so I have no clue as to what caused
> this.
>
> Stack trace:
>
> File: '/media/work/master-next/openembedded-core/meta/lib/oe/image.py',
> lineno: 248, function: _write_script
>      0244:        self.d.setVarFlag('img_creation_func', 'func', 1)
>      0245:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
>      0246:
>      0247:        with open(script_name, "w+") as script:
>  *** 0248:            script.write("%s" % bb.build.shell_trap_code())
>      0249:            script.write("export ROOTFS_SIZE=%d\n" %
> self._get_rootfs_size())
>      0250:            bb.data.emit_func('img_creation_func', script, self.d)
>      0251:            script.write("img_creation_func\n")
>      0252:
>

As a quick stab-in-the-dark guess: Are you using the current master of
Bitbake to build this? Each branch of OpenEmbedded has a corresponding
branch of Bitbake, OE master requires Bitbake master.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

