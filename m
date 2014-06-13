Return-Path: <max.eliaser@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DAD016FE97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 21:48:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2014 14:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,473,1400050800"; d="scan'208";a="445368977"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2014 14:47:48 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.160]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.10]) with mapi id
	14.03.0123.003; Fri, 13 Jun 2014 14:47:48 -0700
From: "Eliaser, MaX" <max.eliaser@intel.com>
To: Denys Dmytriyenko <denis@denix.org>, Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [OE-core] textinfo failure
Thread-Index: AQHPhy2ai+tCaB1WYkqOW+vA1jvzUptvyYoAgAAT74D//7ZIsg==
Date: Fri, 13 Jun 2014 21:47:47 +0000
Message-ID: <E88D0531F83F3744B03D1A909A2B070F5C534E@ORSMSX110.amr.corp.intel.com>
References: <20140613163159.GO27324@denix.org>
	<539B3C18.1090701@mlbassoc.com>,<20140613191113.GQ27324@denix.org>
In-Reply-To: <20140613191113.GQ27324@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: textinfo failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 21:48:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A fix for this should be forthcoming.=20

-Max.
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Denys Dmytriyenko [denis@denix.=
org]
Sent: Friday, June 13, 2014 12:11 PM
To: Gary Thomas
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] textinfo failure

On Fri, Jun 13, 2014 at 11:59:52AM -0600, Gary Thomas wrote:
> On 2014-06-13 10:32, Denys Dmytriyenko wrote:
> >Hi,
> >
> >The recent texinfo change now breaks at least bison-native for me:
> >
> >| Traceback (most recent call last):
> >|   File "/OE/tmp-eglibc/sysroots/x86_64-linux/usr/bin/texinfo-dummy-nat=
ive/makeinfo", line 109, in <module>
> >|     "-E option not yet supported" + stub_msg
> >| AssertionError: -E option not yet supported
> >| This stand-in version of makeinfo is not yet fully capable of emulatin=
g the real
> >| version from the GNU texinfo suite. If you see this message, file a bu=
g report
> >| with details on the recipe that failed.
> >|
> >| mv: cannot move `.am14993/bison.info' to `.//OE/tmp-eglibc/work/x86_64=
-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/': No such file or directory
> >| make[2]: *** [/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/b=
ison-2.7.1/doc/bison.info] Error 1
> >| make[2]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-nat=
ive/2.7.1-r0/build/doc'
> >| make[1]: *** [install-recursive] Error 1
> >| make[1]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-nat=
ive/2.7.1-r0/build'
> >| make: *** [install] Error 2
> >| ERROR: oe_runmake failed
> >| WARNING: /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/r=
un.do_install.13309:1 exit 1 from
> >|   exit 1
> >| ERROR: Function failed: do_install (log file is located at /OE/tmp-egl=
ibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/log.do_install.13309)
> >NOTE: recipe bison-native-2.7.1-r0: task do_install: Failed
> >ERROR: Task 770 (virtual:native:/home/jenkins/distroless-build/sources/o=
e-core/meta/recipes-devtools/bison/bison_2.7.1.bb, do_install)
> >
>
> Odd - I just built it in a clean tree with Poky/Yocto master
> rev 8e0c54cd0e82ffe120f84f495101cd29e6fd06bf.
>
> What did you do to get that 'texinfo-dummy-native' version installed?
> None of my builds end up with makeinfo in sysroots.

That was a very recent change in oe-core (at the time of my failure it was
about 4 hours old commit):

http://cgit.openembedded.org/openembedded-core/commit/?id=3D0d8d5a2d44988d3=
2a5c8b995202a12ac106ba93c

--
Denys
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

