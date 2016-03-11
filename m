Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECC5D6FF84;
	Fri, 11 Mar 2016 15:41:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2BFfg5E004175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Mar 2016 07:41:42 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 11 Mar 2016 07:41:42 -0800
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
References: <20160310115301.GC2573@jama>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56E2E731.1040005@windriver.com>
Date: Fri, 11 Mar 2016 09:41:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160310115301.GC2573@jama>
Subject: Re: State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 15:41:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/16 5:53 AM, Martin Jansa wrote:
> Aggressive PNBLACKLISTing continues. But linux-yocto (and modules depending on it)
> are still broken :/.
> 
> I'll look at cef3 and chromium issue, my recent patch for meta-browser
> fixed the build for armv7a MACHINEs, so it probably needs to be extended
> a bit to cover warnings in x86 and then duplicate the same to cef3.
> This issue is there for so long, slowing down the builds significantly
> (and causing logs to be much bigger) - I don't use these recipes but I
> hate the failures even more.
> 

Is see the reported log failure, but I've been building with the oe-core and
poky linux-yocto head of master for the last couple weeks, all arches includes
qemux86.

I don't see the error on my builder.  Is something changing the default
recipe/kernel configuration triggering the fault?

--Mark

> === qemux86 (2) ===
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb, do_compile
>     * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_compile



