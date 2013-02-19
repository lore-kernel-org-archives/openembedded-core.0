Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U7qzJ-0001a6-5i
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:28:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2013 09:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,696,1355126400"; d="scan'208";a="287741602"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2013 09:12:06 -0800
Message-ID: <5123B265.9050003@linux.intel.com>
Date: Tue, 19 Feb 2013 09:12:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
In-Reply-To: <cover.1361091390.git.cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Tue, 19 Feb 2013 17:28:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
> A couple of automake-1.13 related fixes and updates to newer upstream
> versions. Notably curl now has its official automake-1.13 support, so
> we get rid of our own hack.
>
> The following changes since commit 97aa5ac2df7593e343d82f5e64a422bb951eacf9:
>
>    dropbear: use pidfile for daemon start/stop/restart (2013-02-15 12:58:44 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib cazfi/misc
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc
>
> Marko Lindqvist (5):
>    webkit-gtk: replace obsolete automake macros with working ones
>    gtk-sato-engine: update to git repository head
>    oprofileui-server: replace obsolete automake macros with working ones
>    libffi: update to upstream version 3.0.12
Not sure what's going on but I saw a batch of failures with glib-2.0, 
take a look at the autobuilder failure:

http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio

  or

http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio

Not sure why, but glib-2.0 is not finding the libffi library, but it 
seems to exist in the sysroot.

Thanks
	Sau!

>    curl: update to upstream version 7.29.0
>
>   .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 --
>   .../libffi/aarch64-adding-build-support.patch      |   63 -
>   .../libffi/libffi/add-aarch64-support.patch        | 2672 --------------------
>   .../libffi/{libffi_3.0.11.bb => libffi_3.0.12.bb}  |    9 +-
>   .../obsolete_automake_macros.patch                 |   20 +
>   .../oprofile/oprofileui-server_git.bb              |    6 +-
>   .../gtk-engines/gtk-sato-engine_git.bb             |    4 +-
>   .../obsolete_automake_macros.patch                 |   14 +
>   meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    3 +-
>   .../dont_override_ac_config_macro_dir.patch        |   30 -
>   .../curl-7.28.1/obsolete_automake_macros.patch     |   14 -
>   meta/recipes-support/curl/curl/pkgconfig_fix.patch |   25 +-
>   .../curl/{curl_7.28.1.bb => curl_7.29.0.bb}        |    8 +-
>   13 files changed, 59 insertions(+), 2980 deletions(-)
>   delete mode 100644 meta/recipes-gnome/libffi/libffi/0001-libffi-update-for-3.0.11.patch
>   delete mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
>   delete mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch
>   rename meta/recipes-gnome/libffi/{libffi_3.0.11.bb => libffi_3.0.12.bb} (76%)
>   create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch
>   create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
>   delete mode 100644 meta/recipes-support/curl/curl-7.28.1/dont_override_ac_config_macro_dir.patch
>   delete mode 100644 meta/recipes-support/curl/curl-7.28.1/obsolete_automake_macros.patch
>   rename meta/recipes-support/curl/{curl_7.28.1.bb => curl_7.29.0.bb} (88%)
>


