Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtG9O-0006Gn-Mw
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 11:41:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2011 02:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,379,1309762800"; 
   d="scan'208";a="7678243"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 02:36:46 -0700
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 16 Aug 2011 17:36:06 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Tue, 16 Aug 2011 17:36:06 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 16 Aug 2011 17:36:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 17:36:04 +0800
Thread-Topic: [OE-core] [PATCH V2] bluez4: Added new recipe 4.96 and removed
	4.82 version
Thread-Index: Acxb1N7ysDCyqX4gRwG5G3peHznrQgABQQNQAAdryoA=
Message-ID: <1865303E0DED764181A9D882DEF65FB6B733B42FB2@shsmsx502.ccr.corp.intel.com>
References: <1313136251-32214-1-git-send-email-noor_ahsan@mentor.com>
	<4E49511C.6050606@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B6CDB78764@shsmsx502.ccr.corp.intel.com>
	<20110816052441.GA10195@jama.jama.net>
	<1865303E0DED764181A9D882DEF65FB6B733B42DCA@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B733B42DCA@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH V2] bluez4: Added new recipe 4.96 and removed 4.82 version
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
X-List-Received-Date: Tue, 16 Aug 2011 09:41:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote on 2011-08-16:
> Martin Jansa wrote on 2011-08-16:
>> On Tue, Aug 16, 2011 at 10:40:38AM +0800, Cui, Dexuan wrote:
>>> Saul Wold wrote on 2011-08-16:
>>>> On 08/12/2011 01:04 AM, Noor, Ahsan wrote:
>>>>> From: Noor Ahsan<noor_ahsan@mentor.com>
>>>>> * Added new recipe 4.96 and removed 4.82 version and its files.
>>>>> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
>>>> Merged into OE-Core
>>>=20
>>> The patch causes a failure:
>>> NOTE: package bluez-hcidump-2.0-r0: task do_compile: Failed I
>>> reported
>>> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1371 for this.
>>=20
>> You need patch from this commit
>>=20
>> http://git.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=3D852
>> ac4b589adb186191ad70a2fa3472d5b351ec4 or upgrade to 2.1
> Martin, thanks for the suggestion!
> Yes, I found 2.1 had integrated the fix, so I think we should choose
> to upgrade the package to 2.1 (I compared the source codes of 2.0 and
> 2.1 and looks they don't have many differences in other aspects).
> I'll send out a patch later today.
This is the patch.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/mas=
ter&id=3D17e0fb707e9ad926058898d39d32168f4e582ed1

I'm testing my branch with other patches. So I'll wait for several hours (2=
~4 hours) and send out all the patches together. :-)

Thanks,
-- Dexuan



