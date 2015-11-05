Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEA860125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 21:08:32 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so38283669qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 13:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=73TFcFTiTLMGZtYLZODDv5eKTkdrbYNn9BQXAL/Ou10=;
	b=omCss2DcdFcWZZ924MsVDbyprLt2OL/kP3m2uEE773osuCHP8yBbGldySuAVCTH/Zn
	MuTJk+H065dMBGELsUOmE9G+DCm7sx6jc37i96EFCWPe/KewOLFzFwqt6JkLkG/9g/km
	V2tunI7BLeZFutUDd450kCN9zboDDRIjEK2ZWAspAv76dIE0IuYf8zVvzvlkB+MeZovT
	0wc6zx8DmggUkA0I2iNFFOxduRKpiqXkTm2uwa3HSdaQlC2T7beFPUmq1SzXcez9tgAr
	dUTfZOHXmZqacQjGw0FjWPGY2ystv+e5khawt9WciEaUV0jIyAWltGeiMdRKg2JMPZTu
	XYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=73TFcFTiTLMGZtYLZODDv5eKTkdrbYNn9BQXAL/Ou10=;
	b=DWmEuIH2Iix+AZ1N8MISWp+Hy6wgUJHM0YNDXcDmJuntkBzglya7w4mBL12mCDRlQE
	aYbAly+zgPleb8jus14aTI/40iTOBmte5xHo3At6VRZhAKdJ8DZuB7UyOv6Ue62V3N3H
	r+4MkfSU8j3X92FukVtVtcLvEXMjmq9XT7LUb2ej+qcnw7HUQ4lOolkApOmYLWa994lJ
	sM7BzGapqlU1tv+TxgiqvXkThulBkxDC/N3AXOxNl9p2bnB3fmrxoU+qfo0h3BDMbfHC
	M0mdeBU0i7ZPTL0QlsAxATn0y9Ezo0oDIj860xvtdmK2xMV4gFEyij3y8/QH46OmrJsj
	/tbg==
X-Gm-Message-State: ALoCoQldhDEqEXozTdq5aGcp5ukMPZhDgkJ1/WxRfX7spfVyIDNk4/LK6g+yPhrzZn+Qwj8GGmwE
X-Received: by 10.55.78.143 with SMTP id c137mr9672800qkb.72.1446757712899;
	Thu, 05 Nov 2015 13:08:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 13:08:13 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 21:08:13 +0000
Message-ID: <CAJTo0Lapy65UBQuf7bUXUtkw64bJ0wq8keT6wd+rwUqWnJ43LA@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Thu, 05 Nov 2015 21:08:34 -0000
Content-Type: multipart/alternative; boundary=001a114a8f688dd0390523d187e9

--001a114a8f688dd0390523d187e9
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 18:13, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> The patch works unmodified  (and solves mingw build problems) for gcc 4.9.
> as well,
> providing gcc-4.9.inc is  patched the same way as gcc-5.2.inc
>

Can you send a proper patch for that?

Cheers,
Ross

--001a114a8f688dd0390523d187e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 18:13, Bystricky, Juro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qz=
" class=3D"a3s" style=3D"overflow:hidden">The patch works unmodified=C2=A0 =
(and solves mingw build problems) for gcc 4.9. as well,<br>
providing gcc-4.9.inc is=C2=A0 patched the same way as gcc-5.2.inc<br></div=
></blockquote></div><br>Can you send a proper patch for that?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a114a8f688dd0390523d187e9--
