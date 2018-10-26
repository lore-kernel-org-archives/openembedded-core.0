Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 044F579A4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 08:14:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9Q8ExtN002651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Oct 2018 01:14:59 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 26 Oct 2018 01:14:58 -0700
To: Joris Offouga <offougajoris@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1540540475-16854-1-git-send-email-offougajoris@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a5ba8f2f-ad47-d177-e1b6-fc7fee05d429@windriver.com>
Date: Fri, 26 Oct 2018 16:21:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1540540475-16854-1-git-send-email-offougajoris@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [meta-python][PATCHV2] Add recipes for django rest framework
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
X-List-Received-Date: Fri, 26 Oct 2018 08:14:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joris,

I think this patch should be sent to 
openembedded-devel@lists.openembedded.org
Title should be "[oe][meta-python][PATCH] Add recipes for django rest 
framework"

Best Regards,
Chen Qi

On 10/26/2018 03:54 PM, Joris Offouga wrote:
> For create a database with django
>
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>   .../python/python-djangorestframework.inc                | 16 ++++++++++++++++
>   .../python/python-djangorestframework_3.9.0.bb           |  2 ++
>   .../python/python3-djangorestframework_3.9.0.bb          |  2 ++
>   3 files changed, 20 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc
>   create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
> new file mode 100644
> index 0000000..8551a83
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-djangorestframework.inc
> @@ -0,0 +1,16 @@
> +SUMMARY =  "djangorestframework"
> +DESCRIPTION = "pip3 install djangorestframework"
> +HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
> +
> +SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
> +SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
> +PYPI_PACKAGE = "djangorestframework"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-django \
> +"
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
> new file mode 100644
> index 0000000..540d12d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
> @@ -0,0 +1,2 @@
> +require python-djangorestframework.inc
> +inherit setuptools
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> new file mode 100644
> index 0000000..9ed6d17
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> @@ -0,0 +1,2 @@
> +require python-djangorestframework.inc
> +inherit setuptools3
> \ No newline at end of file



