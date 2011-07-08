Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qf08E-0005Pb-Hv
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:45:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 18:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24715304"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 18:41:32 -0700
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 09:40:43 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Fri, 8 Jul 2011 09:40:43 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 8 Jul 2011
	09:40:42 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 09:40:40 +0800
Thread-Topic: [OE-core] [PATCH 1/1] powertop: inherit update-alternatives
	and use	a higher priority than busybox
Thread-Index: Acw8vFWX4OV9gqIASBeJrVgh+pN7qQATaVOw
Message-ID: <1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
	<4E15D389.9040906@mentor.com>
In-Reply-To: <4E15D389.9040906@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] powertop: inherit update-alternatives and use	a higher priority than busybox
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
X-List-Received-Date: Fri, 08 Jul 2011 01:45:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tom Rini wrote:
> On 07/07/2011 01:39 AM, Dexuan Cui wrote:
>> busybox-1.18.4 installs /bin/powertop and the powertop recipe
>> installs /usr/bin/powertop. So, in PATH, if /bin appears before
>> /usr/bin, we would run the version offered by busybox, which has a
>> very limited function (e.g., no parameter is accepted) and this
>> causes trouble to eclipse plugin.=20
>>=20
>> We can use update-alternatives for powertop with higher priority to
>> resolve the issue.=20
>>=20
>> Fixes [YOCTO #1208]
>>=20
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>=20
> This fix seems a bit incomplete.  Why is busybox putting powertop into
> /bin when it almost certainly belongs in /usr/bin like the real recipe
> was placing it.  busybox needs a fix here too.
Thanks for the comment!=20
I was hesitant about fixing busybox as I wasn't sure if it's worthy to make=
 a patch to only fix the path for busybox. I don't know why busybox puts it=
 into /bin. I think the best place may be /usr/sbin/.=20
A little unluckily this patch to powertop has been already in poky master..=
. So maybe we could try to fix the recipes in future, e.g., when upgrading =
them.

Thanks,
-- Dexuan=


