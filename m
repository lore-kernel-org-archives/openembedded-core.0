Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C73206CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:37:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2013 07:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420836101"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 07:37:54 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.70]) with mapi id
	14.03.0123.003; Tue, 22 Oct 2013 15:37:35 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4] connman: ignore the networking device
	which nfs for rootfs is working on
Thread-Index: AQHOzABElTpF3SAHIEuXTe6BB126mJoAz/sw
Date: Tue, 22 Oct 2013 14:37:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CA0FEC@IRSMSX105.ger.corp.intel.com>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
	<ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH v4] connman: ignore the networking device	which nfs for rootfs is working on
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
X-List-Received-Date: Tue, 22 Oct 2013 14:37:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry to ask, what is this case: 'ip=3Ddhcp'?
Care to clarify?

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Enrico Scholz
Sent: Friday, October 18, 2013 3:48 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] connman: ignore the networking device whi=
ch nfs for rootfs is working on

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Can you explain why connman needs to ignore the device that NFS is=20
> reading the rootfs from?  I ask because the very latest connman=20
> release shouldn't be dropping and re-configuring interfaces if there's=20
> a provisioned configuration for them (see connman-conf, which does=20
> this for all qemu machines) and that configuration matches the current=20
> configuration.  Would this be sufficient for the rootfs-on-NFS=20
> situation?

not really... the provisioning stuff does not seem to work for the 'ip=3Ddh=
cp' case.

I know that this case is not handled well with this patch either (it misses=
 renewal of dhcp leases, setup of dns + ntp).  But it is still better than =
actual behavior.

On first glance, the do-not-cleanup patch in connman seems to cover system =
startup only.  I might miss something, but afais, interface will be still s=
hut down in the middle of reboot which is bad because '/' is needed nearly =
to the end of shutdown.



Enrico
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

