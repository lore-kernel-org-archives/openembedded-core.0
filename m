Return-Path: <darren.hart@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 20B65718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:48:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2015 07:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="668419029"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 07:48:05 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 27 Jan 2015 07:48:04 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
	ORSMSX159.amr.corp.intel.com (10.22.240.24) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 27 Jan 2015 07:48:04 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.250]) by
	FMSMSX114.amr.corp.intel.com ([10.18.116.8]) with mapi id
	14.03.0195.001; Tue, 27 Jan 2015 07:48:03 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: "Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>, "Richard
	Purdie" <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] image: Add missing depends on virtual/kernel for
	depmod data
Thread-Index: AQHQOkYSguxzLszzCkS23x3eeq3Eo5zUohkA//96lwA=
Date: Tue, 27 Jan 2015 15:48:02 +0000
Message-ID: <D0ECF2E2.B9709%darren.hart@intel.com>
References: <1422372551.19798.53.camel@linuxfoundation.org>
	<54C7B296.5020506@windriver.com>
In-Reply-To: <54C7B296.5020506@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.74.158]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 27 Jan 2015 15:48:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ACBA28CF7774464EAFC7A9200F8B11EE@intel.com>
Content-Transfer-Encoding: quoted-printable

On 1/27/15, 7:45 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:

>On 15-01-27 10:29 AM, Richard Purdie wrote:
>> We need the depmod data so that the kernel depmod command works
>>successfully
>> at rootfs time. The fact this was working inconsistently is now
>>highlighted
>> after the command was made to error out. A simple test case is:
>>
>> bitbake virtual/kernel image
>> bitbake vrituak/kernel -c clean
>> bitbake image -c rootfs -f
>>
>> We fix it by adding the missing dependency.
>
>Looks good here.
>
>Out of curiosity, was this hiding before, or did it only come about due
>to our recent moves to the work-shared kernel builds ?

I'm being dense I guess. I went to go verify what virtual/kernel
do_populate_sysroot is doing in the current state of things, in order to
be sure it copied over the right files, and I couldn't find it quickly.
Where is this defined?

--=20
Darren Hart
Intel Open Source Technology Center



