Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B62B0601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 19:53:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id u185so114656783iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UfDOOfTfdPufdjmr9JxiQzPq2MNX6brGI51PaBOO5+U=;
	b=cKAZZYzLFIzSiLYQ6FNIQcN2KAoRboArraHKrWidSNSyO5xQbYnu5dzJjeYXnDNBf2
	UkpQWu7iWkSNs9Kjzbz79dYFPIM52h+Dn4DCIcQrL/3yxF7nqMnZK46zFtmxmSrUxxYA
	6gmf/gJxgOm/5Vw41btFU5EzFxnVDEhWNR27o6bJyGAeAqsdZfrFZ9YQXL5x0rbQUFMr
	43TxfUNUiWtOQXZiJ174N1ZdoSlsWSyBtrprxyAaU6PwlIzNKyNwTtntIg4rSlZha6kZ
	t0udeSQEltFw1XKR1fQ2Nf7CDFVmPTvA1dRwDiy8YkBStshra8rGb54RfYRojk08neiX
	KasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UfDOOfTfdPufdjmr9JxiQzPq2MNX6brGI51PaBOO5+U=;
	b=D/nyTF54/yvlTL6XQNR4qd7onOVFoh045aaOIRiqq/gfhOgoZ5ElVuCLoF/a3LCx+I
	t7wn9k0f9mFNnIFBQrv41nwDuDbFJetKUoOXiAxCSj3VlZVyRYYVsdDiH5bfbBX52eIN
	pFJZdJBmxPrUKVr/IbLuahNVUStXggYOAgUkIKSeZguKMm9twZZ4C0CH5KBhNjiiz+pK
	1tzdFXzOjahA8KJ8/OHExyqEa7C3Bwya2JmCpwmaFacGSStz3K0BLtlxaFRqJXh3lsgh
	Ll2g4lQ4z78aaTV93Fmfb0d+eFfNCWOrHU0wLNprxAtLbPn1af03hvfa87FYSnC54n8V
	ChrQ==
X-Gm-Message-State: AOPr4FWZqljuzXf4qKzHyqf1zwK8/iaEhOQl8YJh6GzgCvliWm0KthA+CpopzFOZiCwpt0Sx2Qz31BwjeWsh93Kq
X-Received: by 10.107.134.84 with SMTP id i81mr17320543iod.99.1460663628945;
	Thu, 14 Apr 2016 12:53:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 14 Apr 2016 12:53:29 -0700 (PDT)
In-Reply-To: <20160410184953.GH16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Apr 2016 20:53:29 +0100
Message-ID: <CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 14 Apr 2016 19:53:49 -0000
Content-Type: multipart/alternative; boundary=001a113febc8bd9e7a0530774002

--001a113febc8bd9e7a0530774002
Content-Type: text/plain; charset=UTF-8

On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:

> BTW, at least for md5sum (not sure about sha*), isn't the de-facto standard
> extension .md5 and not .md5sum? Can we change it?
>

Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
not sure there's a de-facto standard as two equally reasonable options.

Ross

--001a113febc8bd9e7a0530774002
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 April 2016 at 19:49, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"><div id=3D":4tz" class=3D"" style=3D"overflow:=
hidden">BTW, at least for md5sum (not sure about sha*), isn&#39;t the de-fa=
cto standard<br>
extension .md5 and not .md5sum? Can we change it?<br></div></blockquote></d=
iv><br>Picking a random upstream (<a href=3D"https://download.gnome.org/sou=
rces/glib/2.10/">https://download.gnome.org/sources/glib/2.10/</a>) shows t=
hat GNOME used .md5sum until they migrated over to sha256sum, so I&#39;m no=
t sure there&#39;s a de-facto standard as two equally reasonable options.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113febc8bd9e7a0530774002--
