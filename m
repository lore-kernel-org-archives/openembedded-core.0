Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qbvir-00075f-M0
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:26:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 07:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="21504972"
Received: from unknown (HELO [10.24.82.35]) ([10.24.82.35])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 07:22:50 -0700
Message-ID: <4E0B353A.2020504@linux.intel.com>
Date: Wed, 29 Jun 2011 07:22:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309305731.git.sgw@linux.intel.com>	<8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>
	<1309346750.2551.18.camel@phil-desktop>
In-Reply-To: <1309346750.2551.18.camel@phil-desktop>
Subject: Re: [PATCH 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Wed, 29 Jun 2011 14:26:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2011 04:25 AM, Phil Blundell wrote:
> On Tue, 2011-06-28 at 17:07 -0700, Saul Wold wrote:
>> +staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
>> +FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
>
> Does that actually work?  I wouldn't have expected the pattern to get
> globbed early enough for the oe_filter_out to have any effect.
>
Yes it does, I have tested it.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


