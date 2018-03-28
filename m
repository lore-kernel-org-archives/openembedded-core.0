Return-Path: <luca@lucaceresoli.net>
X-Greylist: delayed 937 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Mar 2018 15:11:04 UTC
Received: from srv-hp10-72.netsons.net (srv-hp10-72.netsons.net [94.141.22.72])
	by mail.openembedded.org (Postfix) with ESMTP id 06F39785A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:11:04 +0000 (UTC)
Received: from [109.168.11.45] (port=45982 helo=[192.168.101.172])
	by srv-hp10.netsons.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <luca@lucaceresoli.net>)
	id 1f1CU1-001Tbf-Ut; Wed, 28 Mar 2018 16:55:26 +0200
To: Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-core@lists.openembedded.org
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <3689ac97-558e-0d2a-5a91-4b25f9feb622@lucaceresoli.net>
Date: Wed, 28 Mar 2018 16:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180129174724.26768-1-niko.mauno@vaisala.com>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv-hp10.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: srv-hp10.netsons.net: authenticated_id:
	luca@lucaceresoli.net
X-Authenticated-Sender: srv-hp10.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Wed, 28 Mar 2018 15:11:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 29/01/2018 18:47, Niko Mauno wrote:
> This mitigates following issues during u-boot do_compile() step --
> otherwise, if comm is not available, they are quietly ignored:
> 
>   .../scripts/check-config.sh: line 33: comm: command not found
>   .../scripts/check-config.sh: line 39: comm: command not found

In current U-Boot master (since [0]), the absence of 'comm' is not
silently ignored but rather causes a build failure.

Thus I think this patch should be cherry-picked on the stable yocto
branches. Otherwise people using a post-2018.3 U-Boot will see their
builds fail and will have to find out on their own how to fix it.

[0]
http://git.denx.de/?p=u-boot.git;a=commit;h=f69dce5081396a83b87d6df2693764b99466a18d

-- 
Luca

