Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QmLQQ-0000LG-Mm
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 09:54:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jul 2011 00:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,281,1309762800"; d="scan'208";a="32445836"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 00:50:17 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 28 Jul 2011 15:48:46 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Thu, 28 Jul 2011 15:48:45 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 28 Jul 2011 15:48:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 15:48:43 +0800
Thread-Topic: [OE-core] Add basic PowerPC core tune config (bug?)
Thread-Index: AcxM7Ona42GiBTtGSbS5l/hRa7OmXgADZaWQ
Message-ID: <1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
	<1311755778.2344.325.camel@rex>
	<704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
	<1311759058.2344.344.camel@rex>
	<CCDC209E-514C-425B-A60E-EC7D704E244A@kernel.crashing.org>
	<4E30FD0C.7040503@linux.intel.com>
In-Reply-To: <4E30FD0C.7040503@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 07:54:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2011-07-28:
> On 07/27/2011 10:25 PM, Kumar Gala wrote:
>> For some reason when I get to do_rootfs for core-image-sato when using
>> rpms I run into an issue in that:
>>=20
>> ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
>>=20
>> Isn't expanding or taking the assignment in
>> meta/conf/machine/include/tune-ppcFOO.inc but just using what it
>> found in meta/conf/bitbake.conf
>>=20
> I believe that I am seeing this also with an atom-pc build, where the
> PACKAGE_EXTRA_ARCHS seems OK, but ends up just being i586 instead of a
> list of ARCHS that includes core2 (which atom-pc should be).
Hi, I'm suffering from the exactly same issue... :-(
I don't know why PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} isn't expending ye=
t.

Thanks,
-- Dexuan




