Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A64D860810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 12:54:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4MCsVaE022426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 05:54:31 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 22 May 2013 05:54:31 -0700
Message-ID: <519CC006.6060507@windriver.com>
Date: Wed, 22 May 2013 07:54:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369188863-26540-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1369188863-26540-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH v2] patch: use PACKAGECONFIG to ensure correct dependency for xattr
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
X-List-Received-Date: Wed, 22 May 2013 12:54:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/13 9:14 PM, Saul Wold wrote:
> This will enable or disable xattr with the correct dependency
> on attr as needed.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Looks right.  :)

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   meta/recipes-devtools/patch/patch_2.7.1.bb |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
> index 38df034..16e3cc4 100644
> --- a/meta/recipes-devtools/patch/patch_2.7.1.bb
> +++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
> @@ -9,3 +9,6 @@ SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d6
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   acpaths = "-I ${S}/m4 "
> +
> +PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
> +PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
>


