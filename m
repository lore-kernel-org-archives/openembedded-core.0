Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DDE0B78874
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 00:23:52 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 16:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,411,1505804400"; d="scan'208";a="177066818"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2017 16:23:53 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 17 Nov 2017 16:23:53 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.30]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.33]) with mapi id
	14.03.0319.002; Fri, 17 Nov 2017 16:23:53 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] gnutls: improve reproducibility
Thread-Index: AQHTXxP3MaOocqfn5E2F/d5Eg3sMJKMX9JyAgAFTcos=
Date: Sat, 18 Nov 2017 00:23:52 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6404703B8@ORSMSX112.amr.corp.intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
	<1510861730-82471-2-git-send-email-juro.bystricky@intel.com>,
	<CAJ86T=Xs5b3dNfaNFE_kzDJ1AMknRPqMw60gC_c+8gBA21SiNw@mail.gmail.com>
In-Reply-To: <CAJ86T=Xs5b3dNfaNFE_kzDJ1AMknRPqMw60gC_c+8gBA21SiNw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gnutls: improve reproducibility
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
X-List-Received-Date: Sat, 18 Nov 2017 00:23:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
> Is there a configure option we could use (perhaps via=0A=
> CACHED_CONFIGUREVARS) to achieve the same end result without needing=0A=
> to run sed on config.h?=0A=
=0A=
Sorry Andre, I am not quite sure I understand the question. Do you suggest =
to have a "config.h"=0A=
cached somewhere instead of generating the file at build time?=0A=
=0A=

