Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGZa-0001e9-Ho
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:04:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2012 08:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227331549"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2012 08:51:29 -0700
Message-ID: <50647601.9020106@linux.intel.com>
Date: Thu, 27 Sep 2012 08:51:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Xin Ouyang <Xin.Ouyang@windriver.com>
References: <1348643353-32175-1-git-send-email-Xin.Ouyang@windriver.com>
In-Reply-To: <1348643353-32175-1-git-send-email-Xin.Ouyang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] at: atd remove useless --make-pidfile option.
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
X-List-Received-Date: Thu, 27 Sep 2012 16:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 12:09 AM, Xin Ouyang wrote:
> For start-stop-daemon, --make-pidfile is used when starting a
> program that does not create its own pid file.
> atd would create its own /var/run/atd.pid, so remove this option.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>   meta/recipes-extended/at/at_3.1.13.bb |    2 +-
>   meta/recipes-extended/at/files/S99at  |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
> index a391d6e..3580e09 100644
> --- a/meta/recipes-extended/at/at_3.1.13.bb
> +++ b/meta/recipes-extended/at/at_3.1.13.bb
> @@ -11,7 +11,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
>
>   RCONFLICTS_${PN} = "atd"
>   RREPLACES_${PN} = "atd"
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
>       file://configure.patch \
> diff --git a/meta/recipes-extended/at/files/S99at b/meta/recipes-extended/at/files/S99at
> index bcfcbda..386f8a4 100644
> --- a/meta/recipes-extended/at/files/S99at
> +++ b/meta/recipes-extended/at/files/S99at
> @@ -7,7 +7,7 @@ umask 077
>
>   start() {
>   	echo -n "Starting atd: "
> -	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
> +	start-stop-daemon --start --quiet --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
>   	echo "OK"
>   }
>   stop() {
>

Merged into OE-Core

Thanks
	Sau!



