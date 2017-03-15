Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E96CB7769E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:17:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2F2HHvD015190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 19:17:17 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 19:17:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
	<d4e6c7a11c3936ca2b30246c88452b441022c297.1489481108.git.liezhi.yang@windriver.com>
	<CAJTo0LYUhAOgDrOuB6FNwp2dPyxFFZCHHd5KjxvyUKz-+hdKmg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <35040ed6-0a66-c458-0c43-cbf649804f95@windriver.com>
Date: Wed, 15 Mar 2017 10:17:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYUhAOgDrOuB6FNwp2dPyxFFZCHHd5KjxvyUKz-+hdKmg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] guile: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Wed, 15 Mar 2017 02:17:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2017 08:06 PM, Burton, Ross wrote:
>
> On 14 March 2017 at 08:45, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +# Fix "Argument list too long" error when len(TMPDIR) = 410
>     +acpaths = "-I ./m4"
>
>
> If we're fixing this in various recipes, why not fix in autotools.bbclass directly?

We had tried this about 3 years, but failed since the m4 files may not in
./m4, and the worse is that it may in sub directory, RP didn't think that
set it in autotools.bbclass is a good idea, so we fix the recipe one by one.

// Robert

>
> Ross

