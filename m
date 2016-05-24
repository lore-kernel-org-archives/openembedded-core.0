Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A293C606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 14:44:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 07:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708172149"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.35])
	([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 07:44:35 -0700
To: openembedded-core@lists.openembedded.org
References: <1463990948-23921-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <55dc91de-cedf-5933-df88-8c1c8dfa5868@linux.intel.com>
Date: Tue, 24 May 2016 09:46:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1463990948-23921-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH v2] ghostscript: Update URL_SRI_BASE to point to github
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
X-List-Received-Date: Tue, 24 May 2016 14:44:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch. I have sent another one [1] so this one can be 
avoided. Sorry for the noise.

[1] 
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121965.html

On 05/23/2016 03:09 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Starting at 9.18, latest releases (current and previous release) are placed on
> github [1].
>
> [1] https://github.com/ArtifexSoftware/ghostpdl-downloads/releases
>
> [YOCTO #9573]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/recipes-extended/ghostscript/ghostscript_9.18.bb | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
> index d4222c7..1d76013 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
> @@ -16,7 +16,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
>   DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
>   DEPENDS_class-native = "libpng-native"
>   
> -SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz \
> +# remove dots on PV, used on SRC_URI_BASE
> +python () {
> +       version = d.getVar('PV', True).split('.')
> +       d.setVar('PV_NODOTS', ''.join(version))
> +}
> +
> +SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${PV_NODOTS}/ghostscript-${PV}.tar.gz \
>                   file://ghostscript-9.15-parallel-make.patch \
>                   file://ghostscript-9.16-Werror-return-type.patch \
>                   file://png_mak.patch \


