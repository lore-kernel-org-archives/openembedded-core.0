Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8B0677DB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:58:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 08:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; d="scan'208";a="25440153"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2018 08:58:09 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.15]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.218]) with mapi id
	14.03.0319.002; Mon, 8 Jan 2018 08:56:17 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] icu-dev: improve reproducibility
Thread-Index: AQHTh9jgo7gZ3jn0Sk2V826HjXDrfKNqMBiAgAACZXw=
Date: Mon, 8 Jan 2018 16:56:16 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6404A5DAE@ORSMSX112.amr.corp.intel.com>
References: <1515344359-82351-1-git-send-email-juro.bystricky@intel.com>
	<1515344359-82351-2-git-send-email-juro.bystricky@intel.com>,
	<1515401045.29722.45.camel@linuxfoundation.org>
In-Reply-To: <1515401045.29722.45.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH 2/2] icu-dev: improve reproducibility
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
X-List-Received-Date: Mon, 08 Jan 2018 16:58:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
> Hardcoded /usr/lib?=0A=
=0A=
> https://autobuilder.yocto.io/builders/nightly-multilib/builds/703/steps/B=
uildImages_2/logs/stdio=0A=
=0A=
yes, exactly. Will replace /usr/lib -> ${libdir} and retest with a MULTILIB=
 build . =0A=
=0A=

