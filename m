Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwKBL-0005zl-Il
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 23:13:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 13:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,495,1355126400"; d="scan'208";a="245774866"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 13:57:36 -0800
Message-ID: <50F9C550.5040507@linux.intel.com>
Date: Fri, 18 Jan 2013 13:57:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1301181633360.23942@oneiric>
	<20130118214509.GC29386@jama.palm1.palmone.com>
In-Reply-To: <20130118214509.GC29386@jama.palm1.palmone.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means PROV_class-native = ""?
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
X-List-Received-Date: Fri, 18 Jan 2013 22:13:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 01:45 PM, Martin Jansa wrote:
> On Fri, Jan 18, 2013 at 04:35:34PM -0500, Robert P. J. Day wrote:
>>
>>    perusing oe-core for examples to demonstrate the concept of
>> "PROVIDES =", and i ran across this in recipes-devtools/dpkg/dpkg.inc:
>>
>> PROV = "virtual/update-alternatives"
>> PROV_class-native = ""
>
> PROV is variable with no special meaning
> class-native is standard override for native recipe (like
> virtclass-native was before).
>
>> PROVIDES += "${PROV}"
>>
>>    i'm not sure what to make of that -- what's the purpose of assigning
>> to PROV, then subsequently assigning to PROVIDES, but with that
>>
>> PROV_class-native = ""
>>
>> line in between?  i did a grep and saw nothing else like it throughout
>> oe-core.
>>
I believe that idea is since it's PROVIDES += , not a straight 
assignment like = it's not a simple to override with the +=, so for the 
target case PROVIDE the virtual/u-a, but not for the native case of that 
package.

If it was a straight assignment (using =) the ${PROV} would not be needed.

Sau!

>> rday
>>
>> --
>>
>> ========================================================================
>> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>>                          http://crashcourse.ca
>>
>> Twitter:                                       http://twitter.com/rpjday
>> LinkedIn:                               http://ca.linkedin.com/in/rpjday
>> ========================================================================
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


