Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 09C0B6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:38:28 +0000 (UTC)
Received: (qmail 28724 invoked by uid 1003); 24 May 2016 16:38:29 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.118.32)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 May 2016 16:38:29 -0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
Date: Tue, 24 May 2016 12:38:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 28/45] swig: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 16:38:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I'm trying to get my head around how this change will impact python2
based programs that use swig, such as gnuradio.

Does this mean all programs that use swig will need to move to python3 now?

Philip

On 05/24/2016 07:54 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/swig/swig.inc | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
> index 9da40df..704bb27 100644
> --- a/meta/recipes-devtools/swig/swig.inc
> +++ b/meta/recipes-devtools/swig/swig.inc
> @@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
>  
>  SECTION = "devel"
>  
> -DEPENDS = "libpcre python"
> +DEPENDS = "libpcre python3"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>  
> -inherit autotools pythonnative
> +inherit autotools python3native
>  
>  EXTRA_OECONF = " \
> -    --with-python=${PYTHON} \
> +    --with-python3=${PYTHON} \
>      --without-allegrocl \
>      --without-android \
>      --without-boost \
> @@ -33,7 +33,6 @@ EXTRA_OECONF = " \
>      --without-perl5 \
>      --without-pike \
>      --without-php \
> -    --without-python3 \
>      --without-r \
>      --without-ruby \
>      --without-tcl \
> 

