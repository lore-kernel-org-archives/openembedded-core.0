Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrBw0-0007Id-AD
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 19:24:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2013 10:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,411,1355126400"; d="scan'208";a="272941067"
Received: from unknown (HELO [10.255.14.97]) ([10.255.14.97])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2013 10:08:49 -0800
Message-ID: <50E71AAE.7010106@linux.intel.com>
Date: Fri, 04 Jan 2013 10:08:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357245391-11055-5-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/15] file: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 18:24:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
> Add obsolete-automake-macros.patch that replaces automake macros
> no longer supported by automake-1.13 with modern constructs.
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
>   meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>
> diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
> new file mode 100644
> index 0000000..61ee062
> --- /dev/null
> +++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
> @@ -0,0 +1,15 @@
> +Upstream-status: Not sent
> +
What does "Not sent" mean here?  Is it Pending? You plan to submit it?

Also the correct Tag is "Upstream-Status" both caps.

Sau!

> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd file-5.11/configure.ac file-5.11/configure.ac
> +--- file-5.11/configure.ac	2012-02-21 21:16:29.000000000 +0200
> ++++ file-5.11/configure.ac	2013-01-02 07:18:23.004856505 +0200
> +@@ -3,7 +3,7 @@
> + AM_INIT_AUTOMAKE()
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> +
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> + AC_CONFIG_MACRO_DIR([m4])
> +
> + AC_MSG_CHECKING(for builtin ELF support)
> diff --git a/meta/recipes-devtools/file/file_5.11.bb b/meta/recipes-devtools/file/file_5.11.bb
> index be6a863..52ae460 100644
> --- a/meta/recipes-devtools/file/file_5.11.bb
> +++ b/meta/recipes-devtools/file/file_5.11.bb
> @@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
>
>   DEPENDS = "zlib file-native"
>   DEPENDS_class-native = "zlib-native"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
>              file://fix_version_check.patch \
> +           file://obsolete_automake_macros.patch \
>              file://dump \
>              file://filesystems"
>
>


