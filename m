Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C77226E786
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 21:19:11 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id if17so10320009vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=/q0LEYEeL//misvghKOZjP4cCUVUUVlSkMXWymX+qJA=;
	b=JsYNmAx7u9QzHBJR5OYXVtxmobhiKm/3yEaaN2TZe1YkyD3R1uhgZNSDYMEimTL86W
	MdIsu86X4BZ+cuuW5iPGuc2EnbxGKRHfrlNxZk5Xn8S3aS20BgDeRMOczye5hAWBjkEn
	zvj3ZIQw6PDKjOC31gabdY/OUvdhPSgvj39DptzSrdsMikAV6yv5WXZJxa9HV7uxJrOg
	bIlyv1/MefGSjxh3PZDfjrJZdL1s+pxXMwJWLQM8Rv7NCFXpQAuqtttC8Elm2KMMaJNe
	PAXRDb8pE0akYsusXV65qMVVZ3Ypl+rRRuupM48+a7MYsrMlUrFCeDk734me+/24rhC2
	wQ8w==
X-Received: by 10.52.108.164 with SMTP id hl4mr2914480vdb.25.1396387151510;
	Tue, 01 Apr 2014 14:19:11 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 14:18:30 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 1 Apr 2014 22:18:30 +0100
X-Google-Sender-Auth: 2vgcCI7WxHP0_HpFIvjoWIm-UW4
Message-ID: <CANyK_8dPFDShPAvhYt+89j0Mr4fjzpeMt28HrwNAZrN8qfnS4w@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: opkg-0.2.2 release
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
X-List-Received-Date: Tue, 01 Apr 2014 21:19:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I've just released opkg-0.2.2 with the following bugfixes (issue
numbers refer to the opkg issue list):

- Fix '--force-reinstall' flag so that it acts as an upgrade rather than
  removing possibly critical packages before reinstall (issue 71)

- Symlinks are now correctly removed during package uninstall (issue 91)

- Fixed help and manual pages to reflect that shell globs not true regexps are
  accepted by opkg (issue 107)

- The error message "no valid architecture" is no longer given when the
  architecture of a package is valid but incompatible with the current system.

This is a bugfix only release with no other significant changes.

I have also rebased the patches against opkg in oe-core against the
new release and checked that they still apply and that the result
builds with recent oe-core master. The result was tested on qemuarm by
running 'opkg update' against a package feed and installing a few new
packages.

Do we want to try to get this in to the upcoming Yocto release or
shall I delay the recipe upgrade until after the release? If you want
it for the upcoming release I'll re-run my tests locally just to be
sure it's looking good and then send a patch.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

