Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 592CD71A6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 20:14:18 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id w33so357439322qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=alJOZr/+yvw4zYRsficLm40rIP/dAgazDuOF36hgqXI=;
	b=YERA+Fhq3xTjczu/WOv8Nz860HRZn6ckUVK6rDxACh2LSHyPZEG8WrW8V/CUhnJ5NZ
	BCVViRNA7fgjgzxwuKrbdKgwtw+22Z0osixUY6y7uf/Tao/7GNpmaIt4wur0YyQfiH5z
	VZ8qFbT+GpL3i1tP/jCKD2JdvBzviOQ4Ji7yrds9fYu9uoH1/Z3QJS8aCabJu6rK915j
	tIFJec7f7CydxF6OfPoVhCpklPcGY22V158/FBlUcorVAzUUdj4GdNpF94od3BwLAB7m
	SdIWTCYiXi3kQvrx1ctHSRWry1UHQXmqU2fjFNv2M/JYLrNjqgX3Ye4Tbtg/SNP5JaSi
	cIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=alJOZr/+yvw4zYRsficLm40rIP/dAgazDuOF36hgqXI=;
	b=eniuF6a8Uq73PEuuOriEHClTWdWfBZyS4asDqYOknKXoZ6CcXk8zlBdhme+fIkwx65
	rTF5KH1C78+tF875XEmttPa332rYrb9CxDSdSOzxCnBtBPPwPSo0eTVTxcnOCfb/Qpf9
	QwlpjlEuwDiLN4c6Hu3aumsPzmlNnz4qJKCkdUyeI81APZmyiqVS/6udqkbM+hFijS9K
	XSE+rh+blfcnhS42CCoP1tdOo4Mtc0hFE1ImR82nKAM4IYdv98563FgX3TAMSrZbyNgw
	8hmAuilf6pA6esKQguREIOv5hW9+dThl07WC8zPGANchd2i7H0D4rKENHtMjeWPev5M5
	ryUA==
X-Gm-Message-State: AKaTC00PZDxKLPgaOr4NeSaZYHBifDfmO1x8Q4O7ZlnHmw2Iwhf0i6AqZPVI01LswCYEqxAbp7fsx5wY+CBY/355
X-Received: by 10.237.44.161 with SMTP id g30mr58093506qtd.144.1481055259770; 
	Tue, 06 Dec 2016 12:14:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 12:13:59 -0800 (PST)
In-Reply-To: <1481024991-5882-29-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-29-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 20:13:59 +0000
Message-ID: <CAJTo0LbmQkctYKqyYvbHyd+Jf-j8gkdUpH-hcPWwggWN-jinyQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] dpkg: update packages and files to match Debian more closely
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
X-List-Received-Date: Tue, 06 Dec 2016 20:14:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848a6f56d0543030cc6

--94eb2c125848a6f56d0543030cc6
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> +RRECOMMENDS_dpkg-perl = "gnupg gpgv"
>

With plain master this causes a build failure:

ERROR: Multiple versions of gnupg are due to be built
(/home/ross/Yocto/poky/meta/recipes-support/gnupg/gnupg_2.1.14.bb
/home/ross/Yocto/poky/meta/recipes-support/gnupg/gnupg_1.4.7.bb). Only one
version of a given PN should be built in any given build. You likely need
to set PREFERRED_VERSION_gnupg to select the correct version or don't
depend on multiple versions.

As gnupg 1.4.7 provides gpgv, but 2.1.14 doesn't.

No idea where 2.1.14 should, what gpgv is, or what the solution is, as it's
late and I'm going to crash on the sofa. :)

Ross

--94eb2c125848a6f56d0543030cc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2vj" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m158d3fb4458ccc43">+RRECOMMENDS_dpkg-perl =3D &qu=
ot;gnupg <span class=3D"gmail-il">gpgv</span>&quot;<br></div></blockquote><=
/div><br>With plain master this causes a build failure:</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">ERROR: Multiple versions =
of gnupg are due to be built (/home/ross/Yocto/poky/meta/recipes-support/gn=
upg/<a href=3D"http://gnupg_2.1.14.bb">gnupg_2.1.14.bb</a> /home/ross/Yocto=
/poky/meta/recipes-support/gnupg/<a href=3D"http://gnupg_1.4.7.bb">gnupg_1.=
4.7.bb</a>). Only one version of a given PN should be built in any given bu=
ild. You likely need to set PREFERRED_VERSION_gnupg to select the correct v=
ersion or don&#39;t depend on multiple versions.<br></div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">As gnupg 1.4.7 provides gpgv=
, but 2.1.14 doesn&#39;t.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">No idea where 2.1.14 should, what gpgv is, or what the =
solution is, as it&#39;s late and I&#39;m going to crash on the sofa. :)</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--94eb2c125848a6f56d0543030cc6--
