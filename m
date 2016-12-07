Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47D7D6FFC7
	for <Openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 18:32:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB7IWv2k004376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2016 10:32:57 -0800 (PST)
Received: from [172.25.59.220] (172.25.59.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Dec 2016 10:32:56 -0800
To: <Openembedded-core@lists.openembedded.org>
References: <20161207183100.6260-1-jason.wessel@windriver.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <c809211a-7997-f9c8-d8f3-91a07a474ad5@windriver.com>
Date: Wed, 7 Dec 2016 12:32:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161207183100.6260-1-jason.wessel@windriver.com>
Subject: Re: [PATCH] liburi-perl: Uprev from 1.60 to 1.71 to pickup bugfixes and compatibilty
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
X-List-Received-Date: Wed, 07 Dec 2016 18:32:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Looks like someone beat me to it, but it had not been merged yet, so this can be ignored.

Cheers,
Jason.

On 12/07/2016 12:31 PM, Jason Wessel wrote:
> The exo recipe from meta-oe no longer compiles and some parts of
> URI::Escape no longer work due to changes in perl 5.  The main reason
> for the uprev is to pickup the fix for this problem:
>
> ERROR: \C is in regex; marked by <-- HERE in m/(\C <-- HERE )/ at /perl5/URI/Escape.pm line 205.
>
> The perl 5.24 transitioned the \C regex from deprecated into a hard
> error.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   .../perl/{liburi-perl_1.60.bb => liburi-perl_1.71.bb}             | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/perl/{liburi-perl_1.60.bb => liburi-perl_1.71.bb} (66%)
>
> diff --git a/meta/recipes-devtools/perl/liburi-perl_1.60.bb b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
> similarity index 66%
> rename from meta/recipes-devtools/perl/liburi-perl_1.60.bb
> rename to meta/recipes-devtools/perl/liburi-perl_1.71.bb
> index 8809a44..1806d93 100644
> --- a/meta/recipes-devtools/perl/liburi-perl_1.60.bb
> +++ b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
> @@ -6,14 +6,14 @@ and manipulate the various components that make up these strings."
>   SECTION = "libs"
>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>   
> -LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c453e94fae672800f83bc1bd7a38b53f"
>   
>   DEPENDS += "perl"
>   
> -SRC_URI = "http://www.cpan.org/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
> +SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
>   
> -SRC_URI[md5sum] = "70f739be8ce28b8baba7c5920ffee4dc"
> -SRC_URI[sha256sum] = "1f92d3dc64acb8845e9917c945e22b9a5275aeb9ff924eb7873c3b7a5c0d2377"
> +SRC_URI[md5sum] = "247c3da29a794f72730e01aa5a715daf"
> +SRC_URI[sha256sum] = "9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115"
>   
>   S = "${WORKDIR}/URI-${PV}"
>   



