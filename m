Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EB54172EBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 14:43:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 07:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,445,1517904000"; d="scan'208";a="47648409"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2018 07:43:56 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.141]) by
	ORSMSX104.amr.corp.intel.com ([169.254.4.86]) with mapi id
	14.03.0319.002; Fri, 13 Apr 2018 07:43:55 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glib-2.0/glib.inc: fix broken mingw build
Thread-Index: AQHT0q2OlMiqcCGGfUWLhK4wX8FAQqP+tvwAgAANnOE=
Date: Fri, 13 Apr 2018 14:43:54 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C6A8201@ORSMSX112.amr.corp.intel.com>
References: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>,
	<94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
In-Reply-To: <94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH] glib-2.0/glib.inc: fix broken mingw build
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
X-List-Received-Date: Fri, 13 Apr 2018 14:43:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
> I think the better approach is to accommodate the exe suffix when doing=
=0A=
> the move:=0A=
=0A=
> mv -v ${D}${libexecdir}/gio-querymodules${EXEEXT}=0A=
> ${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}=0A=
=0A=
This was actually the first thing I tried. However, I ended up with "native=
sdk-gio-querymodules.exe"=0A=
in the mingw tarrball (in my case poky-glibc-x86_64-core-image-minimal-core=
2-64-toolchain-2.4+snapshot.tar.xz).=0A=
I am not sure what you expect postinst to do for Windows toolchains/SDKs, b=
ut I would expect =0A=
"gio-querymodules.exe", as it used to be until recently.=0A=

