Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 347AD71DEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:06:59 +0000 (UTC)
Received: (qmail 21329 invoked by uid 1003); 22 Feb 2017 20:07:00 -0000
Received: from unknown (HELO ?10.11.12.207?) (philip@opensdr.com@67.23.202.154)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Feb 2017 20:07:00 -0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<332a0ca4ef8ca0aef8f7235b80f27cb298172279.1487774787.git.alexander.kanavin@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <02faa27d-fc31-2d67-90c0-9fde48fa66a3@balister.org>
Date: Wed, 22 Feb 2017 12:06:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <332a0ca4ef8ca0aef8f7235b80f27cb298172279.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 11/24] cmake: update to 3.7.2
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
X-List-Received-Date: Wed, 22 Feb 2017 20:07:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Already in master-next, d3e5a6d38870ecede87812cb81c0b5630bd3b3ff

Philip

On 02/22/2017 06:51 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb}            | 0
>  meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
>  meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}        | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
>  rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.7.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.7.1.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 18e547de0cc..131ff70e584 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
>             "
>  
> -SRC_URI[md5sum] = "d031d5a06e9f1c5367cdfc56fbd2a1c8"
> -SRC_URI[sha256sum] = "449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1"
> +SRC_URI[md5sum] = "79bd7e65cd81ea3aa2619484ad6ff25a"
> +SRC_URI[sha256sum] = "dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0"
>  
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> diff --git a/meta/recipes-devtools/cmake/cmake_3.7.1.bb b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.7.1.bb
> rename to meta/recipes-devtools/cmake/cmake_3.7.2.bb
> 

