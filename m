Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbwAF-0007bJ-7s
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:54:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 07:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="21916539"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 07:50:58 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 22:47:51 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 29 Jun 2011 22:47:50 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 22:47:49 +0800
Thread-Topic: [OE-core] [PATCH 2/2] prelink_git.bb: Only block the postinst
	script when no image-prelink (v2)
Thread-Index: Acw2axauOWe52zfqQ1q+sy0VS68BYAAAFsPA
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C71F@shsmsx502.ccr.corp.intel.com>
References: <cover.1309311935.git.mark.hatle@windriver.com>
	<d0bbe06e703f6f9b7d0f38ffc372f3bb1425483a.1309311935.git.mark.hatle@windriver.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C71E@shsmsx502.ccr.corp.intel.com>
	<1309358523.2551.45.camel@phil-desktop> <4E0B3A46.30407@windriver.com>
In-Reply-To: <4E0B3A46.30407@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] prelink_git.bb: Only block the postinst script when no image-prelink (v2)
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
X-List-Received-Date: Wed, 29 Jun 2011 14:54:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote:
> On 6/29/11 9:42 AM, Phil Blundell wrote:
>> On Wed, 2011-06-29 at 22:39 +0800, Cui, Dexuan wrote:
>>> Even if without the patch, we still skip this on the host side --
>>> previously we skipped with "exit 1", and with the patch now we skip
>>> with "exit 1" or "exit 0". So IMHO looks the patch doesn't actually
>>> help? :-) =20
>>=20
>> If the script exits with 0 in offline mode then it won't get rerun at
>> first boot on the target.  If it exits with 1 then it will.
>=20
> Yes.  Since we've already run the equivalent of the script in the
> image-prelink, we can safely exit with a '0' telling the "image"
> preinst code that this was successfully run and to ignore it at first
> boot.=20
>=20
Ok, got it!

Thanks very much for the explanation!

Thanks,
-- Dexuan=


