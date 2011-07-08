Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QfGSJ-0006Wb-Eb
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 21:11:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2011 12:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="23306178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 12:07:21 -0700
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 12:07:21 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.138]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.75]) with mapi id
	14.01.0289.001; Fri, 8 Jul 2011 12:07:21 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] [bug 1195] site/mips-common: Cache
	cvs_cv_func_printf_ptr
Thread-Index: AQHMPZ4jkuJ2yE0w8UmEnpY54pRccpTiyKbQ
Date: Fri, 8 Jul 2011 19:07:20 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C02A284@ORSMSX101.amr.corp.intel.com>
References: <cover.1310080780.git.jessica.zhang@intel.com>
	<1310142693.20015.906.camel@rex> <4E174E52.2@mentor.com>
In-Reply-To: <4E174E52.2@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.9.131.214]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] [bug 1195] site/mips-common: Cache	cvs_cv_func_printf_ptr
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
X-List-Received-Date: Fri, 08 Jul 2011 19:11:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We only have arm-common, common, ix86-common, mips-common, powerpc-common, =
sh-common under site, no Linux-common or glibc-common, and it's defined in =
all the arches-common files except mips-common.

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Tom Rini
Sent: Friday, July 08, 2011 11:37 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_c=
v_func_printf_ptr

On 07/08/2011 09:31 AM, Richard Purdie wrote:
> On Thu, 2011-07-07 at 16:23 -0700, Jessica Zhang wrote:
>> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9=
e53:
>>   Khem Raj (1):
>>         package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or =
"0"
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib jzhang/1195
>>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Djzhang/1195
>>
>> Khem Raj (1):
>>   [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
>
> Merged to master, thanks.

Late again and my fault this time but why is this in site/mips-common
and not site/linux-common or glibc-common?

--
Tom Rini
Mentor Graphics Corporation

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


