Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8150177552
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:14:30 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id m67so27627239qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XOJ2d6i4kH0tXYP/prCzJ0wxl7TkJA/jOMCPT20vezo=;
	b=F5uPD5+q7xLwGrad8wXtcrgTJUyI8rmPqK+yM4Kr8s6iTMlN/zKbXPqF9WFxzntBIT
	G/KI8eaygOJol2u46WeTBmxcoorr1mRcP5G9vE4lXgozxsXk1ecSb7rGlbxSBR2vHxH5
	imNHEIsIgue/AenDwjf6bkziTrwtymE6Jb/Iqgcf6MxmiPeEeQGJ4UuzluQ9Xbaen407
	pLll+Ra/z3QhZThdId2uqkHnt4U+hbpBw8JZjTFPm6x6TjBclPewW54s6soZyhkJHXm+
	MzJ/x5EqdZysJARCKOYvyb/lSAHMvlWM9X0U9Q3oUZqtmkxaFIh/BgA5jU7c/6PhksgT
	WLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XOJ2d6i4kH0tXYP/prCzJ0wxl7TkJA/jOMCPT20vezo=;
	b=rEA99Sieoxw+fyWbhPFFt8PMS/NhJcjZKHWJq8KLKTwPKjhQNO+2avK5JAIcIYE4Aw
	FQ401wYZn6P7T0LAcXFI6V6OxtM1hrEvgn1YeMqUpSY0ixS91hJBgNnUpYi7tUSQUo55
	HJ1FSg+/00FLiqj21kOgEZqw8DA2j7EkhuGSUUVkQxcbbElCdXfod/w9O+O61E9XGdvt
	ak6uHdFAd9Tp95yXEgjFVyQQSaiR0gFe2EHsxrsEX+IVty1QRbDAJBZ18W4MenarwCCN
	In/tTFuYP4AbkxR2Wc+mOBom0DutK29pLjOnexNatMdcNc7uC/BltGeBs9JmT1aKyHAA
	hrNA==
X-Gm-Message-State: AMke39mSqvyS9QaEuY6U2K3fzPvFr/ZHSnI3ZmiIKEFnbpCUZupYG16lJ4WMQmBmPJl8Xfy3uXmkVsP680V659f/
X-Received: by 10.237.43.69 with SMTP id p63mr18970477qtd.68.1488485671274;
	Thu, 02 Mar 2017 12:14:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 12:14:10 -0800 (PST)
In-Reply-To: <CAJ86T=XtVqkkqZLfxechBnkzMO15MoKxuVFCY=1K9NXgrcLKog@mail.gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp+=6Ot3q5PkQN9Cqv95EGPCK5RQ11EkvhGCrTqo9atHA@mail.gmail.com>
	<CAJ86T=XYuWtMBwFPrQ6wod7s_Jm6qnpVkek1QQt9i2X8Wks10g@mail.gmail.com>
	<CAJ86T=XtVqkkqZLfxechBnkzMO15MoKxuVFCY=1K9NXgrcLKog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 20:14:10 +0000
Message-ID: <CAJTo0LbXhAo9V+GbT+gNmeUwQ8JakiEiazwerYds_ETGetBW1A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Thu, 02 Mar 2017 20:14:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc4b102330549c513db

--94eb2c124cc4b102330549c513db
Content-Type: text/plain; charset=UTF-8

On 2 March 2017 at 19:25, Andre McCurdy <armccurdy@gmail.com> wrote:

> the existing hardcoded "ldconfig" in PACKAGECONFIG should also be removed.
>

Damnit, thanks.

Ross

--94eb2c124cc4b102330549c513db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 March 2017 at 19:25, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1lx" class=3D"a3s =
aXjCH m15a907c4cbbdab27">the existing hardcoded &quot;ldconfig&quot; in PAC=
KAGECONFIG should also be removed.<div class=3D"yj6qo ajU"><div id=3D":1ei"=
 class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>Damn=
it, thanks.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c124cc4b102330549c513db--
