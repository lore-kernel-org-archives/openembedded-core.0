Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ty7wN-000532-98
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 22:33:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2013 13:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,523,1355126400"; d="scan'208";a="251375279"
Received: from unknown (HELO [10.255.15.108]) ([10.255.15.108])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2013 13:17:29 -0800
Message-ID: <51005369.70401@linux.intel.com>
Date: Wed, 23 Jan 2013 13:17:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Belal, Awais" <Awais_Belal@mentor.com>
References: <2021B186DC632746BD5A3CE32F12BD289FCCF37B@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD289FCCF37B@EU-MBX-03.mgc.mentorg.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Openssl - config file not being pulled in on the install
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
X-List-Received-Date: Wed, 23 Jan 2013 21:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 12:10 PM, Belal, Awais wrote:
> Hi Guys,
>
> This probably went un-noticed because I forgot to put a subject the
> first time around... my bad!
>
> I have a question regarding openssl. The openssl.inc file under the poky
> package creates a -misc package which is not directly installed unless
> either put in RDPENEDS or RRECOMMENDS. This package (-misc) contains the
> openssl configuration file which is required while generating
> certificates on the target otherwise the command says:
> /
> WARNING: can't open config file: /usr/lib/ssl/openssl.cnf//
> Unable to load config info from /usr/lib/ssl/openssl.cnf//
> /
>
> In an older version of the recipe attached here, the correct method is
> being (this is my understanding) to get that file in on the target while
> installing.
>
> Any guidance here would be much appreciated.
>
Based on reading some of the history and such, I think the best answer 
would be to move the openssl.cnf file to FILES_${PN} line, since 
ordering wise it will get pick up that file and it is needed, not 
recommeded.

We would welcome a tested patch.

Thanks
Sau!

> BR,
> Awais Belal
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


