Return-Path: <yin.thong.choong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 97F4773068
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 07:56:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 05 Apr 2017 00:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,277,1486454400"; d="scan'208";a="842134436"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2017 00:56:37 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.238]) by
	KMSMSX152.gar.corp.intel.com ([169.254.11.200]) with mapi id
	14.03.0319.002; Wed, 5 Apr 2017 15:55:28 +0800
From: "Choong, Yin Thong" <yin.thong.choong@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 4/8] logrotate: replace fedorahosted.org
	SRC_URI with github.com source
Thread-Index: AQHSrSX9i70PvmOcSUCYDU8dGvbG56G0f0yAgAHqLvA=
Date: Wed, 5 Apr 2017 07:55:27 +0000
Message-ID: <CF0C948DE8E2634BB64BF489FF9EF7E7CB2732@PGSMSX105.gar.corp.intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
	<1491298154-68270-5-git-send-email-yin.thong.choong@intel.com>
	<a178ed58-d530-6097-d341-f9203504f06d@linux.intel.com>
In-Reply-To: <a178ed58-d530-6097-d341-f9203504f06d@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/8] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Wed, 05 Apr 2017 07:56:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. We will upstream the V3 patch once amended.

Thanks and Regards
Choong YinThong

-----Original Message-----
From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]=20
Sent: Tuesday, April 4, 2017 6:40 PM
To: openembedded-core@lists.openembedded.org; Choong, Yin Thong <yin.thong.=
choong@intel.com>
Subject: Re: [OE-core] [PATCH v2 4/8] logrotate: replace fedorahosted.org S=
RC_URI with github.com source

On 04/04/2017 12:29 PM, yin.thong.choong@intel.com wrote:
> -SRC_URI =3D=20
> "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
> z \
> +S =3D "${WORKDIR}/${PN}-r3-9-1"
> +
> +UPSTREAM_CHECK_URI =3D "https://github.com/${PN}/${PN}/releases"
> +
> +SRC_URI =3D "https://github.com/${PN}/${PN}/archive/r3-9-1.tar.gz \

Why are we taking a github snapshot tarball (which is not standard parctice=
 in oe-core)? Put a comment here that when updating logrotate to latest ups=
tream, SRC_URI should point to a proper release tarball from https://github=
.com/logrotate/logrotate/releases and we have to take the snapshot for now =
because there is no such tarball available for 3.9.1.

Generally, don't be afraid to put comments next to your changes, the more t=
he better! And especially when you are doing something unusual that is not =
self-explanatory like above.

Otherwise, I am happy with the patchset!

Alex


