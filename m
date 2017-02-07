Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0B2E6078E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 16:34:11 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w20so134589020qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D+mUb8FanFMUHB+Rs3sOQQEOFdPCbOeRsBlMiTCMMCc=;
	b=iBCi+kzF731QErKcaW25bnJ8cI8vluQB9h2m/Bt8YHwY3L+KjtuW/QVYIyFocYbpuy
	YczhluO43M/EIeT9+kHMX+OgLHmGxuhgx/YYxDUXEM5N/07wqgICAtPS0f4x5hu00WtH
	LNbvGtiBII0bl0UOUJh5OpBll0vcTD15U31TOVjMuiQZNMPfMAP5Pl8jQ+jTAx8504Zp
	NLUo2yD4g57XiDhHBdfstPAYRVU7fAz0HyEujX546nb8jjKIXXsSHCWcA4VYm51AXZQN
	79kxV6oHXRpJkTVAQB9+ObIuY//r1ppp2XCoTobok9dyWq4TEEFED7MmLRSm5EQvzX0F
	nAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D+mUb8FanFMUHB+Rs3sOQQEOFdPCbOeRsBlMiTCMMCc=;
	b=rlL2TDE93snpdEhoqFNDp71otxkFkE45aGU44ZjvzqqNK/MbGckVm9d73WN/nlKAX9
	2eo928EUC18dmdRURtPhls6GC0AcaKVZoRvT/qmw3qPphfeZAjo2i5TgtQbONFm6Eidw
	VtSWnmyuAN2LT7Ay4kIEwnIvhN7M3qA2PpZWJHJrAVqodkiYfKbpqY+D1qTWzGy+Yka9
	BEmDo0oVy2I3lO4a1QOmx8X1tkTSiTvhHMC6k44AZRi9c3Ha8tMtQGsNQQRUG0o88gOl
	SZTKStUySd4vbGSKE5nidjMnqwmG4FlhfLCUbGVEXgPOny64l3UXKx+5HNuC/sY9ugXB
	USGw==
X-Gm-Message-State: AMke39mIm1coZ19X4b9IUlrcweXqmUrllsFtGtlvtz802cL9Ka+beovwDdEhbEBuYAVnA7KNaUdpOlftnQ4mbc3N
X-Received: by 10.237.36.208 with SMTP id u16mr16433162qtc.105.1486485251639; 
	Tue, 07 Feb 2017 08:34:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 7 Feb 2017 08:33:51 -0800 (PST)
In-Reply-To: <1480609418-3264-2-git-send-email-linus.svensson@axis.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
	<1480609418-3264-2-git-send-email-linus.svensson@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 16:33:51 +0000
Message-ID: <CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
To: linus.svensson@axis.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Tue, 07 Feb 2017 16:34:13 -0000
Content-Type: multipart/alternative; boundary=001a114104ce639a670547f351db

--001a114104ce639a670547f351db
Content-Type: text/plain; charset=UTF-8

On 1 December 2016 at 16:23, <linus.svensson@axis.com> wrote:

> Meson is a build system designed to be fast and as user firendly as
> possible. Find out more about meson at mesonbuild.com.
>
> This patch is based on a prototype patch by
> Ross Burton <ross.burton@intel.com>.


So the good news is that I just used this recipe and class to build the new
libepoxy release with Meson instead of autotools, and it worked for all
architectures.

However this can't be considered for oe-core as it is, because it depends
on ninja-native (and that on re2c-native) which are part of meta-oe.

Until we have a need for Meson in oe-core, would you consider submitting it
to meta-oe?

Cheers,
Ross

--001a114104ce639a670547f351db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2016 at 16:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:linus=
.svensson@axis.com" target=3D"_blank">linus.svensson@axis.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"il">Meson</span> =
is a build system designed to be fast and as user firendly as<br>
possible. Find out more about <span class=3D"il">meson</span> at <a href=3D=
"http://mesonbuild.com" rel=3D"noreferrer" target=3D"_blank">mesonbuild.com=
</a>.<br>
<br>
This patch is based on a prototype patch by<br>
Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.=
com</a>&gt;.</blockquote></div><br>So the good news is that I just used thi=
s recipe and class to build the new libepoxy release with Meson instead of =
autotools, and it worked for all architectures.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">However this can&#39;t be conside=
red for oe-core as it is, because it depends on ninja-native (and that on r=
e2c-native) which are part of meta-oe.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Until we have a need for Meson in oe-core,=
 would you consider submitting it to meta-oe?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a114104ce639a670547f351db--
