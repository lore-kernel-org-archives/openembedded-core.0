Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGYX0-0004h4-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 17:58:14 +0200
Received: by eyd9 with SMTP id 9so1790060eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:52:23 -0700 (PDT)
Received: by 10.213.23.1 with SMTP id p1mr913411ebb.133.1319039542674;
	Wed, 19 Oct 2011 08:52:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x45sm16703345eeh.11.2011.10.19.08.52.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 08:52:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
Date: Wed, 19 Oct 2011 17:52:16 +0200
Message-Id: <E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update	data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 15:58:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 19 okt. 2011, om 17:49 heeft Kamble, Nitin A het volgende geschreven:

> Koen,
>   Why do you ask ?

Because I want the commit message to match to commit and now it doesn't.

> 
> Nitin
> 
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Koen Kooi
>> Sent: Wednesday, October 19, 2011 1:31 AM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [CONSOLIDATED PULL 14/16] distro-tracking:
>> update data for some toolchain recipes
>> 
>> btrfs-tools is a toolchain recipe?!?!?!
>> 
>> 
>> 
>> Op 19 okt. 2011, om 10:28 heeft Saul Wold het volgende geschreven:
>> 
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> 
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ---
>>> .../conf/distro/include/distro_tracking_fields.inc |   42
>> ++++++++++++--------
>>> 1 files changed, 25 insertions(+), 17 deletions(-)
>>> 
>>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
>> b/meta/conf/distro/include/distro_tracking_fields.inc
>>> index abc2cbf..e68bbe1 100644
>>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
>>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
>>> @@ -3005,11 +3005,19 @@ RECIPE_STATUS_pn-run-postinsts="green" # all
>> local code
>>> RECIPE_LATEST_VERSION_pn-postinsts="1.0"
>>> RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> -RECIPE_STATUS_pn-nasm="green"
>>> +RECIPE_STATUS_pn-nasm="green"
>>> RECIPE_LATEST_VERSION_pn-nasm="2.07"
>>> -RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jul 06, 2011"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Oct 18, 2011"
>>> +RECIPE_LAST_UPDATE_pn-nasm = "Jun 23, 2010"
>>> RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> +RECIPE_STATUS_pn-btrfs-tools="green"
>>> +RECIPE_LATEST_VERSION_pn-btrfs-tools="git"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Oct 18, 2011"
>>> +RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jun 09, 2011"
>>> +RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> +DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-
>> progs"
>>> +
>>> RECIPE_STATUS_pn-perl="red" # upgrade needed
>>> RECIPE_LATEST_VERSION_pn-perl="5.12.1"
>>> RECIPE_LAST_UPDATE_pn-perl = "May 27, 2007"
>>> @@ -3020,9 +3028,9 @@ RECIPE_LATEST_VERSION_pn-
>> prelink="1.0+git0+0x909470ee441237563d6236c505cb2d02ddc
>>> RECIPE_LAST_UPDATE_pn-perl = "Jul 23, 2010"
>>> RECIPE_MAINTAINER_pn-prelink = "Mark Hatle
>> <mark.hatle@windriver.com>"
>>> 
>>> -RECIPE_STATUS_pn-python-dbus="red"
>>> -RECIPE_LATEST_VERSION_pn-python-dbus="0.83.1"
>>> -RECIPE_LAST_UPDATE_pn-python-dbus = "Jul 7, 2010"
>>> +RECIPE_STATUS_pn-python-dbus="green"
>>> +RECIPE_LATEST_VERSION_pn-python-dbus="0.84.0"
>>> +RECIPE_LAST_UPDATE_pn-python-dbus = "Oct 18, 2011"
>>> RECIPE_MAINTAINER_pn-python-dbus = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-
>> dbus Mandriva=python-dbus"
>>> 
>>> @@ -3062,7 +3070,8 @@ RECIPE_MAINTAINER_pn-python-pyrex = "Nitin A
>> Kamble <nitin.a.kamble@intel.com>"
>>> DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex
>> Ubuntu=python-pyrex"
>>> 
>>> RECIPE_STATUS_pn-python-scons="green"
>>> -RECIPE_LATEST_VERSION_pn-python-scons="2.0.1"
>>> +RECIPE_LATEST_VERSION_pn-python-scons="2.1.0"
>>> +RECIPE_LAST_UPDATE_pn-python-scons = "Oct 18, 2011"
>>> DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons
>> Ubuntu=scons Mandriva=scons Debian=scons"
>>> RECIPE_LAST_UPDATE_pn-python-scons = "Nov 8, 2010"
>>> RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> @@ -3087,15 +3096,16 @@ RECIPE_LATEST_VERSION_pn-unifdef="2.6.18+git"
>>> RECIPE_MAINTAINER_pn-unifdef = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-gnu-config="green"
>>> -RECIPE_LATEST_VERSION_pn-gnu-config="0.0+git3155524"
>>> +RECIPE_LATEST_VERSION_pn-gnu-config="svn"
>>> DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
>>> RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
>>> -RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Jul 06, 2011"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Oct 18, 2011"
>>> RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-mpfr="green"
>>> -RECIPE_LATEST_VERSION_pn-mpfr="3.0.0"
>>> -RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Jul 06, 2011"
>>> +RECIPE_LATEST_VERSION_pn-mpfr="3.0.1"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Oct 18, 2011"
>>> +RECIPE_LAST_UPDATE_pn-mpfr = "Apr 07, 2011"
>>> RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-gmp="green"
>>> @@ -3110,9 +3120,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-libmpc = "Jan 25,
>> 2011"
>>> RECIPE_MAINTAINER_pn-libmpc = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
>>> 
>>> -RECIPE_STATUS_pn-byacc="red"
>>> +RECIPE_STATUS_pn-byacc="green"
>>> RECIPE_LATEST_VERSION_pn-byacc="20101229"
>>> -RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Jul 06, 2011"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Oct 18, 2011"
>>> +RECIPE_LAST_UPDATE_pn-byacc = "Oct 18, 2010"
>>> RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-libconvert-asn1-perl="green"
>>> @@ -3122,8 +3133,8 @@ RECIPE_LAST_UPDATE_pn-libconvert-asn1-perl =
>> "Aug 13, 2010"
>>> RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-libxml-parser-perl="green"
>>> -RECIPE_LATEST_VERSION_pn-libxml-parser-perl="2.36"
>>> -RECIPE_LAST_UPDATE_pn-libxml-parser-perl = "Nov 18, 2009"
>>> +RECIPE_LATEST_VERSION_pn-libxml-parser-perl="2.41"
>>> +RECIPE_LAST_UPDATE_pn-libxml-parser-perl = "Oct 18, 2011"
>>> RECIPE_MAINTAINER_pn-libxml-parser-perl = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> 
>>> RECIPE_STATUS_pn-cmake-native="green"
>>> @@ -5922,9 +5933,6 @@ RECIPE_COMMENTS_pn-pseudo = "Yocto Project
>> maintained"
>>> RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011"
>>> DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
>>> 
>>> -DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-
>> progs"
>>> -RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble
>> <nitin.a.kamble@intel.com>"
>>> -
>>> DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
>>> RECIPE_MAINTAINER_pn-rt-tests = "Darren Hart
>> <dvhart@linux.intel.com>"
>>> 
>>> --
>>> 1.7.6.2
>>> 
>>> 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> 
>> 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



