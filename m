Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qt9em-0004G0-9L
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 04:45:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2011 19:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38752414"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2011 19:40:53 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 16 Aug 2011 10:40:39 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 16 Aug 2011 10:40:39 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 10:40:38 +0800
Thread-Topic: [OE-core] [PATCH V2] bluez4: Added new recipe 4.96 and removed
	4.82 version
Thread-Index: AcxbbTjiHgZ65NPrR0amjCfBoj3hEwAUEWkg
Message-ID: <1865303E0DED764181A9D882DEF65FB6B6CDB78764@shsmsx502.ccr.corp.intel.com>
References: <1313136251-32214-1-git-send-email-noor_ahsan@mentor.com>
	<4E49511C.6050606@linux.intel.com>
In-Reply-To: <4E49511C.6050606@linux.intel.com>
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
X-List-Received-Date: Tue, 16 Aug 2011 02:45:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2011-08-16:
> On 08/12/2011 01:04 AM, Noor, Ahsan wrote:
>> From: Noor Ahsan<noor_ahsan@mentor.com>
>> * Added new recipe 4.96 and removed 4.82 version and its files.
>> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
> Merged into OE-Core

The patch causes a failure:
NOTE: package bluez-hcidump-2.0-r0: task do_compile: Failed
I reported http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1371 for this.

Thanks,
-- Dexuan




