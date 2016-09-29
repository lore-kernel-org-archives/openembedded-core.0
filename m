Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2952660107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:10:55 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id j69so71348670itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ukJtSNXfSndjWbkeWwz/AImR5aZsTjyRiUmLb4fGMAM=;
	b=ZMCYzFZDJ6CZOjOtpwjSC0lALWtqOK/vd/3Lsd/oF3TTtx2p83MRSCevEN4QInyWhb
	+K6x178iKsLWTnD0J2vgq/CvpHhywI9TI1sLen+q966hgb9ppyB4AY984Aqok9RblGh0
	zREYIPnCu653gc5YfLG1zQ9XrvklM4vByjjtzGn2VbnWrHHKpaUDytBju3ZEfsKb7yK+
	BaKZdUseQXhEJdB5LqDq46qHOaDJW1Y/Q7CKQjWHYbTH8CID9yyRJvylhua/MXHlIyp/
	9u/Yi7UwZPHQC1tgcF/rTv3/4aZEJXvWVuDn5Yr/yxh3T+m4+UrSQGNI1QLTn0GEl87H
	1NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ukJtSNXfSndjWbkeWwz/AImR5aZsTjyRiUmLb4fGMAM=;
	b=CBez2jpvLsCCz8gmvXRVWsLMRSSOOtYq2shlVvObZfgrf/rqA4UEF/cVffrbwwrzIZ
	/9vQsiU2ZOLRo4zUsmw1QOfQZbkBHy9I2gRGsdCfCe4XndrVX37deDnaWOvnvQRLsBA6
	vNdNl3vyY1c8raEvdQk/4mzEd2puAcoBVQvjIjRNai80OOpbw5eZlUnkZNCpUffA+Rip
	iHRoYQWVTb3Nl/2rETQo4etf75UyyXKqdc28iBG6M923pp1kBonn7r3oY1mClMrYdDnM
	QjYRQ0bOMwiDtHQXMyAEvRPcPQkeuUK+1z3jdspMI5HryAxMq48NMLFSZaJ+ExrC/iMV
	xAeg==
X-Gm-Message-State: AA6/9RmHlaH5bmm+VQrDJam+dsMxnHX4A16hph+s45LPK48CSxdSfvlOa0aQB2foXd8HkigvLOiTbUCGa2kn9gqf
X-Received: by 10.36.25.14 with SMTP id b14mr6879276itb.29.1475140257026; Thu,
	29 Sep 2016 02:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 29 Sep 2016 02:10:36 -0700 (PDT)
In-Reply-To: <b1a11a1060394d0fb65c80eaeee5a64fbeae9811.1475139494.git.liezhi.yang@windriver.com>
References: <cover.1475139494.git.liezhi.yang@windriver.com>
	<b1a11a1060394d0fb65c80eaeee5a64fbeae9811.1475139494.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Sep 2016 10:10:36 +0100
Message-ID: <CAJTo0LYth5as9Od3v7S-L8d5C5RVSghwdPkmKtSgEW3iQ_gFUA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] source-highlight: use with-boost-libdir
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
X-List-Received-Date: Thu, 29 Sep 2016 09:10:56 -0000
Content-Type: multipart/alternative; boundary=001a1144b0c403c8e2053da1db41

--001a1144b0c403c8e2053da1db41
Content-Type: text/plain; charset=UTF-8

On 29 September 2016 at 10:02, Robert Yang <liezhi.yang@windriver.com>
wrote:

> -EXTRA_OECONF = "--with-boost=${PKG_CONFIG_SYSROOT_DIR}/${prefix}"
> +EXTRA_OECONF = "--with-boost=yes --with-boost-libdir=${PKG_
> CONFIG_SYSROOT_DIR}${libdir}"
>

PKG_CONFIG_SYSROOT_DIR is the wrong variable to use here as that's
explicitly for pkg-config to know what the current sysroot is.  Use
STAGING_DIR_TARGET explicitly.

Ross

--001a1144b0c403c8e2053da1db41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 September 2016 at 10:02, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9sc=
" class=3D"a3s aXjCH m157752ea895fdde1">-EXTRA_OECONF =3D &quot;--with-boos=
t=3D${PKG_CONFIG_<wbr>SYSROOT_DIR}/${prefix}&quot;<br>
+EXTRA_OECONF =3D &quot;--with-boost=3Dyes --with-boost-libdir=3D${PKG_<wbr=
>CONFIG_SYSROOT_DIR}${libdir}&quot;<br></div></blockquote></div><br>PKG_CON=
FIG_SYSROOT_DIR is the wrong variable to use here as that&#39;s explicitly =
for pkg-config to know what the current sysroot is.=C2=A0 Use STAGING_DIR_T=
ARGET explicitly.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a1144b0c403c8e2053da1db41--
