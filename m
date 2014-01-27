Return-Path: <david.c.stewart@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B5CCD6E831
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 17:23:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2014 09:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,730,1384329600"; d="scan'208";a="445323743"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2014 09:23:51 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 27 Jan 2014 09:23:51 -0800
Received: from orsmsx105.amr.corp.intel.com ([169.254.4.200]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.247]) with mapi id
	14.03.0123.003; Mon, 27 Jan 2014 09:23:51 -0800
From: "Stewart, David C" <david.c.stewart@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] local.conf.sample: Add automatic defaults
	for BB_NUMBER_THREADS and PARALLEL_MAKE
Thread-Index: AQHPG2210aCo1l5FaEyMdtPDK+So/JqZTX6A//+EwQA=
Date: Mon, 27 Jan 2014 17:23:50 +0000
Message-ID: <CF0BD5FA.79232%david.c.stewart@intel.com>
References: <1390833588.17424.254.camel@ted>
	<CAP9ODKpr8ydsGUYdniyFwO1pgp9pOW4+RcU78SxhOhRRn4XEVw@mail.gmail.com>
In-Reply-To: <CAP9ODKpr8ydsGUYdniyFwO1pgp9pOW4+RcU78SxhOhRRn4XEVw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.3.9.131030
x-originating-ip: [10.24.4.93]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 27 Jan 2014 17:23:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC8C3542E75D9C43853645F3FE75EA0D@intel.com>
Content-Transfer-Encoding: quoted-printable



On 1/27/14, 8:45 AM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:

>On Mon, Jan 27, 2014 at 12:39 PM, Richard Purdie
><richard.purdie@linuxfoundation.org> wrote:
>> Its rather sad that people don't appear to read local.conf and then
>>complain
>> about slow builds when they're just using a single thread. Most systems
>>have
>> more than one core now so we might as well use a more automatic default
>> for these values. This may lead to better experiences for new users.
>>
>> [YOCTO #2528]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Nice! Now if we could just convince people to configure their VM guests
with enough cpus -=20

:-)



