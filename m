Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5743265D70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 15:46:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5CFk4ct003473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jun 2014 08:46:04 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Jun 2014 08:46:03 -0700
Message-ID: <5399CB3A.3020506@windriver.com>
Date: Thu, 12 Jun 2014 23:46:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	<openembedded-core@lists.openembedded.org>
References: <1402580166-30993-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1402580166-30993-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] openssl: install files in ${libdir}, not in ${base_libdir}
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
X-List-Received-Date: Thu, 12 Jun 2014 15:46:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/12/2014 09:36 PM, Enrico Scholz wrote:
> ${base_libdir} is not in the search path of -native binaries and they
> will try to pick the wrong openssl libraries.

Hello, I don't quite understand this, why it doesn't search
${base_libdir}, please ?

// Robert

>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index b839c00..f17f829 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -32,6 +32,10 @@ export AS = "${CC} -c"
>
>   inherit pkgconfig siteinfo multilib_header ptest
>
> +# natives don't generally look in base_libdir
> +base_libdir_class-native = "${libdir}"
> +base_libdir_class-nativesdk = "${libdir}"
> +
>   PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
>   FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>   FILES_libssl = "${libdir}/libssl.so.*"
>

