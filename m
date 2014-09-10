Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A154165CC9
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 06:29:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8A6StDr022387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Sep 2014 23:28:55 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 23:28:54 -0700
Message-ID: <540FEFA4.6030109@windriver.com>
Date: Wed, 10 Sep 2014 14:28:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
References: <D034EC78.A7DD4%dvhart@linux.intel.com>
In-Reply-To: <D034EC78.A7DD4%dvhart@linux.intel.com>
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: Re: Packaging kernel sources
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
X-List-Received-Date: Wed, 10 Sep 2014 06:29:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Good idea, how about use the name linux-source, but add "custom"
in the summary or description.

// Robert

On 09/10/2014 08:42 AM, Darren Hart wrote:
> Hi all,
>
> I'm working on a project which needs to have the full kernel sources
> installed on the target. The kernel-dev package as defined by
> kernel.bbclass is heavily pruned to minimize packaging time and size and
> is intended to enable building of external modules on the target.
>
> Is there an accepted best-practice for how to get the full source packaged
> and installed? I can easily write a new recipe,
> linux-custom-source_git.bb, to install the sources, for example, without
> impacting the packaging time of "virtual/kernel" package.
>
> It would be nice in some respects for it to all come from the same recipe
> though, but I suspect the impact to the common-case where this is not need
> would be far too great.
>
> Koen, I believe you had a solution for this with Angstrom?
>

