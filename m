Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q8YYM-000625-VI
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Apr 2011 15:50:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2011 06:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,330,1299484800"; d="scan'208";a="625996035"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2011 06:48:07 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 9 Apr 2011 21:48:05 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 9 Apr 2011 21:48:05 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Sat, 9 Apr 2011
	21:48:05 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "Wold, Saul" <saul.wold@intel.com>
Date: Sat, 9 Apr 2011 21:48:04 +0800
Thread-Topic: [poky] [OE-core] [PATCH 1/1] qt4: remove the option
	-feliminate-dwarf2-dups to fix the build
Thread-Index: Acv2GVyVH5OOCkN1Taytfatbkq1JrQAouYgg
Message-ID: <1865303E0DED764181A9D882DEF65FB68A7EDE4D44@shsmsx502.ccr.corp.intel.com>
References: <cover.1301388474.git.dexuan.cui@intel.com>
	<c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>
	<1301395410.24596.22.camel@rex>
	<1865303E0DED764181A9D882DEF65FB68A3F6A15D4@shsmsx502.ccr.corp.intel.com>
	<4D9F5166.1020500@intel.com>
In-Reply-To: <4D9F5166.1020500@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
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
X-List-Received-Date: Sat, 09 Apr 2011 13:51:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wold, Saul wrote:
> On 03/29/2011 04:43 AM, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> On Tue, 2011-03-29 at 16:52 +0800, Dexuan Cui wrote:
>>>> From: Dexuan Cui<dexuan.cui@intel.com>
>>>>=20
>>>> [YOCTO #932]
>>>>=20
>>>> After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf:
>>>> Prune global OPTIMIZATION flags) that adds an option
>>>> -feliminate-dwarf2-dups, gcc 4.5 reports such an internal compiler
>>>> error when building Qt4 if the option is used:
>>>>=20
>>>>> graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler
>>>>> error: in build_abbrev_table, at dwarf2out.c:9806 Please submit a
>>>>> full bug report, with preprocessed source if appropriate.
>>>>> See<http://gcc.gnu.org/bugs.html>  for instructions.
>>>>=20
>>>> This is a gcc bug:
>>>> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D47361=20
>>>>=20
>>>> At present we can remove the option as a workaround.
>>>>=20
>>>> Thanks Robert Berger for reporting the bug and his investigation in
>>>> gcc bugzilla and thanks Khem Raj for the quick suggestion about
>>>> removing the option.
>>>=20
>>> How about we add the patch for this issue:
>>>=20
>>> http://gcc.gnu.org/ml/gcc-patches/2011-01/msg01647.html
>> Ok,  I'll apply the patch to g++ and test building qt4.
>>=20
> Any update on this patch?
Hi Saul,
The patch doesn't work and we're waiting a fix from upstream gcc.
RP has disabled the option globally, so we're ok at present.
Please see http://bugzilla.pokylinux.org/show_bug.cgi?id=3D932 for the deta=
ils.

Thanks,
-- Dexuan


