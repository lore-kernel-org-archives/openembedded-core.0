Return-Path: <darren.hart@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5377229E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:06:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 20 Jan 2015 08:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,434,1418112000"; d="scan'208";a="639908805"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2015 08:04:36 -0800
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 20 Jan 2015 08:04:35 -0800
Received: from fmsmsx108.amr.corp.intel.com (10.18.124.206) by
	ORSMSX114.amr.corp.intel.com (10.22.240.10) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 20 Jan 2015 08:04:35 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.250]) by
	FMSMSX108.amr.corp.intel.com ([169.254.9.201]) with mapi id
	14.03.0195.001; Tue, 20 Jan 2015 08:04:35 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: "Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>, "Richard
	Purdie" <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel/image/depmodwrapper: Fixups for depmod
Thread-Index: AQHQNLWwjE3by0LT2Eq8dEfPNJEU25zJlAoA//+YFgA=
Date: Tue, 20 Jan 2015 16:04:34 +0000
Message-ID: <D0E3BC38.B85FA%darren.hart@intel.com>
References: <1421760783.1798.42.camel@linuxfoundation.org>
	<54BE633A.1000306@windriver.com>
In-Reply-To: <54BE633A.1000306@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.113.7]
MIME-Version: 1.0
Subject: Re: [PATCH] kernel/image/depmodwrapper: Fixups for depmod
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
X-List-Received-Date: Tue, 20 Jan 2015 16:07:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <520F2C285000774790A6C845C8A35004@intel.com>
Content-Transfer-Encoding: quoted-printable



On 1/20/15, 6:16 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:

>On 15-01-20 08:33 AM, Richard Purdie wrote:
>> With the rpm package backend enabled, running:
>>
>> bitbake <image>
>> bitbake virtual/kernel -c clean
>> bitbake <image> -c rootfs -f
>>
>> results in an image with incorrect kernel module dependency information.
>> The problem is that the System.map and kernel-abiversion files are
>>needed
>> for depmod and after the recent kernel changes, these are no longer in
>> sstate.
>>
>> Its reasonable to require the kernel to unpack/build if you're
>> about to build a module against it. It is not reasonable to require this
>> just to build a rootfs.
>>
>> Therefore stash the needed files specifically for depmod.
>>
>> Also fix some STAGING_KERNEL_DIR references which were incorrect, found
>> whilst sorting through his change.
>
>Now that I see the fix, the tweaks are clear (and obvious). I would have
>preferred a straight up module loading error in all cases .. since that
>would have showed in my workflows. The rootfs.py changes in particular
>would have taken me much longer to get right.
>
>>
>> This patch also makes the depmod files being missing a fatal error
>>rather than
>> something the system just ignores silently.
>
>Nice improvement.
>
>Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Functionally look good. I noticed some whitespace issues (spaces in bash
sections instead of tabs), but those may have been due to keeping a file
internally consistent.

Otherwise,

Reviewed-by: Darren Hart <dvhart@linux.intel.com>


--=20
Darren Hart
Intel Open Source Technology Center


