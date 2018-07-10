Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD9FA6FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:38:47 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n84-v6so41653251oib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JgvNa7DXXIAl2Pz3ZMnaixE9rjkELY6SOvDfPQpy3uc=;
	b=kuHG8ckJCSG5Og7Xc24xdvIDny/JuAvGf+1HA05CB+zPE5vhCab/chksirGYE4dGC+
	wcofy7SGMfQSpMJBbIEa3H+QCfDClJUtkTuZylnxMQN1wuWy3sT3pg9607KnhNRrtg7v
	APJh1qvMebadoWoqf124tUHPH8E7fQrzxMo1Vo3kZryje8dT01I3AACpOVwMZl1HaB3K
	HvflrwqKivJV1nPPRE8/SdX7Nx30vh7VkzQ+LnF5Vtep44hzu2iBcwKuysXm6eSL2R/o
	zKTtvV+lnERh2IXoLCW4lwLrnbsxyeG0lwZossTZcNEVxWvyFmvFodN4uETCiI+1dSkm
	c/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JgvNa7DXXIAl2Pz3ZMnaixE9rjkELY6SOvDfPQpy3uc=;
	b=t6+1LzUB6eNJQPv671bw97TMcwDwsjzx4hrUZVWlEM9tLsvtEbWah7FCZiwlgnhDOi
	FqXJwQeHY3AmTtJMmsS4uyOC1BX9CXKCXKOrup7bfwXRMVrHv9s13b2IbNUAsqhgRjhS
	ExzOdjf7SqtYrcD50krvsoIkQhXnMQ3BDENbUm+EuUJyxo45oUJI5AiAiGA6Rm9n6aN7
	pFZvAYQzbyUnHsf76voJVsfus95NT4Mz1v3BzB0eD1F43yLmNs/OgzzUzZV6wyDdvT4X
	NtQO8oSz0vHLLowWgYm8ikPYEK3dpSDGsaMTRp6OfQ1xyM7s+BR2q0BCLs6YQBbD4trq
	HU6Q==
X-Gm-Message-State: AOUpUlGrGnYc/MoNC9hFCp9O/m20cTwTM3z9ZP50U3F8e0XSCyQfueXL
	llp1CXI+HKwLMZ87PSaX5deuHg0DSJzJ9iaZiDrFYA==
X-Google-Smtp-Source: AAOMgpdmkbjtJoZ7eXTL/a6omXR/p4bJSdbcBqCiwb0LCXAOzPPbt1kF2WlXLKi+MFXSuhRxnLjty3zVQVO1kxqSBnE=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr1651924oia.18.1531219129061; 
	Tue, 10 Jul 2018 03:38:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 03:38:28
	-0700 (PDT)
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 11:38:28 +0100
Message-ID: <CAJTo0LZRfP9XGEvGV2_7ZPST8W94b51n=MaweKND3SpoS80P_g@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Jul 2018 10:38:48 -0000
Content-Type: text/plain; charset="UTF-8"

WARNING: ethtool-4.17-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch avoid_parallel_tests.patch
patching file configure.ac
Hunk #1 succeeded at 2 with fuzz 1.

Now at patch avoid_parallel_tests.patch

On 10 July 2018 at 03:42, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade ethtool from 4.16 to 4.17
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/ethtool/{ethtool_4.16.bb => ethtool_4.17.bb} (88%)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_4.16.bb b/meta/recipes-extended/ethtool/ethtool_4.17.bb
> similarity index 88%
> rename from meta/recipes-extended/ethtool/ethtool_4.16.bb
> rename to meta/recipes-extended/ethtool/ethtool_4.17.bb
> index 5ccb162..844a958 100644
> --- a/meta/recipes-extended/ethtool/ethtool_4.16.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_4.17.bb
> @@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
>             file://avoid_parallel_tests.patch \
>             "
>
> -SRC_URI[md5sum] = "2b50adf06fc1b033951edef5987c32f3"
> -SRC_URI[sha256sum] = "25f8fc3a4b2cb2cbfe8741148d8e743127dd7c951df96d8d6dccb88741f8a27d"
> +SRC_URI[md5sum] = "4dba0345a4ab9f51b4a4a9739284238d"
> +SRC_URI[sha256sum] = "4130142a15f7409d18de3667998f3c99fba52fd7c8d94be7ecdabf8dcab3d6c1"
>
>  inherit autotools ptest
>  RDEPENDS_${PN}-ptest += "make"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

