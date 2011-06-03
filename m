Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSIBh-00083B-Rj
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:24:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 17:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; 
   d="scan'208";a="8698681"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2011 17:21:14 -0700
Message-ID: <4DE828FB.6030903@linux.intel.com>
Date: Thu, 02 Jun 2011 17:21:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] shadow: remove selinux entry from pam.d/login
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
X-List-Received-Date: Fri, 03 Jun 2011 00:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 11:33 AM, Koen Kooi wrote:
> SElinux has been disabled in the recipe, leading to messages like this:
>
> [  167.643218] login[312]: PAM unable to dlopen(/lib/security/pam_selinux.so): /lib/security/pam_selinux.so: cannot open shared object file: No such file or directory
> [  167.670837] login[312]: PAM adding faulty module: /lib/security/pam_selinux.so
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/shadow/files/pam.d/login |    7 -------
>   meta/recipes-extended/shadow/shadow.inc        |    2 ++
>   2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/shadow/files/pam.d/login b/meta/recipes-extended/shadow/files/pam.d/login
> index e41eb04..e4dacc2 100644
> --- a/meta/recipes-extended/shadow/files/pam.d/login
> +++ b/meta/recipes-extended/shadow/files/pam.d/login
> @@ -26,13 +26,6 @@ auth       [success=ok ignore=ignore user_unknown=ignore default=die]  pam_secur
>   # (Replaces the `NOLOGINS_FILE' option from login.defs)
>   auth       requisite  pam_nologin.so
>
> -# SELinux needs to be the first session rule. This ensures that any
> -# lingering context has been cleared. Without out this it is possible
> -# that a module could execute code in the wrong domain.
> -# When the module is present, "required" would be sufficient (When SELinux
> -# is disabled, this returns success.)
> -session [success=ok ignore=ignore module_unknown=ignore default=bad] pam_selinux.so close
> -
>   # This module parses environment configuration file(s)
>   # and also allows you to use an extended config
>   # file /etc/security/pam_env.conf.
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 42f92a7..35bd6a8 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -6,6 +6,8 @@ LICENSE = "BSD | Artistic"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
>                       file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
>
> +PR = "r1"
> +
>   PAM_PLUGINS = "  libpam-runtime \
>                    pam-plugin-faildelay \
>                    pam-plugin-securetty \
Merged into oe-core

Thanks
	Sau!


