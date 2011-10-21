Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RH66M-0005d8-Hz
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:48:58 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 20 Oct 2011 20:41:58 -0700
Received: by pzk4 with SMTP id 4so18581566pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:41:58 -0700 (PDT)
Received: by 10.68.32.161 with SMTP id k1mr2020422pbi.112.1319168518401;
	Thu, 20 Oct 2011 20:41:58 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id w4sm25695028pbf.6.2011.10.20.20.41.57
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 20:41:57 -0700 (PDT)
Message-ID: <4EA0EA04.2040009@intel.com>
Date: Thu, 20 Oct 2011 20:41:56 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 03:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 08:31 PM, Otavio Salvador wrote:
> To allow use and manipulation of users and groups at rootfs building
> time, the '/etc/passwd' and '/etc/group' needs to be available as soon
> as possible.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> index 137512d..9f81ba3 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Base system master password/group files."
>   DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
>   SECTION = "base"
> -PR = "r3"
> +PR = "r4"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>
> @@ -37,7 +37,7 @@ do_install () {
>   	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
>   }
>
> -pkg_postinst_${PN} () {
> +pkg_preinst_${PN} () {
>   	set -e
>
>   	if [ ! -e $D${sysconfdir}/passwd ] ; then


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


