Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1FwJ-0000B5-AC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:09:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2012 04:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208114390"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 04:57:42 -0700
Message-ID: <502A3D34.6080208@linux.intel.com>
Date: Tue, 14 Aug 2012 14:57:40 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
In-Reply-To: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Aug 2012 12:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 02:11 PM, Andrei Gherzan wrote:
> In the process of updating dbus, tests (in my opinion) are mandatory.
>
> While compiling dbus with tests, dbus and dbus-glib are needed. To
> compile dbus-glib, dbus is needed (obviously). The only solution (to
> compile dbus with tests) that i found is to create a new recipe named
> dbus-tests where to compile dbus with --enable-tests
> --enable-embedded-tests, skip write to sysroot (noexec) and just package
> dbus-tests.
>
> 1. Do you guys know a better solution for this?

We have started to think/chat about this, there was another patch on the 
list recently that Mark Hatle and I talked about tests.

I think having the tests enabled with DISTRO_FEATURE would allow for the 
flexibility of enabling then without always incurring the cost /overhead 
of longer compile times.

Can you incorporate the changes to the core recipe with out having to 
add a new dbus-tests recipe if you use DISTRO_FEATURE?


> 2. What would be a good path to use for installing tests?
Same here, disucssion started.I would like to see tests go into 
${datadir}/${BPN} (/usr/share/${BPN}.  /opt was discussed, but I think 
we want to leave that clean and empty.


Sau!


>
>
> ag
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


