Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id DD734724B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 20:56:48 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i17so4157390qcy.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 12:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6nTLOiO6Ibshv+b6gtKnuTVrglYd3CaX1lunmhZ2Xzw=;
	b=CGu+6BqBzUXimR91fvYZmSNUCF6XoDYny1M5xa6pyNFWi4hWV2At65dPChQQTUIfD8
	5XiHwnkTevtd9zbpn3v8vO3fVabYenoQGXmsfnNCtMsgOK4DubooAzqbEXXr6imMqy5J
	30wszJvMnYtf+xpItE3p+lBjz648hR7EA3O/Zoj7nbhpzDGI+3NYs4r4KyqPjrrSgbWZ
	hXs7z/wd1eydCg3f42a2sKxJ+8YN2KCtf52qw9AWX5PzKYI8wNSfHreDGC1B411O6GLj
	hOd/zhqF+PVEg1NFhCBqyUleNIJv/wVyQgLilsJF8vnMVDpCwg7+ph2kKzyyJUoK8yEp
	WaBg==
X-Gm-Message-State: ALoCoQkfWYOl/Me6HO33ueRovAdamfdLWZfWwA1prtz/21Ug1AISP8030m5lx/Jqq4h1o9jW+TNC
X-Received: by 10.140.40.209 with SMTP id x75mr25828850qgx.80.1418072209075;
	Mon, 08 Dec 2014 12:56:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 12:56:28 -0800 (PST)
In-Reply-To: <1a6294d4421862267755ac8cd71ffd91cce16902.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<1a6294d4421862267755ac8cd71ffd91cce16902.1415350038.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 20:56:28 +0000
Message-ID: <CAJTo0LZqEAbtSdPfpb13VcC+JM99G_Rmv4wbcj=50aT83JRKgg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/24] libunwind: add aarch64 support
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
X-List-Received-Date: Mon, 08 Dec 2014 20:56:55 -0000
Content-Type: multipart/alternative; boundary=001a11c1283649c2fe0509baaa9e

--001a11c1283649c2fe0509baaa9e
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:

>   - Support-building-with-older-compilers (fix undefined reference to
>     `unreachable' on older compilers)
>

This patch is missing a signed-off-by header, and considering that oe-core
has gcc 4.9 do we still need this, or is it specific to a commercial
product that is using an older toolchain?

Ross

--001a11c1283649c2fe0509baaa9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 at 08:51, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ef" class=3D"a=
3s" style=3D"overflow:hidden">=C2=A0 - Support-building-with-older-compiler=
s (fix undefined reference to<br>
=C2=A0 =C2=A0 `unreachable&#39; on older compilers)</div></blockquote><div>=
<br></div><div>This patch is missing a signed-off-by header, and considerin=
g that oe-core has gcc 4.9 do we still need this, or is it specific to a co=
mmercial product that is using an older toolchain?</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--001a11c1283649c2fe0509baaa9e--
