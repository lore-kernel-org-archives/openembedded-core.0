Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 250A277733
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:56:19 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <1473198083-19785-1-git-send-email-schnitzeltony@googlemail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <b22d48a3-3fb3-5ee2-3351-e94e30480511@embed.me.uk>
Date: Wed, 7 Sep 2016 10:56:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1473198083-19785-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] cmake.bbclass: avoid treating imports as system includes
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
X-List-Received-Date: Wed, 07 Sep 2016 09:56:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/09/16 22:41, Andreas Müller wrote:
> CMake sets all imported headers as system headers. This causes trouble for c++
> projects [1].
>
> Thanks to Jack Mitchell for pointing to the setting [2]. Build tested upon
> meta-qt5-extra-world which had lots of fallout before.
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2016-September/126067.html
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/cmake.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 5203d8a..7091f8b 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -120,6 +120,7 @@ cmake_do_configure() {
>  	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
>  	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
>  	  -DCMAKE_VERBOSE_MAKEFILE=1 \
> +	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
>  	  ${EXTRA_OECMAKE} \
>  	  -Wno-dev
>  }
>

This is cleaner than my implementation.

Acked By: Jack Mitchell <jack@embed.me.uk>

