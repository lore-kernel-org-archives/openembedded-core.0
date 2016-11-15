Return-Path: <radzy@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5FED605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:13:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAFKDAJ2022545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Nov 2016 12:13:10 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.156]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 15 Nov 2016 12:13:09 -0800
From: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] OpenSSL: CVE-2004-2761 replace MD5 hash
	algorithm
Thread-Index: AQHSP3jxZVnguYC/7Eu5PCEckwn8SKDa/KWA//988y4=
Date: Tue, 15 Nov 2016 20:13:08 +0000
Message-ID: <33006C99F5A5194A9B7A7715DFA3E3830119303B11@ALA-MBA.corp.ad.wrs.com>
References: <1479239005-26229-1-git-send-email-radzy@windriver.com>,
	<CAJTo0LZFy4Y23DjQC=v-3-P4HzVoZCOOPWwYNkty4CCxVfGj+Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZFy4Y23DjQC=v-3-P4HzVoZCOOPWwYNkty4CCxVfGj+Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.78]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] OpenSSL: CVE-2004-2761 replace MD5 hash algorithm
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
X-List-Received-Date: Tue, 15 Nov 2016 20:13:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________________
> From: Burton, Ross [ross.burton@intel.com]
> Sent: Tuesday, November 15, 2016 11:59 AM
> To: Radzykewycz, T (Radzy)
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH] OpenSSL: CVE-2004-2761 replace MD5 hash al=
gorithm
>=20
> On 15 November 2016 at 19:43, T.O. Radzy Radzykewycz <radzy@windriver.com=
<mailto:radzy@windriver.com>> wrote:
>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb<http://openssl_1.0.2h=
.bb> |  1 +
>=20
> oe-core master is on openssl 1.0.2j now, so please rebase.
>=20
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-=
not-MD5-as-default-digest.patch
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5=
-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl/Use-SH=
A256-not-MD5-as-default-digest.patch
> new file mode 100644
> index 000000000000..766af67e1db9
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-def=
ault-digest.patch
> @@ -0,0 +1,59 @@
> +From d795f5f20a29adecf92c09459a3ee07ffac01a99 Mon Sep 17 00:00:00 2001
> +From: Rich Salz <rsalz@akamai.com<mailto:rsalz@akamai.com>>
> +Date: Sat, 13 Jun 2015 17:03:39 -0400
> +Subject: [PATCH] Use SHA256 not MD5 as default digest.
> +
> +Commit f8547f62c212837dbf44fb7e2755e5774a59a57b upstream.
> +
> +Upstream Status: Backport
>=20
> I'm such a pedant but we do have automated tooling around this, so please=
 use "Upstream-Status".  Also adding a CVE tag in the patch (CVE: CVE-2004-=
2761) would be appreciated for tracking.

Thanks for the great feedback!

I'll send a new patch shortly.

Enjoy!

-- radzy

PS: The instructions at
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
seem to indicate that you should not use master.  Since I seem to have
misunderstood, please forgive my ignorance.

> Ross

