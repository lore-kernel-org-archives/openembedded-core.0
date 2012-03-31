Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SDqk6-0004CJ-O0
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 07:20:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Mar 2012 22:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83770677"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Mar 2012 22:11:44 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 30 Mar 2012 22:11:43 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Sat, 31 Mar 2012 13:11:42 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/6] Setup for VMDK to use Direct Disk
Thread-Index: AQHNDn/PeZwGe9g1sUqxnXZ/FnBssJaDVw+AgACEwGA=
Date: Sat, 31 Mar 2012 05:11:41 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCEBD18@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<1640360.hZYVmbFPaV@helios>
	<A25F549E4D43CD42B4C02DF47A1913230FCEB9CB@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCEB9CB@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Setup for VMDK to use Direct Disk
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
X-List-Received-Date: Sat, 31 Mar 2012 05:20:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote on 2012-03-31:
> Paul Eggleton wrote on 2012-03-30:
>> On Monday 26 March 2012 22:42:54 Saul Wold wrote:
>>> Updated comments per Darren's request, added cleanup to image-types
>>> to only use one -i (inode-count) parameter.
>>>=20
>>> Sau! The following changes since commit
>>> 644b7503c37fd73730dd3d7841463b158b8934ed:
>>>=20
>>>   guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)
>>>   are available in the git repository at:
>>>   git://git.openembedded.org/openembedded-core-contrib sgw/self
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log
>>> /
>>> ?h
>>> =3Dsgw/
>>> self
>>=20
>> So these patches have been merged now; I updated to latest master
>> and re-ran bitbake self-hosted-image; unfortunately the output
>> doesn't appear to be usable. I don't know what has gone wrong but
>> during boot there are complaints that the filesystem is corrupt:
>>=20
>> SYSLINUX 4.03 2010-10-22 EDD Copyright (C) 1994-2010 H. Peter Anvin et
>> al EXT3-fs error (device hda2): ext3_lookup: deleted inode referenced:
>> 581713 EXT3-fs error (device hda2): ext3_lookup: deleted inode
>> referenced: 610383 Kernel panic - not syncing: no init found.  Try
>> passing init=3D option to kernel.
>>=20
>> Running e2fsck -fn on the rootfs.ext3 file shows quite a number of error=
s.
>> There were no unusual errors in the log.do_rootfs.
>>=20
> Hi Paul,
> I can reproduce the same I issue, too...
> I'll try to look into this, but at the first glance, I don't know what
> has gone wrong, either...
Can we make a conclusion the current genext2fs is buggy here
when creating a big image(e.g., >4GB)?

Thanks,
-- Dexuan




