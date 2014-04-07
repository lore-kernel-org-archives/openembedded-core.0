Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBE296B523
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 08:49:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2014 01:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,808,1389772800"; d="scan'208";a="515683987"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2014 01:48:59 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 7 Apr 2014 09:48:57 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.180]) with mapi id
	14.03.0123.003; Mon, 7 Apr 2014 09:48:57 +0100
From: "Voicu, Cristiana" <cristiana.voicu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Damian, Alexandru"
	<alexandru.damian@intel.com>
Thread-Topic: [OE-core] [PATCH 08/15] toaster.bbclass: image file is missing
	a "/"
Thread-Index: AQHPUA8E+r5lJWiuWEOlUKpfM/GHhZsBb4sAgARsXbA=
Date: Mon, 7 Apr 2014 08:48:56 +0000
Message-ID: <BE68E9C8E0850C43B0F0B0B7D57FA5AE34A55119@IRSMSX105.ger.corp.intel.com>
References: <1396620314-32484-1-git-send-email-alexandru.damian@intel.com>
	<1396620878.13862.6.camel@ted>
In-Reply-To: <1396620878.13862.6.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/15] toaster.bbclass: image file is missing a "/"
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
X-List-Received-Date: Mon, 07 Apr 2014 08:49:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will resend the patch directly to this mailing list, since it has been re=
viewed on toaster ml.
Cristiana

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Friday, April 4, 2014 5:15 PM
To: Damian, Alexandru
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 08/15] toaster.bbclass: image file is missing=
 a "/"

On Fri, 2014-04-04 at 15:05 +0100, Alex DAMIAN wrote:
> From: Cristiana Voicu <cristiana.voicu@intel.com>
>=20
> Relaced the key with the join between path and file name.
>=20
> [YOCTO #6090]
>=20
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>  meta/classes/toaster.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/toaster.bbclass=20
> b/meta/classes/toaster.bbclass index 9fb2cec..d2fa82d 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> --
> 1.9.1

This patch does not look right...

Cheers,

Richard

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

