Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A189F6B5DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:10:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2014 05:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,685,1389772800"; d="scan'208";a="501932214"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.192])
	by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2014 05:09:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 19 Mar 2014 12:09:48 +0000
Message-ID: <1728094.yUuhkgzBIz@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <82dfd76f1ebe7801ed08efc1d93f91d73df5a035.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<82dfd76f1ebe7801ed08efc1d93f91d73df5a035.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] archiver.bbclass: move a few code to copyleft_compliance.bbclass
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
X-List-Received-Date: Wed, 19 Mar 2014 12:10:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 March 2014 01:08:22 Robert Yang wrote:
> Move the code which is only used by copyleft_compliance.bbclass from
> archiver.bbclassc, and remove the "inherit archiver" from
> copyleft_compliance.bbclass.
> 
> The archiver.bbclass is used for archiving various types of sources, but
> the copyleft_compliance.bbclass is used for analysing the license, they
> don't have much relationships.
> 
> [YOCTO #4986]
> [YOCTO #5113]

I can see the benefit of tidying this up, however I think it's still desirable 
for archiver.bbclass to have the ability to filter the recipes that it archives 
by LICENSE value, so that you can easily exclude archiving proprietary sources 
if you wish. At the moment it doesn't seem like there's an easy way even to 
disable archiving on an individual recipe basis.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

