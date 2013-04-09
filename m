Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPaUE-0008Dn-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:29:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2013 08:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="292395465"
Received: from unknown (HELO [10.255.14.7]) ([10.255.14.7])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2013 08:11:59 -0700
Message-ID: <51642FBF.6000401@linux.intel.com>
Date: Tue, 09 Apr 2013 08:11:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
	<51630510.7080105@linux.intel.com>
	<CAJ2CSBtXbDgz76Ryt8tqR+dbeLvLXsWL_F1W8WWVnJyDE=g8WA@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16220ADC@IRSMSX102.ger.corp.intel.com>
	<CAJTo0LYCixkUhvQDSKN4VEFZJwCfKfQ1AEKWsT=MML20C99kUw@mail.gmail.com>
In-Reply-To: <CAJTo0LYCixkUhvQDSKN4VEFZJwCfKfQ1AEKWsT=MML20C99kUw@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Damian,
	Alexandru" <alexandru.damian@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez4: add readline dependency
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
X-List-Received-Date: Tue, 09 Apr 2013 15:29:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2013 08:04 AM, Burton, Ross wrote:
> On 9 April 2013 15:58, Iorga, Cristian <cristian.iorga@intel.com> wrote:
>> GATT seems to be related only to BT 4.0, Bluetooth Low Energy (LE).
>>
>> However, it will be useful once Bluez5 will be in place.
>>
>> I say we should add it.
>
> As it's a tool that does introduce extra dependencies, we can easily
> packageconfig it to let people chose.
>

As Mark also said this, I would agree this should be a PACKAGECONFIG and 
the tool packaged in it's own package.

Sau!

> Ross
>
>


