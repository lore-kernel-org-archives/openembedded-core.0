Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4BD71C0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:51:31 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 194so23693895pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=MuwPZetmjhRYYvUeVL9J1qtwb3mawpV83fIgM6OH2qM=;
	b=g6nDMVBwIa8hGkEONr/X4F+02e8LyDcOx+qfMMSrx5a40qtkLRmI8uUOQx3/sQaAvI
	gB7fmcCqVf98bV4O1wTEyx+swTOmB7nWKYHgJb5OHsCAVSpwXK87InKTXc2Al7y/qRsw
	KtwvV6NXAoGua05Gi1w55kHlK3RXi4/8QE4Xcp3ru8GHjdf8pdKALKcFmumN4d5jtyRn
	YFiFujpg/doKklnA3Y6hNyLXRGE7fKSOz/des4JsSP4jZzxpEnuIzAD1QkH+kudJl+/J
	zNdH4qyLa5/4xrJflpljJZvKQu37kusgbqkHlPezVDCiXZGOMnIJpzHGU1pjVX/ICeBO
	HJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MuwPZetmjhRYYvUeVL9J1qtwb3mawpV83fIgM6OH2qM=;
	b=CxYpj2DTztiTKXkN5+j/18KnHjBQvLR98HDUmxNHq4GVX5ixUO/X94EPrRS9Er3rLV
	zftToc1kqjnb2AuZancg/ergEvpBqAXBfmt3NZXzcpAi59bAmPTHK4KLRKgoJQehxy25
	8DDgQdSv0/iZedygUxg3ztZGDOEyg+kIyYlsL0d7wWuM4XVYIH0q1MniwTr7LMQIUk+C
	j12JH/k41wGy/jDFMvTCWKS0bFl37/7f22lfltIxQ82/0lC7xgI22hivNWd06xkzyI3U
	u/mtRgXZdpRCBn4GdS9AcgO1y70mQYggI/fh7aTbD6T359FUW/8JQ3hORfS3DFjuFF/x
	2BHg==
X-Gm-Message-State: AIkVDXIZv/47n8i/53PhfEcozqQDm4TGmjh1H8juq5ldiwAJpFavLp2YWZUAlXpOIEEImQ==
X-Received: by 10.99.62.73 with SMTP id l70mr6553418pga.97.1485481892118;
	Thu, 26 Jan 2017 17:51:32 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6524:a1c0:a396:fda9])
	by smtp.gmail.com with ESMTPSA id
	u75sm6171234pgc.31.2017.01.26.17.51.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 17:51:31 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1485424663-18235-1-git-send-email-yannick.gicquel@iot.bzh>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <95c87569-1002-c231-03f5-c00549ea32ad@gmail.com>
Date: Thu, 26 Jan 2017 17:51:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485424663-18235-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: Re: [PATCH] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Fri, 27 Jan 2017 01:51:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/26/17 1:57 AM, Yannick Gicquel wrote:
> This allows ccache usage for recipes which inherit cmake.bbclass.
> Since cmake v3.4, it can be enabled using some "-D" options.
> 
> Here below are some metrics while using it for webkitgtk recipe.
> (machine is a 4x core i7 @ 3.4GHz)
> 
> $ bitbake -c fetchall webkitgtk
> $ time bitbake webkitgtk
> <snip>
> real	56m25.191s
> user	359m32.003s
> sys	34m49.356s
> 
> $ bitbake -c clean webkitgtk
> $ bitbake -c cleansstate webkitgtk
> $ time bitbake webkitgtk
> <snip>
> real	25m19.298s
> user	17m57.861s
> sys	6m20.157s

This looks lucerative. However, does this work with cmake in all cmake
based recipes would be interesting to know.

> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/cmake.bbclass | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 9e74599..737a4e0 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -4,12 +4,9 @@ OECMAKE_SOURCEPATH ?= "${S}"
>  DEPENDS_prepend = "cmake-native "
>  B = "${WORKDIR}/build"
>  
> -# We need to unset CCACHE otherwise cmake gets too confused
> -CCACHE = ""
> -
>  # C/C++ Compiler (without cpu arch/tune arguments)
> -OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
> -OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_C_COMPILER ?= "${@'${CC}'.replace('${CCACHE}','',1).split(' ')[0]}"
> +OECMAKE_CXX_COMPILER ?= "${@'${CXX}'.replace('${CCACHE}','',1).split(' ')[0]}"
>  OECMAKE_AR ?= "${AR}"
>  
>  # Compiler flags
> @@ -108,9 +105,16 @@ cmake_do_configure() {
>  		OECMAKE_SITEFILE=""
>  	fi
>  
> +	if [ -n "${CCACHE}" ]; then
> +		OECMAKE_CCACHE="-DCMAKE_C_COMPILER_LAUNCHER=${CCACHE} -DCMAKE_CXX_COMPILER_LAUNCHER=${CCACHE}"
> +	else
> +		OECMAKE_CCACHE=""
> +	fi
> +
>  	cmake \
>  	  ${OECMAKE_SITEFILE} \
>  	  ${OECMAKE_SOURCEPATH} \
> +	  ${OECMAKE_CCACHE} \
>  	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>  	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
>  	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
> 

