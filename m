Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBB66069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:54:45 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id y33so117381405qta.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lMahNAxLvL2TYgy0fW6XJxtIUkOicu+q92hldmsbRco=;
	b=mDZigjGapeGcRtPOFCPu1+fJI0EKoSiQoe3KbqKHeIPM/dkahdrbxsxhKedA7ckkiP
	3Tm4OzaLRcK/HEAwCrHlZLiv6raa/FEWNIoXS/qkPguOeec1gmKjQM4pRT57WVXY4vo7
	WuGUUsC2Q5vwpVdWsS3KYDBpoV12EuJvthcbkx+Fe6gdMkJ7X+dTXnzC6MUKjdJhQ9mZ
	TmoYuApa84SK2npNcpXoofsyjVbSRI4BePrHuKNUAk0m3LDQFULmJfINuTS5SzreuPc+
	ybRb81Fie9qeYy6fnqQtM8T5vvFovXTnWjLi18jKRiCDIcOpBcPXD/LOuWPnV9C7Ct5c
	45ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lMahNAxLvL2TYgy0fW6XJxtIUkOicu+q92hldmsbRco=;
	b=DtjMk3gmQEmNbViTp2MTWvjdsXRe248cxZcXINvBFfHs6xTL1T4V8zC3MQAKLtn6z1
	A3sIu4zACrHh5MYxnHcf9mnQQ1WFR5f+UnHV9k1njl6R0fV79Ewd0KCr1PHK7mUa4ETo
	GPrJ5gdS6ve3t4n4of6cL4DffuRcs/p1YEeGS8/mwDKawL35FYUSOtE58zcDjQt4qO6h
	K4RwwKtE8ObD0Cxcsc7IC8SvbroHwKuUx5q2eHEScElbcb+siDwfov4oru49TQ+VsqlA
	8fQ86Pc/yEtHSZYbCBIm9z7VlJcTVPCOshIxmP8trozPJhJyBuHC4tujT/MITN3PH8fo
	3bHg==
X-Gm-Message-State: AN3rC/7JA4Z4N3X4Y/yMcHq/FsZRUCd4Yp8j5tk/owJgubOxJQnewtN8
	4TLt7jM+mCe2jr7GhTJF2ETG5FBnURrI
X-Received: by 10.200.34.242 with SMTP id g47mr25803914qta.109.1493049287100; 
	Mon, 24 Apr 2017 08:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 08:54:26 -0700 (PDT)
In-Reply-To: <CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 16:54:26 +0100
Message-ID: <CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 15:54:46 -0000
Content-Type: multipart/alternative; boundary=001a114037d463e2f5054deba011

--001a114037d463e2f5054deba011
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:47, Burton, Ross <ross.burton@intel.com> wrote:

> The updated glibc recipe doesn't appear to be very happy:
> https://autobuilder.yocto.io/builders/buildtools/
> builds/240/steps/BuildImages/logs/stdio
>

Note that every nativesdk-glibc build is failing like this, so that's SDKs
broken.

Ross

--001a114037d463e2f5054deba011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 10:47, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>The updated glibc recipe doesn&#39;t appear to be very happy:=C2=A0<a href=
=3D"https://autobuilder.yocto.io/builders/buildtools/builds/240/steps/Build=
Images/logs/stdio" target=3D"_blank">https://autobuilder.<wbr>yocto.io/buil=
ders/buildtools/<wbr>builds/240/steps/BuildImages/<wbr>logs/stdio</a></div>=
</blockquote><div><br></div><div>Note that every nativesdk-glibc build is f=
ailing like this, so that&#39;s SDKs broken.</div><div><br></div><div>Ross<=
/div></div></div></div>

--001a114037d463e2f5054deba011--
