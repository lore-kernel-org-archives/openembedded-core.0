Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0AA65D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 10:39:16 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id q107so5321923qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=iOWVEB6TbgZAUw7C5jLxXlme++XTONeOpniBMGqDVYo=;
	b=DXx+bueDKpDnDOBSHC340aO5XYbPNSxErk8mDo/NaTSa2L8BU539X4/LrkW1jyKmjO
	liouDS3GPmsFoNGT5UbKlE6db+1QXOvA78P7lE0ZBC+d9iAW4yVB6xnxVCGRy6YK1izr
	KDNNtqQdaD09okfu0Ux+PFl3LNk8IT4cWN/KrGw8aRRRJHIAjaF7mLS6Q2R9YjTw583d
	rUVuoo8mnrTrOO4JWYnqtd2Z4HPkzXw5dZEimQPBn/KQSeVIzRGtUKaxXNfxm3L5/VRO
	81iQ3QcT+3JZufT8S4II+h4p5bv1WwnTgdz2emnj7uqgDWJFfEA1dN9jyOO4kYsMvsTE
	F7Kw==
X-Received: by 10.140.23.198 with SMTP id 64mr40472913qgp.62.1415615957028;
	Mon, 10 Nov 2014 02:39:17 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Mon, 10 Nov 2014 02:38:36 -0800 (PST)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 10 Nov 2014 10:38:36 +0000
X-Google-Sender-Auth: B54yM423zeqYvkbT3AG8-Y_oiu4
Message-ID: <CANyK_8eJYijsMH2y4s6bGTMTOpmz=-zFeuDG5CkM4h=YvLGUQw@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: [RFC] Replace procps with procps-ng
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
X-List-Received-Date: Mon, 10 Nov 2014 10:39:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I've tried upstreaming a patch against procps by sending it to the
listed maintainer and the mailing list and I've had no reply from
either. The last change to the CVS repository seems to be 3 years old
and the mailing list archive is mostly just full of spam.

It looks like Arch Linux, Debian, Fedora and openSUSE have moved on to
procps-ng. I suggest we do the same during the v1.8 development cycle
if possible. procps-ng is actively developed and looks to be open to
patches.

I'm sadly pretty limited on development time at the minute but I may
be able to give this a go in December. I'd rather focus the time I do
have on opkg though so if anyone else wants to pick this up that'd be
great.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

