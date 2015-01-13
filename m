Return-Path: <darren.hart@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E79C172694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 02:59:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 12 Jan 2015 18:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,746,1413270000"; d="scan'208";a="668823387"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2015 18:59:42 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 12 Jan 2015 18:59:42 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.40]) by
	FMSMSX112.amr.corp.intel.com ([10.18.116.6]) with mapi id
	14.03.0195.001; Mon, 12 Jan 2015 18:59:41 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: "Yang, Liezhi (Wind River)" <liezhi.yang@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] RFC: Further kernel build process changes?
Thread-Index: AQHQKnU/pnajGB2g5UyvQYJtyvvLW5y9zzKAgAACMQD//5OjgA==
Date: Tue, 13 Jan 2015 02:59:41 +0000
Message-ID: <D0D9C9F9.B71A5%darren.hart@intel.com>
References: <1420633589.25779.69.camel@linuxfoundation.org>
	<54B472AB.1010601@windriver.com> <54B47482.5070001@windriver.com>
In-Reply-To: <54B47482.5070001@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.90.138]
MIME-Version: 1.0
Subject: Re: RFC: Further kernel build process changes?
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
X-List-Received-Date: Tue, 13 Jan 2015 02:59:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BF26A0DED6B9F43899759D20E4487C0@intel.com>
Content-Transfer-Encoding: quoted-printable


On 1/12/15, 5:27 PM, "Robert Yang" <liezhi.yang@windriver.com> wrote:

>
>
>On 01/13/2015 09:19 AM, Robert Yang wrote:
>>
>>
>> On 01/07/2015 08:26 PM, Richard Purdie wrote:
>>> I'm hearing (somewhat justified) complaints that the recent kernel
>>> changes have destablised builds. Part of the question is whether the
>>> recent changes are as clear to users as they could be, we're also
>>> running into some problems due to mixing kernel source and build
>>> artefacts in some places and not in others.
>>
>> Currently, the kernel_do_install directly installs the files to sysroot,
>> then we will get the errors like the following when rebuild:
>>
>> |   Using=20
>>/buildarea/lyang1/testup3/tmp/sysroots/qemux86-64/usr/src/kernel as
>> source for kernel
>> |   /buildarea/lyang1/testup3/tmp/sysroots/qemux86-64/usr/src/kernel is
>>not
>> clean, please run 'make mrproper'
>> |   in the=20
>>'/buildarea/lyang1/testup3/tmp/sysroots/qemux86-64/usr/src/kernel'
>> directory.
>> | make[3]: Nothing to be done for `relocs'.
>>
>> How about we add a kerne-src.rpm which includes the usr/src/kernel, and
>>use
>
>I just noticed that we have this which was added on Dec. 5th.
>
>meta/recipes-kernel/linux/kernel-devsrc.bb

Right, and there have been various issues related with that. We're working
through those currently.


--=20
Darren Hart
Intel Open Source Technology Center


