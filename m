Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SG7El-0001mG-Vo
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 13:21:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Apr 2012 04:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="86037547"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Apr 2012 04:12:37 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 Apr 2012 04:12:37 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 19:12:36 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Darren Hart
	<dvhart@linux.intel.com>
Thread-Topic: [OE-core] Do we have a package that installs the kernel
	headers and config into the target?
Thread-Index: Ac0TpDNglZsuvcTWTNSj8hhUp7EH6P//g5AA//9u5YCAALYcAP//ZSGg//6NyGA=
Date: Fri, 6 Apr 2012 11:12:34 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFD897@SHSMSX102.ccr.corp.intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Fri, 06 Apr 2012 11:21:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote on 2012-04-06:
> Darren Hart wrote on 2012-04-06:
>> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>> While I understand there are valid use cases, I think this is generally
>> contrary to workflow of the project. We build the OS, it runs on the
>> target. This is building a general purpose OS, and then having it build
>> itself out more. It doesn't feel like an embedded workflow.
BTW, my question might be simplified as:
If we strictly follow the rule the target OS shouldn't build itself out
more, why do we supply a recipe core-image-sato-sdk.bb that can
create an image with tools-sdk that includes development tools
like gcc? :-)

Or, while we recommend the common embedded workflow, we
also somewhat support (or tolerate) the way "the target builds
itself out more"?

Thanks,
-- Dexuan



