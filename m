Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3881070018
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:20:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T9KP57005435
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Sep 2016 02:20:25 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 02:20:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1475139494.git.liezhi.yang@windriver.com>
	<b1a11a1060394d0fb65c80eaeee5a64fbeae9811.1475139494.git.liezhi.yang@windriver.com>
	<CAJTo0LYth5as9Od3v7S-L8d5C5RVSghwdPkmKtSgEW3iQ_gFUA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0667a486-d5ba-0fe8-f9c1-59e69e7b800d@windriver.com>
Date: Thu, 29 Sep 2016 17:20:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYth5as9Od3v7S-L8d5C5RVSghwdPkmKtSgEW3iQ_gFUA@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 09:20:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/29/2016 05:10 PM, Burton, Ross wrote:
>
> On 29 September 2016 at 10:02, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -EXTRA_OECONF = "--with-boost=${PKG_CONFIG_SYSROOT_DIR}/${prefix}"
>     +EXTRA_OECONF = "--with-boost=yes
>     --with-boost-libdir=${PKG_CONFIG_SYSROOT_DIR}${libdir}"
>
>
> PKG_CONFIG_SYSROOT_DIR is the wrong variable to use here as that's explicitly
> for pkg-config to know what the current sysroot is.  Use STAGING_DIR_TARGET
> explicitly.

I derived it from the old code, thanks, will update xcb-proto, too.

>
> Ross

