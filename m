Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 868D360291
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 08:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v34800qU018023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Apr 2017 01:00:00 -0700 (PDT)
Received: from [128.224.5.140] (128.224.5.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 4 Apr 2017 00:59:59 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
	<15fc06fcec149b142965c862627800936401b469.1490705726.git.bruce.ashfield@windriver.com>
	<CA+chaQfi=8hN61YovW-qfwPuvYJJqsFNBujC2RPp_2Nyn-sAnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
Date: Tue, 4 Apr 2017 09:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfi=8hN61YovW-qfwPuvYJJqsFNBujC2RPp_2Nyn-sAnA@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] linux-yocto: drop 4.8 recipes
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
X-List-Received-Date: Tue, 04 Apr 2017 08:00:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Adding Saul, since he mentioned that the defaults for x86 had
changed .. but now that I think about it, it was in the context
of the h/w reference boards.

Either way, I can take care of it .. I had thought that it was
already done, but the patch is simple to bump the default.

Bruce

On 04/04/2017 09:56 AM, Martin Jansa wrote:
> What about updating preferred version, so that each build doesn't start
> with this very nice output?
>
> meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=
> "4.8%"
> meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??= "4.8%"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version 4.8% of linux-yocto not available (for item virtual/kernel)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-raid456)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nfsd)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-log-ipv4)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-autofs4)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-nat)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-rtc-dev)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-loop)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-bnep)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ip-tables)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-cdc-acm)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-iptable-filter)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-rtc-sysfs)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-gadgetfs)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-addrtype)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-conntrack)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nfs)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-hci-uart)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-g-file-storage)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-g-mass-storage)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ieee80211-crypt)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-sha256-generic)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ieee80211-crypt-tkip)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-michael-mic)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-fuse)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-x-tables)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-hwlat-detector)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nls-utf8)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-cdc-wdm)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-aes-generic)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-aufs)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-uinput)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-pxa27x_udc)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-tun)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-cryptomgr)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-aufs-native)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-log-common)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ipt-masquerade)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-crc32c)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-hidp)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-raid1)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-arc4)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-raid10)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-zram)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ieee80211-crypt-ccmp)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-log-ipv6)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-iptable-raw)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ebtables)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ecb)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-aoe)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-unix)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-snd-mixer-oss)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-snd-pcm-oss)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-sco)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-linear)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-iscsi-trgt)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ipsec)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-tables)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-xts)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-conntrack-ipv6)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-base)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-rfcomm)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-hci-vhci)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-md5)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ieee80211-crypt-wep)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-binfmt-misc)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-limit)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-cifs)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-cbc)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-crypto_algapi)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-softdog)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-l2cap)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-raid0)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-modules)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-bridge)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-g-ether)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-bluetooth)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-recent)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-conntrack-ipv4)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-aes)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nfc)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-libcrc32c)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-input)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-vmlinux)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-log)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-iptable-mangle)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-iptable-nat)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-rtc-proc)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-dm-crypt)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-g-serial)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-image-zimage)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-ipv6)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
> NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-nf-defrag-ipv4)
> NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
>
>
> On Tue, Mar 28, 2017 at 2:58 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     We have 4.1 (LTSI), 4.4 (LTS), 4.9 (LTS/LTSI) and 4.10 available in
>     master. 4.8 is no longer required, so we drop the recipe to keep
>     the version selection under control.
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>>
>     ---
>      meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>     <http://linux-yocto-rt_4.8.bb>   | 38 --------------------
>      meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>     <http://linux-yocto-tiny_4.8.bb> | 25 -------------
>      meta/recipes-kernel/linux/linux-yocto_4.8.bb
>     <http://linux-yocto_4.8.bb>      | 44 -----------------------
>      3 files changed, 107 deletions(-)
>      delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>     <http://linux-yocto-rt_4.8.bb>
>      delete mode 100644
>     meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>     <http://linux-yocto-tiny_4.8.bb>
>      delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.8.bb
>     <http://linux-yocto_4.8.bb>
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>     <http://linux-yocto-rt_4.8.bb>
>     b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>     <http://linux-yocto-rt_4.8.bb>
>     deleted file mode 100644
>     index f99f200598d3..000000000000
>     --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>     <http://linux-yocto-rt_4.8.bb>
>     +++ /dev/null
>     @@ -1,38 +0,0 @@
>     -KBRANCH ?= "standard/preempt-rt/base"
>     -
>     -require recipes-kernel/linux/linux-yocto.inc
>     -
>     -# Skip processing of this recipe if it is not explicitly specified
>     as the
>     -# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>     -# to build multiple virtual/kernel providers, e.g. as dependency of
>     -# core-image-rt-sdk, core-image-rt.
>     -python () {
>     -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>     "linux-yocto-rt":
>     -        raise bb.parse.SkipPackage("Set
>     PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>     -}
>     -
>     -SRCREV_machine ?= "ffd0a071c2df55ecb2bb1f101465df93a81093b5"
>     -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
>     -
>     -SRC_URI =
>     "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine
>     <http://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine>
>     \
>     -
>      git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}
>     <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}>"
>     -
>     -LINUX_VERSION ?= "4.8.18"
>     -
>     -PV = "${LINUX_VERSION}+git${SRCPV}"
>     -
>     -KMETA = "kernel-meta"
>     -KCONF_BSP_AUDIT_LEVEL = "2"
>     -
>     -LINUX_KERNEL_TYPE = "preempt-rt"
>     -
>     -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>     -
>     -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>     -
>     -# Functionality flags
>     -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>     features/taskstats/taskstats.scc"
>     -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>     -KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>     -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>     -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>     diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>     <http://linux-yocto-tiny_4.8.bb>
>     b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>     <http://linux-yocto-tiny_4.8.bb>
>     deleted file mode 100644
>     index 18ef51788fd3..000000000000
>     --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>     <http://linux-yocto-tiny_4.8.bb>
>     +++ /dev/null
>     @@ -1,25 +0,0 @@
>     -KBRANCH ?= "standard/tiny/common-pc"
>     -LINUX_KERNEL_TYPE = "tiny"
>     -KCONFIG_MODE = "--allnoconfig"
>     -
>     -require recipes-kernel/linux/linux-yocto.inc
>     -
>     -LINUX_VERSION ?= "4.8.18"
>     -
>     -KMETA = "kernel-meta"
>     -KCONF_BSP_AUDIT_LEVEL = "2"
>     -
>     -SRCREV_machine ?= "db2e91ce904f32347ccf739de969b4216cbcaf92"
>     -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
>     -
>     -PV = "${LINUX_VERSION}+git${SRCPV}"
>     -
>     -SRC_URI =
>     "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine
>     <http://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine>
>     \
>     -
>      git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}
>     <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}>"
>     -
>     -COMPATIBLE_MACHINE = "(qemux86$)"
>     -
>     -# Functionality flags
>     -KERNEL_FEATURES = ""
>     -
>     -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>     diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>     <http://linux-yocto_4.8.bb>
>     b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>     <http://linux-yocto_4.8.bb>
>     deleted file mode 100644
>     index 4c89183a3512..000000000000
>     --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>     <http://linux-yocto_4.8.bb>
>     +++ /dev/null
>     @@ -1,44 +0,0 @@
>     -KBRANCH ?= "standard/base"
>     -
>     -require recipes-kernel/linux/linux-yocto.inc
>     -
>     -# board specific branches
>     -KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
>     -KBRANCH_qemuarm64 ?= "standard/qemuarm64"
>     -KBRANCH_qemumips ?= "standard/mti-malta32"
>     -KBRANCH_qemuppc  ?= "standard/qemuppc"
>     -KBRANCH_qemux86  ?= "standard/base"
>     -KBRANCH_qemux86-64 ?= "standard/base"
>     -KBRANCH_qemumips64 ?= "standard/mti-malta64"
>     -
>     -SRCREV_machine_qemuarm ?= "c0123490bb9b454a43c3573e2573b491e0c09701"
>     -SRCREV_machine_qemuarm64 ?= "304f750aa5be0bf66f70720d68f16865d912ff9f"
>     -SRCREV_machine_qemumips ?= "aa15b7a291ca18d08fd640932efad673f6b278c3"
>     -SRCREV_machine_qemuppc ?= "d2c3ea488fe179898ae853cb9565cb7ac62291c6"
>     -SRCREV_machine_qemux86 ?= "c50f695341260d4757af64d809390610aae213e1"
>     -SRCREV_machine_qemux86-64 ?= "c50f695341260d4757af64d809390610aae213e1"
>     -SRCREV_machine_qemumips64 ?= "40a880b0f21aa09f3b52d68969339d80f9cc10ad"
>     -SRCREV_machine ?= "c50f695341260d4757af64d809390610aae213e1"
>     -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
>     -
>     -SRC_URI =
>     "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}
>     <http://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}>;
>     \
>     -
>      git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}
>     <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}>"
>     -
>     -LINUX_VERSION ?= "4.8.18"
>     -
>     -PV = "${LINUX_VERSION}+git${SRCPV}"
>     -
>     -KMETA = "kernel-meta"
>     -KCONF_BSP_AUDIT_LEVEL = "2"
>     -
>     -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>     -
>     -COMPATIBLE_MACHINE =
>     "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>     -
>     -# Functionality flags
>     -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>     -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>     -KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>     -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>     -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>     -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
>     "mx32", " cfg/x32.scc", "" ,d)}"
>     --
>     2.5.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


