Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpMsc-0001N6-Qq
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 17:36:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2012 08:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99639041"
Received: from unknown (HELO [10.255.14.82]) ([10.255.14.82])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2012 08:28:41 -0800
Message-ID: <4F1D8AB8.9000400@linux.intel.com>
Date: Mon, 23 Jan 2012 08:28:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<4236e557f38c0e4c3e7088fd528face5b74f60a8.1327123057.git.sgw@linux.intel.com>
	<1327264221.2859.2.camel@pb-ThinkPad-R50e>
In-Reply-To: <1327264221.2859.2.camel@pb-ThinkPad-R50e>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 18/20] eglibc: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 16:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2012 12:30 PM, Phil Blundell wrote:
> On Fri, 2012-01-20 at 21:18 -0800, Saul Wold wrote:
>> @@ -54,6 +56,7 @@ RDEPENDS_${PN}-utils += "bash"
>>   FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>>   FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>>   RPROVIDES_${PN}-dev += "libc-dev"
>> +RPROVIDES_${PN}-dev += "libc-staticdev"
>
> Is that really what you wanted?
>
> More generally, I'm not very convinced that all these RPROVIDES in the
> eglibc recipes are serving any useful purpose anymore.  I think we
> should be trying to get rid of them, not adding new ones.  Does anybody
> know of anything which currently depends on them?
>
Nothing in OE-Core, meta-oe or OE Classic seems to depend on these, but 
I thought part of that was the translation from eglibc to the generic "libc"

Sau!



> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


