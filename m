Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4293560124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 15:17:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB7FHZMf025464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 7 Dec 2015 07:17:35 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Dec 2015 07:17:34 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Matt Madison <matt@madison.systems>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
	<CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
	<CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
	<CAJTo0LYNtGDhyZLJnRum7XveZJ4eG1m6wvgTe8H3Sb9fpburUg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5665A30D.7010306@windriver.com>
Date: Mon, 7 Dec 2015 09:17:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYNtGDhyZLJnRum7XveZJ4eG1m6wvgTe8H3Sb9fpburUg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Mon, 07 Dec 2015 15:17:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 12/7/15 8:01 AM, Burton, Ross wrote:
> 
> On 6 December 2015 at 18:22, Matt Madison <matt@madison.systems
> <mailto:matt@madison.systems>> wrote:
> 
>     Close, but not quite, I think.  It doesn't look like it addresses the
>     ordering mismatch that occurs due to the -vfp include being processed
>     before the -neon include, resulting vfpv4 preceding neon in
>     ARMPKGSFX_FPU when both are enabled.
> 
> 
> Martin's patch is in my ross/mut branch so will be in master soon, can you
> rebase these patches please?
> 
> Ross
> 
> 

I would prefer we fix the package extra arch, and leave the ARMPKGSFX_FPU alone.
 I believe that order is correct.

--Mark

