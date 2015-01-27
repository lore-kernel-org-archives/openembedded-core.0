Return-Path: <darren.hart@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 51D26718DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:47:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jan 2015 08:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="668451981"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 08:47:03 -0800
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 27 Jan 2015 08:47:03 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
	ORSMSX157.amr.corp.intel.com (10.22.240.23) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 27 Jan 2015 08:47:03 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.250]) by
	FMSMSX112.amr.corp.intel.com ([169.254.5.146]) with mapi id
	14.03.0195.001; Tue, 27 Jan 2015 08:47:02 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] image: Add missing depends on virtual/kernel for
	depmod data
Thread-Index: AQHQOkYSguxzLszzCkS23x3eeq3Eo5zUohkA//96lwCAAI63AP//gcUA
Date: Tue, 27 Jan 2015 16:47:01 +0000
Message-ID: <D0ED00D5.B973A%darren.hart@intel.com>
References: <1422372551.19798.53.camel@linuxfoundation.org>
	<54C7B296.5020506@windriver.com> <D0ECF2E2.B9709%darren.hart@intel.com>
	<1422375524.19798.56.camel@linuxfoundation.org>
In-Reply-To: <1422375524.19798.56.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.4.172]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 16:47:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <000379B8E44E3449A9CBA52BBF2FF843@intel.com>
Content-Transfer-Encoding: quoted-printable

On 1/27/15, 8:18 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Tue, 2015-01-27 at 15:48 +0000, Hart, Darren wrote:
>> On 1/27/15, 7:45 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
>>wrote:
>>=20
>> >On 15-01-27 10:29 AM, Richard Purdie wrote:
>> >> We need the depmod data so that the kernel depmod command works
>> >>successfully
>> >> at rootfs time. The fact this was working inconsistently is now
>> >>highlighted
>> >> after the command was made to error out. A simple test case is:
>> >>
>> >> bitbake virtual/kernel image
>> >> bitbake vrituak/kernel -c clean
>> >> bitbake image -c rootfs -f
>> >>
>> >> We fix it by adding the missing dependency.
>> >
>> >Looks good here.
>> >
>> >Out of curiosity, was this hiding before, or did it only come about due
>> >to our recent moves to the work-shared kernel builds ?
>>=20
>> I'm being dense I guess. I went to go verify what virtual/kernel
>> do_populate_sysroot is doing in the current state of things, in order to
>> be sure it copied over the right files, and I couldn't find it quickly.
>> Where is this defined?
>
>http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D11ef55a93bd2bbd95e2=
03
>fab3aa237322923ffd9
>
>Specifically:
>
>sysroot_stage_all () {
> sysroot_stage_dir ${D}${datadir}/kernel-depmod
>${SYSROOT_DESTDIR}${datadir}/kernel-depmod
>}

Right, I thought of this while driving in :-) -ENOCOFFEE

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

--=20
Darren Hart
Intel Open Source Technology Center



