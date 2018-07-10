Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDE87553C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:20 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r16-v6so41691999oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tpcR+5USmOUNLv/Gg0apRC40Lxc/aSoPctwB9dTQRso=;
	b=Gqg533Sl/FpW9UokNLox3PRUKsbNEOW5f+Wu/+aSiE1lVBqex96ZTJRK62jOwbwAvO
	qebBKZm4PNQuEutEHCdp1aR2cTfOswMkoSbzqoYxJ0Xb6S9ckXwqQ7lx/orwFjGcnzv3
	MbsRS/ko42dCiLF79FEBNR9tA8Bi9wHpw0YxJZg1+VvH0Q0AwoYVTNaGDi5zFg56KC2I
	GLu66t7/Csse4R5TnfK6eBzNbVY4rg2dIp/5XXlb3noJ9JFCDAzHFbasoFIkKQLn9mUB
	K2TjF8b2Zg3una5JqDMMYgLAgMKbNBl2iVqqo8GaU85IsJQb62GKw3vWVpIWbfYhThCa
	CwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tpcR+5USmOUNLv/Gg0apRC40Lxc/aSoPctwB9dTQRso=;
	b=PwhvEsgH9T3NX3bPcjJSy5DpZeCJgTop1gZJ7zps7cp92yrBXWw9enIV2qAraTJfRE
	gNwTRMJ1Ghuf/vaGeBBQtFwUE4tR+e1O4UF2OROEgzb5Z9HSpkeoUEpwlu5XXwMrR5ZI
	9aNvyriRfSRKuN+EVsRbc1F3y6JQ6SE/FIlG5gjBiL88+fOpkyWyoiBvjnXfaCljhT22
	hI8UW4wX1cPi7T6o+XyX9+pY8tEQjAjmouy/rEN90lKdMhDwfqy2pK0C2OxF9V00+umi
	5Mw53Lc2uNLyTh8/9AgpshWOCoKvj4dkv7Ias9WgknJ2pZr4olZsYwZxuDPcxvTsA3TP
	8Z5g==
X-Gm-Message-State: APt69E2KUIY1el81L/pHvXbULW3ylAeuli7hoOs26jSEXCCJt9a84mX0
	j2oZ0YbFTNVO8aBreyT61UGTy9NRXZYfYDyw1No8Hg==
X-Google-Smtp-Source: AAOMgpdKGDEiEZ5GiI4UQ00XinQ888E8XJI7RGkH64dq+UMl9FgOhY7qm8zSbZPFfBZlfgHAFPgT2Z/J1jJsZpL8z4s=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr28952774oia.170.1531219341303; 
	Tue, 10 Jul 2018 03:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 03:42:00
	-0700 (PDT)
In-Reply-To: <CAJTo0LZRfP9XGEvGV2_7ZPST8W94b51n=MaweKND3SpoS80P_g@mail.gmail.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
	<CAJTo0LZRfP9XGEvGV2_7ZPST8W94b51n=MaweKND3SpoS80P_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 11:42:00 +0100
Message-ID: <CAJTo0La5PE5cnhrn7X0Tc=TmRPYL8BAxpkT5-4+uh-1OJ4TFvg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] ethtool:4.16 -> 4.17
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
X-List-Received-Date: Tue, 10 Jul 2018 10:42:20 -0000
Content-Type: text/plain; charset="UTF-8"

(the refresh was trivial so I've done this)

On 10 July 2018 at 11:38, Burton, Ross <ross.burton@intel.com> wrote:
> WARNING: ethtool-4.17-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch avoid_parallel_tests.patch
> patching file configure.ac
> Hunk #1 succeeded at 2 with fuzz 1.
>
> Now at patch avoid_parallel_tests.patch
>
> On 10 July 2018 at 03:42, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>> Upgrade ethtool from 4.16 to 4.17
>>
>> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
>> ---
>>  meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} (88%)
>>
>> diff --git a/meta/recipes-extended/ethtool/ethtool_4.16.bb b/meta/recipes-extended/ethtool/ethtool_4.17.bb
>> similarity index 88%
>> rename from meta/recipes-extended/ethtool/ethtool_4.16.bb
>> rename to meta/recipes-extended/ethtool/ethtool_4.17.bb
>> index 5ccb162..844a958 100644
>> --- a/meta/recipes-extended/ethtool/ethtool_4.16.bb
>> +++ b/meta/recipes-extended/ethtool/ethtool_4.17.bb
>> @@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
>>             file://avoid_parallel_tests.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "2b50adf06fc1b033951edef5987c32f3"
>> -SRC_URI[sha256sum] = "25f8fc3a4b2cb2cbfe8741148d8e743127dd7c951df96d8d6dccb88741f8a27d"
>> +SRC_URI[md5sum] = "4dba0345a4ab9f51b4a4a9739284238d"
>> +SRC_URI[sha256sum] = "4130142a15f7409d18de3667998f3c99fba52fd7c8d94be7ecdabf8dcab3d6c1"
>>
>>  inherit autotools ptest
>>  RDEPENDS_${PN}-ptest += "make"
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

