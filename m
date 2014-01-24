Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C7B146D89A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 07:57:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jan 2014 23:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,711,1384329600"; d="scan'208";a="470105819"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2014 23:57:07 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.210]) with mapi id
	14.03.0123.003; Fri, 24 Jan 2014 07:57:05 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Paul Barker <paul@paulbarker.me.uk>, Philip Balister <philip@balister.org>
Thread-Topic: [OE-core] Berkeley DB fails to build
Thread-Index: AQHPGDE37H6zTKJoekes/I2ebM5Te5qSl/0AgAASngCAANgV4A==
Date: Fri, 24 Jan 2014 07:57:04 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CE5DFE@IRSMSX105.ger.corp.intel.com>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
	<CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
In-Reply-To: <CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Berkeley DB fails to build
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
X-List-Received-Date: Fri, 24 Jan 2014 07:57:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Carlos, Paul,

If the issue is still reproducible, can you please open an issue on the bug=
tracker?
And add also the info that you have found?
That is, if you didn't already opened a bug.

Thanks,
Cristian Iorga
YP
Intel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Paul Barker
Sent: Thursday, January 23, 2014 9:01 PM
To: Philip Balister
Cc: openembedded-core
Subject: Re: [OE-core] Berkeley DB fails to build

On 23 January 2014 17:54, Philip Balister <philip@balister.org> wrote:
> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>> Hello,
>>
>> I noticed that since the C++ bindings for the berkeley DB were=20
>> included in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I=20
>> cannot build db anymore.
>> The error is:
>>
>>     /usr/lib/libstdc++.so: file not recognized: File format not=20
>> recognized
>>
>> this is the offending part in the log.do_compile file:
>
> What distro is your build machine running? I've this from people using=20
> Arch Linux.
>

I've tracked this down to libtool replacing '-lstdc++' with an explicit ref=
erence to '/usr/lib/libstdc++.so' before it runs ld. So it's libtool not ld=
 at fault here. I did look at the recipe for Berkeley db and spotted that i=
t overrides do_configure, allowing the shipped copies of libtool and relate=
d files to be used rather than running the autoreconf stuff that replaces t=
hem. That's my understanding at least.

At that point I ran away and reverted the commit in question locally as lib=
tool terrifies me and I don't need the c++ bindings myself!

Sorry I can't be more help but I hope that points someone in the right dire=
ction.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

