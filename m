Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 651A078199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 22:18:16 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id k192so26455635ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p9Ck739bs40t3IxA+B7GbpJ/by1uNqPf/mTJO+tmLJA=;
	b=TlIOIqBH/MHpE97HnZK6WHTycraqX1eR9n/4AOjo/Ko5mPpS2mywt/1+pdcGMBIfXL
	GXHRHnT+0hBBKc8G7Oj45QzHVQmoL7oIMWHLjbXBDeHKtDacwVKv4IF5uO0Zl2C3zUhm
	YExVGK2zKvujG/uw0c8TYa9Hh38wa0JbOylm2ItOeMxbqQjIOkDHWkaAFopP8Jrqq6Zs
	B+YlPzSsnkhtII114YVreTQJmVPwlNlSibT8srJnIGQ3poSABO1rkYZmPdeBtZ3doRv4
	nUK/iyBUhaWmqA6jco3EKd2PRaoC1DiAp14Ae/sLAtW+YH3sPCl68FLzedDvP/S+X1CK
	F4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p9Ck739bs40t3IxA+B7GbpJ/by1uNqPf/mTJO+tmLJA=;
	b=ElwYjM6T73y/ip6Ck2VdI/NilEnHvbFJrFoR+h0hVoKCrqeahSGi+al14Ic1bbft/a
	w8GkLPvZTg8RJ/I/02lPy2N/G90eqhIZJVd8ZgVRv6MEHwe6x8GBLx8mKzhcTUgPh7LZ
	rpfswP5BbGVG/rnFYZnz3BdKpB72D/4V2G9o/DevUPYH/bjHbXZTh8J5pCpFvzQ6VVva
	PyJQb4Uwacq/GIUdt6zzwxPnvPn4M5KxgYw/5v8pTvkBQ6Ptc8ddOvG6by8aTFcL5Ws2
	UrATbMHDCBdpR3XpRAhjQ2AUTDH8TxDWEzWhcviHvopiIuo1Q6iqwlh7WSBpTRPviSfI
	zGpA==
X-Gm-Message-State: AIVw1117i0AcjQlS6w/B2FwPNca99iRjgo6ZCzlR3h1FNohDpgdFhrZI
	yIGQU2tFub7EQ+mMkuJgd7XGvYo+P53L
X-Received: by 10.107.169.80 with SMTP id s77mr756033ioe.219.1499897897486;
	Wed, 12 Jul 2017 15:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 15:17:56 -0700 (PDT)
In-Reply-To: <17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 23:17:56 +0100
Message-ID: <CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] linux-yocto/4.1: update to v4.1.41
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
X-List-Received-Date: Wed, 12 Jul 2017 22:18:16 -0000
Content-Type: multipart/alternative; boundary="001a1141006c61260405542631b7"

--001a1141006c61260405542631b7
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 16:04, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
>
> Integrating the korg -stable update that comprises the following
> commits:

I'm guessing this is the cause of this failure with poky-lsb on qemux86-64.

ERROR: Package Version (4.1.41+gitAUTOINC+9f9c9a66ef_9f0d87a53d) does not
match of kernel being built (4.1.42). Please update the PV variable to
match the kernel source or set KERNEL_VERSION_SANITY_SKIP="1" in your
recipe.

(http://errors.yoctoproject.org/Errors/Details/147312/)

--001a1141006c61260405542631b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 11 July 2017 at 16:04, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt; wrote:<br>&gt;<br>&gt; Integrating the korg -stable up=
date that comprises the following<br>&gt; commits:<br><br>I&#39;m guessing =
this is the cause of this failure with poky-lsb on qemux86-64.<br><br>ERROR=
: Package Version (4.1.41+gitAUTOINC+9f9c9a66ef_<wbr>9f0d87a53d) does not m=
atch of kernel being built (4.1.42). Please update the PV variable to match=
 the kernel source or set KERNEL_VERSION_SANITY_SKIP=3D&quot;1&quot; in you=
r recipe.<div><br></div><div>(<a href=3D"http://errors.yoctoproject.org/Err=
ors/Details/147312/" target=3D"_blank">http://errors.yoctoproject.<wbr>org/=
Errors/Details/147312/</a>)</div></div>

--001a1141006c61260405542631b7--
