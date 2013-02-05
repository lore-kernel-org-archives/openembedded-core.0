Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2lVJ-00051O-6V
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:36:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2013 08:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="281249108"
Received: from unknown (HELO envy.home) ([10.255.12.134])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 08:20:16 -0800
Message-ID: <51113140.5050600@linux.intel.com>
Date: Tue, 05 Feb 2013 08:20:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Enigmail-Version: 1.5
Cc: Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:36:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 03:16 AM, Enrico Scholz wrote:
> 
> 
> Darren Hart <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> 
>> +	$NC -X connect $*
> 
> why '$*' but not '"$@*"'?
> 
> 
>> +$NC $METHOD $*
> 
> ditto

I'm not familiar with $@*

As for $* versus $@, the issue is how the arguments are presented. $* as
a single word, $@ each argument is quoted separately. I believe I ran
into issues with $@. I haven't had any trouble with $*. Is there a
particular use case where you can see this failing as is?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


