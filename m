Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A8DA678910
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 02:25:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 18:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,448,1515484800"; d="scan'208";a="36968793"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2018 18:25:43 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 9 Mar 2018 18:25:43 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.175]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.73]) with mapi id
	14.03.0319.002; Fri, 9 Mar 2018 18:25:43 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [morty][PATCH v2] gcc6.4 upgrade
Thread-Index: AQHTuAFVGDs1nNZG2ECrkqALBGmGIqPJODQA//+AITU=
Date: Sat, 10 Mar 2018 02:25:42 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C66B28D@ORSMSX112.amr.corp.intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>,
	<CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
In-Reply-To: <CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 02:25:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This was morty upgrade, which did not have those patches to begin with, I d=
id not remove them.  The patches were not in rocko either, in the end I got=
 them from master  (gcc6.4 was eventually removed completely),=0A=
Backporting of ARM specific patches was not the objective. ( I was not awar=
e that 6.4 had an ARM specific regression which broke the pi3 builds).=0A=
Long story short, all patches should be there now, please review them, see =
the commit message for more details. =0A=
I'll make sure all other gcc6 upgrades contain the ARM patches as well.=0A=
=0A=
=0A=
=0A=

