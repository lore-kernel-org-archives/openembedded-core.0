Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RFpaa-0000HB-Ih
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 17:58:57 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2011 08:53:09 -0700
Received: by wwe6 with SMTP id 6so1574020wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:53:08 -0700 (PDT)
Received: by 10.216.136.66 with SMTP id v44mr3972158wei.47.1318866787905;
	Mon, 17 Oct 2011 08:53:07 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id e7sm31811824wbh.12.2011.10.17.08.53.04
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 08:53:06 -0700 (PDT)
Message-ID: <4E9C4F5E.2050305@intel.com>
Date: Mon, 17 Oct 2011 08:53:02 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318606540-14130-1-git-send-email-philip@balister.org>
In-Reply-To: <1318606540-14130-1-git-send-email-philip@balister.org>
Subject: Re: [v2 1/1] cmake : Disable building ccmake.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2011 15:58:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/2011 08:35 AM, Philip Balister wrote:
> ccmake fails to build due to an as-needed type error with -ltinfo. Disable
> it for now since the build fails and cmake is what we need for target
> sdk.
>
> Signed-off-by: Philip Balister<philip@balister.org>
> ---
>   meta/recipes-devtools/cmake/cmake_2.8.5.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> index 4fa9562..8e04072 100644
> --- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> +++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
> @@ -4,7 +4,7 @@ inherit cmake
>
>   DEPENDS += "curl expat zlib libarchive ncurses"
>
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   SRC_URI += "file://dont-run-cross-binaries.patch"
>
> @@ -30,6 +30,7 @@ EXTRA_OECMAKE=" \
>       -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
>       -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
>       -DKWSYS_CHAR_IS_SIGNED=1 \
> +    -DBUILD_CursesDialog=0 \
>       ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
>   "
>
Merged into OE-Core

Thanks
	Sau!



