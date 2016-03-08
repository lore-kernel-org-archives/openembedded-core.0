Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EED9662136
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 22:01:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 14:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,558,1449561600"; d="scan'208";a="760528336"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga003.jf.intel.com with ESMTP; 08 Mar 2016 14:01:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 09 Mar 2016 11:01:43 +1300
Message-ID: <10266506.VF7A6qpapW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] recipetool create improvements
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
X-List-Received-Date: Tue, 08 Mar 2016 22:02:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 08 Mar 2016 18:35:59 Paul Eggleton wrote:
> Improvements to the following areas of recipetool create:
> * License detection
> * Autotools program mapping and spacing in macro regexes
> * npm module handling
> 
> 
> The following changes since commit 0d02159c8d66bb136f7da2c10fda7d1a57f40cec:
> 
>   image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:01:16
> +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/recipetool3
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/recipetool3
> 
> Paul Eggleton (6):
>   recipetool: create: be more tolerant of spacing in configure.ac
>   recipetool: create: improve mapping for autotools program macros
>   recipetool: create: match *LICENSE* as a license file
>   recipetool: create: add license file crunching
>   recipetool: create: split npm module dependencies into packages
>   recipetool: create: check if npm available if npm:// URL specified

Hmm, I discovered a bug and a deficiency with patch 5/6, as well as some 
problems with the npm fetcher itself. I'll send a new series for the former 
today, as well as  some patches to the bitbake list for the latter.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

