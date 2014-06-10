Return-Path: <max.eliaser@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 943AB65D5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 21:53:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jun 2014 14:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1011,1392192000"; d="scan'208";a="444005610"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by azsmga001.ch.intel.com with ESMTP; 10 Jun 2014 14:52:53 -0700
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 10 Jun 2014 14:52:52 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.160]) by
	ORSMSX157.amr.corp.intel.com ([169.254.9.165]) with mapi id
	14.03.0123.003; Tue, 10 Jun 2014 14:52:52 -0700
From: "Eliaser, MaX" <max.eliaser@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/3] Suppress Texinfo utilities invoked at
	build time for -cross & native recipes (revised)
Thread-Index: AQHPhOovuyS7H+bjAUGy3vbAq2GAaJtrS1CA//+WldI=
Date: Tue, 10 Jun 2014 21:52:52 +0000
Message-ID: <E88D0531F83F3744B03D1A909A2B070F5C4D39@ORSMSX110.amr.corp.intel.com>
References: <cover.1402431641.git.max.eliaser@intel.com>,
	<5397736B.5000301@windriver.com>
In-Reply-To: <5397736B.5000301@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Suppress Texinfo utilities invoked at build time for -cross & native recipes (revised)
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
X-List-Received-Date: Tue, 10 Jun 2014 21:53:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Shouldn't be a problem. It's only if the class is "native" or "cross" that =
the impostor texinfo utils get used. I believe "nativesdk" and "crosssdk" a=
re separate from "native" and "cross".=20

-Max
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Mark Hatle [mark.hatle@windrive=
r.com]
Sent: Tuesday, June 10, 2014 2:06 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/3] Suppress Texinfo utilities invoked at bu=
ild time for -cross & native recipes (revised)

There are a few cases, where I've wanted texinfo processed files to be ship=
ped
as part of an SDK.  Specifically nativesdk and the SDK cross compiler packa=
ges.
  Will this affect either of those cases?

(Looking at the code, I don't think it will, but I wanted to check.)

--Mark=

