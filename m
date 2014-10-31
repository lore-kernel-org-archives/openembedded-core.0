Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8094765E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 07:52:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9V7qKpf021412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 00:52:20 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 31 Oct 2014 00:52:19 -0700
Message-ID: <54533FB1.9040806@windriver.com>
Date: Fri, 31 Oct 2014 15:52:17 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1414566472.git.Chong.Lu@windriver.com>
	<ba7a4bc229dc090e4b8242ca3f784c15a1656518.1414566472.git.Chong.Lu@windriver.com>
In-Reply-To: <ba7a4bc229dc090e4b8242ca3f784c15a1656518.1414566472.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] docbook-xsl-stylesheets: add perl to RDEPENDS
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
X-List-Received-Date: Fri, 31 Oct 2014 07:52:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop this one, I will send a V2.

Best Regards
Chong

On 10/29/2014 03:08 PM, Chong Lu wrote:
> This solves the following warning:
>
> docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires /usr/bin/perl,
> /bin/bash, but no providers in its RDEPENDS [file-rdeps]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
> index 39528c8..b546043 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
> @@ -36,6 +36,7 @@ do_install () {
>   		roundtrip slides template tests tools webhelp website \
>   		xhtml xhtml-1_1 catalog.xml \
>   	${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
> +	sed -e "s|bash|sh|g" -i ${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1/tools/bin/docbook-xsl-update
>   
>   	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-1.78.1/VERSION.xsl
>   
> @@ -63,5 +64,6 @@ docbook_xsl_stylesheets_sysroot_preprocess () {
>       sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
>   }
>   
> +RDEPENDS_${PN} += "perl"
>   FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
>   FILES_${PN}-doc = "${datadir}/doc/*"


