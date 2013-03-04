Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCTyy-0003Lb-Ud
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:55:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Mar 2013 03:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,778,1355126400"; d="scan'208";a="208525108"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Mar 2013 03:38:34 -0800
Message-ID: <513487B9.8000502@intel.com>
Date: Mon, 04 Mar 2013 13:38:33 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
	<CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
	<1362394572.29587.10.camel@ted> <20130304111337.GG3268@jama>
In-Reply-To: <20130304111337.GG3268@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 11:55:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/04/2013 01:13 PM, Martin Jansa wrote:
> On Mon, Mar 04, 2013 at 10:56:12AM +0000, Richard Purdie wrote:
>> On Mon, 2013-03-04 at 11:51 +0100, Martin Jansa wrote:
>>> Shouldn't this list be defined in layer.conf like
>>> SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that
>>> list?
>>
>> I'm hoping we only have very small list of these problematic
>> dependencies. If we end up with a large number of them then yes, we'd
>> need to abstract it but I'd prefer to avoid that unless proven
>> necessary.
>>
>> Is there a specific case you have in mind?
> 
> Isn't systemd-systemctl-native another candidate to be included?
> 
It looks like it should be in the list... I'll resend a new version.

Thanks,
Laurentiu


