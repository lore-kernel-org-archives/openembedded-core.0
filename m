Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxlJ-0004qy-4E
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:53:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 09:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171344423"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2012 09:41:44 -0700
Message-ID: <4FBFB648.1070403@linux.intel.com>
Date: Fri, 25 May 2012 09:41:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <6b907017a92c4178980b18fbe2fef47cbd2b1a34.1337519599.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <6b907017a92c4178980b18fbe2fef47cbd2b1a34.1337519599.git.mihaix.lindner@linux.intel.com>
Subject: Re: [1/1] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Fri, 25 May 2012 16:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 10:19 AM, Mihai Lindner wrote:
> Placed $D between braces ${D} to be correctly expanded to the
> workdir path, instead of a path relative to host rootfs.
> Currently, bitbake sudo fails on host systems where sudo is not
> installed.
>
> Signed-off-by: Mihai Lindner<mihaix.lindner@linux.intel.com>
>
> ---
> meta/recipes-extended/sudo/sudo_1.8.4p4.bb |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
> index 2315322..20c4a14 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
> @@ -1,6 +1,6 @@
>   require sudo.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
>              file://libtool.patch \
> @@ -24,6 +24,6 @@ do_install_append () {
>   		fi
>   	done
>
> -	chmod 4111 $D/usr/bin/sudo
> -	chmod 0440 $D/etc/sudoers
> +	chmod 4111 ${D}/usr/bin/sudo
> +	chmod 0440 ${D}/etc/sudoers
>   }
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Merged into OE-Core

Thanks
	Sau!


