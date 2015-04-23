Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 750AB6E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 01:15:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N1FYr3023307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 18:15:34 -0700 (PDT)
Received: from [128.224.162.139] (128.224.162.139) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Apr 2015 18:15:34 -0700
Message-ID: <553847B5.2000306@windriver.com>
Date: Thu, 23 Apr 2015 09:15:33 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1427677002-12772-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1427677002-12772-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] libxml-simple-perl/libconvert-asn1-perl: using PERLHOSTLIB
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
X-List-Received-Date: Thu, 23 Apr 2015 01:15:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年03月30日 08:56, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Using PERLHOSTLIB as possible, which is same as
> ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb   | 2 +-
>   meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
> index b72afc0..4721b4b 100644
> --- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
> +++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "5cff13d0802792da1eb45895ce1be461903d98ec97c9c953bc8406af72
>
>   S = "${WORKDIR}/XML-Simple-${PV}"
>
> -EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
> +EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
>
>   inherit cpan
>
> diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> index ebe0422..170e7ec 100644
> --- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> +++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> @@ -12,6 +12,6 @@ S = "${WORKDIR}/Convert-ASN1-${PV}"
>
>   inherit cpan
>
> -EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
> +EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
>
>   BBCLASSEXTEND = "native"
>

-- 
Best Reagrds,
Roy | RongQing Li

