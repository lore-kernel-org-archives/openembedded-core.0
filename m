Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6D21F6D2BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 15:01:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2013 08:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420846116"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 08:01:00 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 22 Oct 2013 16:00:50 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.103]) with mapi id
	14.03.0123.003; Tue, 22 Oct 2013 16:00:28 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Thread-Topic: [OE-core] [PATCH v4] connman: ignore the networking device
	which nfs for rootfs is working on
Thread-Index: AQHOzzaOovTuE2mji0qR+6T1zIw00poA0Daw
Date: Tue, 22 Oct 2013 15:00:28 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CA102D@IRSMSX105.ger.corp.intel.com>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
	<ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<969F26A8BAB325438E7EB80D3C3134FB16CA0FEC@IRSMSX105.ger.corp.intel.com>
	<ly1u3de4q9.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly1u3de4q9.fsf@ensc-virt.intern.sigma-chemnitz.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Tue, 22 Oct 2013 15:01:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I might be wrong, but I fail to see how this relates to our situation.
Care to elaborate?

Thanks,
Cristian

-----Original Message-----
From: Enrico Scholz [mailto:enrico.scholz@sigma-chemnitz.de]=20
Sent: Tuesday, October 22, 2013 5:54 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] connman: ignore the networking device whi=
ch nfs for rootfs is working on

"Iorga, Cristian" <cristian.iorga@intel.com> writes:

> Sorry to ask, what is this case: 'ip=3Ddhcp'?

That's the case when kernel gets the ip by dhcp (--> CONFIG_IP_PNP); it is =
configured by a 'ip=3Ddhcp' kernel cmdline option.


Enrico

