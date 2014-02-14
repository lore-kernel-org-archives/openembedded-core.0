Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8729B6EF8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 16:15:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Feb 2014 08:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,845,1384329600"; d="scan'208";a="455596127"
Received: from pas9-mobl2.gar.corp.intel.com (HELO [10.254.185.145])
	([10.254.185.145])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2014 08:14:40 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Fri, 14 Feb 2014 08:15:03 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <CF238059.6D5FB%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to
	cml1
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
	<1392291238.14081.10.camel@ted>
	<CF225582.6D067%dvhart@linux.intel.com>
	<1392392807.14081.51.camel@ted>
In-Reply-To: <1392392807.14081.51.camel@ted>
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
X-List-Received-Date: Fri, 14 Feb 2014 16:15:50 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

On 2/14/14, 7:46, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Thu, 2014-02-13 at 11:00 -0800, Darren Hart wrote:
>> On 2/13/14, 3:33, "Richard Purdie" <richard.purdie@linuxfoundation.org>
>> wrote:
>>=20
>> >On Wed, 2014-02-12 at 22:20 -0200, Jo=E3o Henrique Ferreira de Freitas
>> >wrote:
>> >> fragmentconfig() is a new task that makes a diff between the
>> >> old and new config files and writes to the fragment.cfg result file.
>> >> menuconfig() always copy the original config file, so the user
>> >> doesn't need to copy it.
>> >>=20
>> >> Signed-off-by: Jo=E3o Henrique Ferreira de Freitas <joaohf@gmail.com>
>> >> ---
>> >>  meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 35 insertions(+)
>> >>=20
>> >> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
>> >> index e292ecb..2053361 100644
>> >> --- a/meta/classes/cml1.bbclass
>> >> +++ b/meta/classes/cml1.bbclass
>>=20
>> One more thought on this. As this is currently linux-yocto specific,
>>does
>> it belong in cml1.bbclass? It may make sense in busybox as well, so
>>maybe
>> this is the right place.
>>=20
>> RP, do you have a preference?
>
>Its starting to head in a direction we could probably use a
>kern-tools.bbclass to keep the code in a common place.

I wonder if something like kconfig.bbclass, rather than tying it to the
linux-yocto tooling (as it doesn't use any of the tooling to create the
fragment). Busybox could then use this, for example (not that it couldn't
include kern-tools.bbclass, it just seems a bit less natural to do so).

--=20
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





