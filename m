Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6457474F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 21:20:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 14:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,383,1517904000"; d="scan'208";a="38235556"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2018 14:20:24 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 30 Mar 2018 14:20:24 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.146]) by
	ORSMSX115.amr.corp.intel.com ([169.254.4.6]) with mapi id
	14.03.0319.002; Fri, 30 Mar 2018 14:20:24 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-yocto_4.14.bb: fix for deterministic
	srcversion
Thread-Index: AQHTyGjSvXkfgSOUA0O6oELJhn3+R6PpuEkA//+Ox0M=
Date: Fri, 30 Mar 2018 21:20:23 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C68B59D@ORSMSX112.amr.corp.intel.com>
References: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>,
	<CADkTA4P3_Cwp2s4SPXb17-v2jnMQOVV_ZeN2EnnDuKzaQrVUxQ@mail.gmail.com>
In-Reply-To: <CADkTA4P3_Cwp2s4SPXb17-v2jnMQOVV_ZeN2EnnDuKzaQrVUxQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto_4.14.bb: fix for deterministic srcversion
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
X-List-Received-Date: Fri, 30 Mar 2018 21:20:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have also tested it with git linux, about v16-rc1 (581e400ff935d34d958112=
58586128bf11baef15 to be exact) .=0A=
I agree there should be a better way than SRC_URI. The patched code is, I b=
elieve, pretty ancient so the problem=0A=
has been around for a long time.=0A=
=0A=

