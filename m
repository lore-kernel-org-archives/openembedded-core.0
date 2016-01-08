Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D93473D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:23:36 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id t15so52622551igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TYrueHKl19bVDOqgttmfXm9zuYwb6TsEGzWrEVJbVuc=;
	b=BAzKcAoCdFPw8jFw+REyBX/z7KacsQGVO2gJr1fJvfFmX6BceXwaORHRC7UDB0X8Bt
	+nnkDs2JBYSKNAkBdz/Hbe2BP0aT8zSCTRc+WZbNNxNUjMpmIzPJC4AwKXH11Lqxbgx/
	jGa65eBJKQL0EM24Bqiks9Gna5U0QYQE5BGt7GNMcudZg4CNTCRX9VYlQPShqzWNhEtB
	UEhVoHATs/xg17QYkACARe7rB4Fgdd6fX7X9PMkGWUVRfNw5EMvHnpacHR1Ct47VYwQF
	FPrCBK9PH1ZkxF5TrB+M4P1sSd4bZGrrOeb8Y2WAen6qgB5ZnNwe+K+X151Qiylo4TCT
	62Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TYrueHKl19bVDOqgttmfXm9zuYwb6TsEGzWrEVJbVuc=;
	b=itKf8QUs0saXXkx0JzWyXCFXsc0spFBtvQwq3C68Lpeci2kl5hSvGln38q2FxNjRT+
	qNSfAGWV6oAQ0ISPzqznzsQLVgM0nAbOxI516A/6axuJx9q7+t+zISisdIDEM3qKJDah
	TCSx+vGksGHZDDpWVaGfgta8fT/EjPYSO20xi+H0inePCRV6mZRD4X3CDn9SGPY84b0G
	F2pqvoC7IjrzLFRP6RFTDyd1lIFNeP0dGOvHKyCnBBAX8f/C5BVwKTi/xhbyxnPyfzOV
	g4Bb+XJNWiMvfahdSd7MtyH3XslVzg8mhRJRm9wwgfddfiFQ/yPR8ENEF5Bf2v7gsLJj
	TfJw==
X-Gm-Message-State: ALoCoQnrpWiKhkcAgkuw9hDE8XuNdiyQrQ/M4yHki6fSu6Dany5xqaXLNgpVD6FAbSuR8mp6wKlEceUX3ij8AJWxHnU+v7uixThIF/CDm62DE0gvDtYOzaA=
X-Received: by 10.50.126.8 with SMTP id mu8mr20827863igb.52.1452263017241;
	Fri, 08 Jan 2016 06:23:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 06:23:17 -0800 (PST)
In-Reply-To: <CAJTo0LZZhpUtmaKpkHf-NCtRBAt2KRx8cVoSpOQEH9eheFTP8g@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0LZZhpUtmaKpkHf-NCtRBAt2KRx8cVoSpOQEH9eheFTP8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:23:17 +0000
Message-ID: <CAJTo0Lbj=bV=5PLm=W-ANnrv3nfwB0KyAtc1UDYHX4qGpQw5Og@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:23:37 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf4398180528d35587

--047d7b1635bf4398180528d35587
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 14:12, Burton, Ross <ross.burton@intel.com> wrote:

> Looks like FTW_STOP etc are glibc-specific.
> https://github.com/commodo/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch
> seems reasonable, assuming it works.
>

It builds at least!  Patch sent to the list. :)

Ross

--047d7b1635bf4398180528d35587
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 14:12, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">Looks like FTW_STOP etc are glibc-specific. =C2=A0<a href=3D"https://gith=
ub.com/commodo/openwrt/blob/master/package/devel/oprofile/patches/100-musl.=
patch" target=3D"_blank">https://github.com/commodo/openwrt/blob/master/pac=
kage/devel/oprofile/patches/100-musl.patch</a> seems reasonable, assuming i=
t works.</div></blockquote></div><br>It builds at least!=C2=A0 Patch sent t=
o the list. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--047d7b1635bf4398180528d35587--
