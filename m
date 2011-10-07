Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RCDT4-0005jI-Pm
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 18:40:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Oct 2011 09:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,503,1312182000"; d="scan'208";a="24213719"
Received: from unknown (HELO [10.255.14.198]) ([10.255.14.198])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Oct 2011 09:34:33 -0700
Message-ID: <4E8F2A19.4030808@linux.intel.com>
Date: Fri, 07 Oct 2011 09:34:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1317996588.2405.18.camel@ted>
In-Reply-To: <1317996588.2405.18.camel@ted>
Subject: Re: Convoluted dependencies
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
X-List-Received-Date: Fri, 07 Oct 2011 16:40:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2011 07:09 AM, Richard Purdie wrote:
> I've been trying to figure out why our builds take as long as they do.
> It appears our dependency chains are getting more and more convoluted
> and this certainly isn't helping things. Specific pain points look like:
>
> bison-native ->  gettext-native
> flex-native ->  gettext-native
> (which limits binutils-cross)
>
> gettext-native ->  libxml2-native ->  python-native
> (hence gettext takes a *long* time to be built)
> What uses the python xml bindings?
>
I thought that by having the --with-included-libxml, we got rid of the 
libxml2-native dependency, we should investigate that further.

Digging shows that it is needed for python to create the xml2po tool for 
doc translation.

Sau!


> pseudo-native ->  sqlite3-native
> (dragging out the time our effectively single threaded init takes)
>
> I'm mentioning this in case anyone has good ideas for fixing some of
> these...
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


