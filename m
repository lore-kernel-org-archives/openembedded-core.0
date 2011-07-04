Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QdjjS-0004T8-HN
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 16:02:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2011 06:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,472,1304319600"; d="scan'208";a="23609058"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2011 06:58:48 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 4 Jul 2011 21:58:47 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Mon, 4 Jul 2011
	21:58:46 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Jul 2011 21:58:45 +0800
Thread-Topic: [OE-core] The swap partition's size is too big for BSP?
Thread-Index: Acw6US3XiwV69s2gTEqS+8UsXdsWIAAAK3zw
Message-ID: <1865303E0DED764181A9D882DEF65FB6A209493871@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A200B1C93F@shsmsx502.ccr.corp.intel.com>
	<1309779592.20015.661.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6A20949386F@shsmsx502.ccr.corp.intel.com>
	<1309787319.20015.670.camel@rex>
In-Reply-To: <1309787319.20015.670.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: The swap partition's size is too big for BSP?
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
X-List-Received-Date: Mon, 04 Jul 2011 14:02:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Mon, 2011-07-04 at 20:02 +0800, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> For reference if you want to do suspend to disk (swap) you need a
>>> lot of swap space btw. Still no where near that much though!
>>=20
>> Does (or should )Yocto Linux support suspend-to-disk? I'm not sure
>> about this. BTW: Linux can alse use a regular file as swap area.
>> So in case the swap size is not enough (e.g., for suspend-to-disk), I
>> think a user could create a big enough file  to meet the need (I
>> didn't test this with Linux yet).
>=20
> I don't think we've supported it in the past, its just a datapoint to
> keep in mind.
Ok, so I can put a comment when I make the patch, saying this new algorithm=
 doesn't work with suspend-to-disk in future.

> For reference, you can't use a file easily since the VM data needs to
> be available as the kernel boots to be able to resume from it.
I admit I didn't try this on Linux.
Windows does use a regular file when doing suspend-to-disk, so I thought Li=
nux could do it, too...  :-)

Thanks,
-- Dexuan=


