Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE5E782EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:45:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vARFjjbg022906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:45:45 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 27 Nov 2017 07:45:44 -0800
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <59914a6c-c977-608e-b6eb-1f9167af3a59@windriver.com>
Date: Mon, 27 Nov 2017 09:45:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>
Subject: Re: backfill mechanism
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
X-List-Received-Date: Mon, 27 Nov 2017 15:45:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/17/17 5:32 PM, Slater, Joseph wrote:
> The backfill mechanism is not compatible with multilib.  This could possibly be
> fixed, but the backfill_considered functionality is also obscure, so I think in
> at least the machine related .inc files we should replace lines like
> 
>  
> 
> MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
> 

This not working with multilibs is definitely a bug that we need to file with
the community.  We can use the stuff below as a workaround.  But all features
should work properly with the multilib configurations.

Please open a bug in the Yocto System and our own (pointing to the YP bugzilla)
so we can at the minimum track this.

--Mark

> 
> with lines like
> 
>  
> 
> MACHINE_FEATURES_remove_mipsarchn32 = " qemu-usermode"
> 
>  
> 
> There are two advantages:  the second line works for multilib, and it is far
> more readable.
> 
>  
> 
> Joe
> 
>  
> 


