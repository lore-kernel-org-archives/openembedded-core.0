Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsJW2-0005CL-3q
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 20:37:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jan 2012 11:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102356192"
Received: from unknown (HELO envy.home) ([10.255.14.180])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2012 11:29:22 -0800
Message-ID: <4F2840F5.9080908@linux.intel.com>
Date: Tue, 31 Jan 2012 11:28:53 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
In-Reply-To: <CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v3 0/3] *** SUBJECT HERE ***
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
X-List-Received-Date: Tue, 31 Jan 2012 19:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Did you send this using the send-pull-request script? I assume not as
this was to oe-core and not yocto, but if you did, I want to know as it
should protect against -ENOCOFFEEYET errors such as these.

For whatever it's worth, I use this script for all my projects now to
help avoid situations like this which I have fallen into more times than
I care to admit :-)

--
Darren

On 01/30/2012 09:17 AM, Steve Sakoman wrote:
> Sigh, my morning for screw-ups.  Time for another cup of coffee . . .
> 
> The subject should be: 'zypper: support signed repositories' rather
> than '***SUBJECT HERE***' :-)
> 
> Steve
> 
> On Mon, Jan 30, 2012 at 9:14 AM, Steve Sakoman <steve@sakoman.com> wrote:
>> The current zypper implementation does not work with signed repositories.
>> This patch series adds recipes for the required packages as well as the
>> necessary runtime dependencies to zypper.
>>
>> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
>> a systemd based console image.
>>
>> Version 3 incorporates feedback from Koen Kooi and Saul Wold
>>  - adds runtime dependencies to existing RDEPENDS_${PN}
>>  - removes duplicate recipe for libassuan
>>  - moves recipes for gnupg and libksba to recipes-support
>>
>> Steve Sakoman (3):
>>  libksba: add recipe for 1.2.0
>>  gnupg: add recipe for 2.0.18
>>  zypper: add missing runtime dependences on gzip and gnupg
>>
>>  meta/recipes-extended/zypper/zypper_git.bb    |    4 ++--
>>  meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   24 ++++++++++++++++++++++++
>>  meta/recipes-support/libksba/libksba_1.2.0.bb |   10 ++++++++++
>>  3 files changed, 36 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
>>  create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


