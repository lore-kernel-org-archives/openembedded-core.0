Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXdYb-0000i5-H9
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 20:14:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2011 11:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,382,1304319600"; d="scan'208";a="16322581"
Received: from unknown (HELO [10.255.13.7]) ([10.255.13.7])
	by orsmga001.jf.intel.com with ESMTP; 17 Jun 2011 11:10:43 -0700
Message-ID: <4DFB98A2.9040303@intel.com>
Date: Fri, 17 Jun 2011 11:10:42 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308249837.git.scott.a.garman@intel.com>	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>	<4DFA97A1.9090909@gmail.com>
	<4DFB820B.9070303@intel.com>	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>	<4DFB8CAE.8030100@intel.com>
	<BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>
In-Reply-To: <BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic	login.defs options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2011 18:14:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2011 10:22 AM, Otavio Salvador wrote:
> On Fri, Jun 17, 2011 at 17:19, Scott Garman<scott.a.garman@intel.com>  wrote:
>> Sorry, I forgot to mention that shadow-utils-native is what is used to
>> modify the passwd/group files in the target sysroot. It seems that having a
>> -native recipe install files into a target sysroot would be worse than
>> including an optional file with base-passwd that may or may not be used in
>> target systems.
>
> Why not make an shadow-target package with this?

To just install a login.defs file? I'm open to it if a few more people 
think this is a better idea.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


