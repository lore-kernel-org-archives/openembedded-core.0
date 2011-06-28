Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbPXU-0004b1-BD
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 06:04:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2011 21:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="20866438"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2011 21:00:57 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 12:00:55 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 28 Jun 2011 12:00:54 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 12:00:54 +0800
Thread-Topic: [OE-core] [PATCH 1/2] linux-yocto: update meta SRCREV for new
	config groups
Thread-Index: Acw02Fxw+e7ctBXhRe+YrVHFRT8fgAAafRsw
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C70E@shsmsx502.ccr.corp.intel.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
	<13b6560cbb0a8a498266eba93e93f71fb34be9c2.1308777703.git.bruce.ashfield@windriver.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0730@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0731@shsmsx502.ccr.corp.intel.com>
	<BANLkTimxJghenX5KgaN+oP-cyywABbpEtQ@mail.gmail.com>
	<1309185246.2288.11.camel@elnicho>
In-Reply-To: <1309185246.2288.11.camel@elnicho>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	"koen@dominion.thruhere.net" <koen@dominion.thruhere.net>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] linux-yocto: update meta SRCREV for new config groups
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
X-List-Received-Date: Tue, 28 Jun 2011 04:04:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tom Zanussi wrote:
> On Mon, 2011-06-27 at 05:56 -0700, Bruce Ashfield wrote:
>> 2011/6/27 Cui, Dexuan <dexuan.cui@intel.com>:
>>> Cui, Dexuan wrote:
>>>> Hi, I got the following ERROR with the patch:
>>>>=20
>>>> Log data follows:
>>>>> Unstaged changes after reset:
>>>>> M arch/powerpc/boot/dts/mpc8315erdb.dts
>>>>> Deleted branch meta-temp (was cf7d7e5).
>>>>> WARNING: addon feature "features/taskstats" was not found
>>>>> ERROR: required features were not found. aborting
>>>>> ERROR: Function 'do_patch' failed
>>>>=20
>>>> Maybe we forgot to push the proper commits into the linux-yocto git
>>>> repo?
>>> BTW, I'm building emenlow with today's poky master (commit
>>> a1f79a7896b) and mete-intel (commit 76d1178ba).=20
>>>=20
>=20
> Just noticed that you were using emenlow so updated the meta-intel
> SRCREVs, maybe that was the problem?

Hi Tom,
Yes, that is just the problem.
With the new commit "Update kernel SRCREVs" in meta-intel repo, I don't hav=
e the issue now.

Thank you and Bruce a lot for the quick fixing!

Thanks,
-- Dexuan


