Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SD9jO-0001Tf-NY
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:25:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Mar 2012 00:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124681069"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 29 Mar 2012 00:16:04 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 29 Mar 2012 00:16:04 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Thu, 29 Mar 2012 15:15:36 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [PATCH 1/6] self-hosted-image: pre-populate the builder user
	with poky source
Thread-Index: AQHNC9x9tQfWfHCZDE+TsYaNASK1gZZ/2JZQ///XEQCAAPECgA==
Date: Thu, 29 Mar 2012 07:15:36 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCEA299@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCE9C6F@SHSMSX102.ccr.corp.intel.com>
	<4F737D80.60802@linux.intel.com>
In-Reply-To: <4F737D80.60802@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] self-hosted-image: pre-populate the builder user with poky source
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
X-List-Received-Date: Thu, 29 Mar 2012 07:25:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2012-03-29:
> On 03/28/2012 08:35 AM, Cui, Dexuan wrote:
>> Hi Saul,
>> Did you test "bitbake core-image-minimal" inside the vmware guest?
>> I got the following ERROR immediately:
>>      Pseudo is not functioning correctly, which will cause failures
>> I suspect in the guest, pseudo is not setup properly?=20
> This should be addressed by the 5/6 patch that adds the correct
> PSEUDO_* setup into the minix session script.
> I guess that you tried to run this on the command line and as you
> might notice I modified the bashrc, but for some reason that did not
> get picked up when the shell started up, I think we need to force the
> builder user to get /bin/bash as a shell not /bin/sh
Hi Saul,
I'm sorry -- this is actually a false alarm -- I didn't use the updated
branch...
With the latest poky master, bitbake in cmd line can work fine.
Hob is automatically started and can work fine, too.

Thanks,
-- Dexuan


