Return-Path: <belen.barros.pena@intel.com>
X-Greylist: delayed 658 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 10:11:30 UTC
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3A966101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 10:11:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 May 2014 03:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1058,1389772800"; d="scan'208";a="532323131"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2014 03:00:27 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 15 May 2014 10:58:52 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.28]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.50]) with mapi id
	14.03.0123.003; Thu, 15 May 2014 10:58:51 +0100
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] My thoughts on the future of OE?
Thread-Index: AQHPb5aAo1dhz2DuXEuAhJOj0yi9rpsxzjkAgA+bIgA=
Date: Thu, 15 May 2014 09:58:51 +0000
Message-ID: <CF9A4B84.441BD%belen.barros.pena@intel.com>
References: <1398963761.12731.1.camel@ted> <5367787C.1080503@enea.com>
In-Reply-To: <5367787C.1080503@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [10.237.224.30]
MIME-Version: 1.0
Subject: Re: My thoughts on the future of OE?
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
X-List-Received-Date: Thu, 15 May 2014 10:11:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7D8236DE6A83A04EB4F4C720725072B0@intel.com>
Content-Transfer-Encoding: quoted-printable

On 05/05/2014 04:39, "David Nystr=F6m" <david.nystrom@enea.com> wrote:

>How do I trace a buggy package
>installed on my target rootfs, back to an item in the locked sstate?

FWIW, you should be able to do that with Toaster, as long as you know
which one is the buggy package :) With Toaster you can navigate the build
process, from the package, to the recipe, to the tasks executed by the
build system for that recipe. As part of the tasks information, Toaster
will show you which tasks reused which sstate objects. So effectively you
can trace any package to the corresponding sstate object(s).

Cheers

Bel=E9n


