Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8DdB-0007uR-P2
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:34:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 09:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129391190"
Received: from unknown (HELO [10.255.15.152]) ([10.255.15.152])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 09:25:37 -0700
Message-ID: <4F621801.6010308@linux.intel.com>
Date: Thu, 15 Mar 2012 09:25:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331736953-19464-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1331736953-19464-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] python: regenerate python-2.7-manifest.inc
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
X-List-Received-Date: Thu, 15 Mar 2012 16:34:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 07:55 AM, Martin Jansa wrote:
> * only manual change is extra line break in FILES_${PN}-core, because
>    git send-email doesn't like long lines
>    fatal: /tmp/0wfyzTvlIf/0001-python-regenerate-python-2.7-manifest.inc.patch: 30: patch contains a line longer than 998 characters
>
> * fixes PROVIDES and it will be easier to review next patch without this
>    extra changes
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../python/python-2.7-manifest.inc                 |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
> index 5f8b7cf..3193565 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -5,7 +5,7 @@
>
>
>
> -PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
> +PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
>
>   PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
>
> @@ -80,7 +80,7 @@ FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils
>
>   DESCRIPTION_${PN}-distutils-staticdev="Python Distribution Utilities (Static Libraries)"
>   RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
> -FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a"
> +FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a "
>
>   DESCRIPTION_${PN}-doctest="Python framework for running examples in docstrings."
>   RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"


Merged into OE-Core

Thanks
	Sau!


