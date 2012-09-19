Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEMR7-0000Ut-Rm
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:43:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 08:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="207939972"
Received: from unknown (HELO [10.252.121.202]) ([10.252.121.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2012 08:30:54 -0700
Message-ID: <5059E52D.9030408@intel.com>
Date: Wed, 19 Sep 2012 18:30:53 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<854e4261283991cdc56f176c6f97dee9acf718fd.1348052899.git.laurentiu.palcu@intel.com>
	<CAJTo0La4o60k728vHB11Kv8yae4KpMStSS9iq9WLBCGzDc3ZXQ@mail.gmail.com>
In-Reply-To: <CAJTo0La4o60k728vHB11Kv8yae4KpMStSS9iq9WLBCGzDc3ZXQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 6/7] sato-icon-theme: make use of the gtk-icon-cache postinst scriptlet
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
X-List-Received-Date: Wed, 19 Sep 2012 15:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/19/2012 04:36 PM, Burton, Ross wrote:
> On 19 September 2012 12:49, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>>  SECTION = "x11"
>> -DEPENDS = ""
>> +DEPENDS = "gtk+-native"
> 
> This recipe doesn't directly need gtk+-native, the class does and that
> already adds gtk+-native to the dependencies.
Didn't notice that... Thanks for spotting it.

Laurentiu
> 
> Ross
> 


