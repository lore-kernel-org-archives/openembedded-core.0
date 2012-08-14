Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1K6O-000066-Hf
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 18:36:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2012 09:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="134217088"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Aug 2012 09:24:17 -0700
Message-ID: <502A7BB0.4050708@linux.intel.com>
Date: Tue, 14 Aug 2012 19:24:16 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei@gherzan.ro>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
	<1EE0C4BA-A5E0-42FC-B354-89B29C5C6C22@dominion.thruhere.net>
In-Reply-To: <1EE0C4BA-A5E0-42FC-B354-89B29C5C6C22@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: dbus with tests
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
X-List-Received-Date: Tue, 14 Aug 2012 16:36:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 03:49 PM, Koen Kooi wrote:
>
> Op 14 aug. 2012, om 13:11 heeft Andrei Gherzan <andrei@gherzan.ro> het volgende geschreven:
>
>> In the process of updating dbus, tests (in my opinion) are mandatory.
>>
>> While compiling dbus with tests, dbus and dbus-glib are needed. To compile dbus-glib, dbus is needed (obviously). The only solution (to compile dbus with tests) that i found is to create a new recipe named dbus-tests where to compile dbus with --enable-tests --enable-embedded-tests, skip write to sysroot (noexec) and just package dbus-tests.
>>
>> 1. Do you guys know a better solution for this?
>
> It's actually the only solution that would work :)
>
>> 2. What would be a good path to use for installing tests?
>
> $bindir or $libexecdir IMO

Not bindir please!  Tests should live separate,

If it;s going to be libexecdir, really should be $libdir/$BPN as we want 
to move way from having things live in /usr/libexec, and yes with time 
$libexecdir will be $prefix/lib/$BPN.

Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


