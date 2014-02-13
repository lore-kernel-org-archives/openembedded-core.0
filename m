Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD546ECD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 19:00:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2014 10:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,840,1384329600"; d="scan'208";a="482993600"
Received: from dvhart-mac01.jf.intel.com (HELO [10.7.196.61]) ([10.7.196.61])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2014 11:00:10 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Thu, 13 Feb 2014 11:00:33 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?ISO-8859-1?B?Sm/jbw==?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Message-ID: <CF225582.6D067%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to
	cml1
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
	<1392291238.14081.10.camel@ted>
In-Reply-To: <1392291238.14081.10.camel@ted>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Thu, 13 Feb 2014 19:00:19 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

On 2/13/14, 3:33, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Wed, 2014-02-12 at 22:20 -0200, Jo=E3o Henrique Ferreira de Freitas
>wrote:
>> fragmentconfig() is a new task that makes a diff between the
>> old and new config files and writes to the fragment.cfg result file.
>> menuconfig() always copy the original config file, so the user
>> doesn't need to copy it.
>>=20
>> Signed-off-by: Jo=E3o Henrique Ferreira de Freitas <joaohf@gmail.com>
>> ---
>>  meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>=20
>> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
>> index e292ecb..2053361 100644
>> --- a/meta/classes/cml1.bbclass
>> +++ b/meta/classes/cml1.bbclass

One more thought on this. As this is currently linux-yocto specific, does
it belong in cml1.bbclass? It may make sense in busybox as well, so maybe
this is the right place.

RP, do you have a preference?

--=20
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





