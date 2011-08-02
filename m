Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoJCj-0000JE-Sf
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:56:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2011 10:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34353174"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2011 10:52:11 -0700
Message-ID: <4E38394A.2030205@linux.intel.com>
Date: Tue, 02 Aug 2011 10:52:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312030000-7961-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1312030000-7961-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] package_{deb, rpm, ipk}.bbclass: fix 'lingusa' typo
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
X-List-Received-Date: Tue, 02 Aug 2011 17:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2011 05:46 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/classes/package_deb.bbclass |    6 +++---
>   meta/classes/package_ipk.bbclass |    6 +++---
>   meta/classes/package_rpm.bbclass |    6 +++---
>   3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index fb502cb..8e363f8 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -116,7 +116,7 @@ package_install_internal_deb () {
>   	local archs="${INSTALL_ARCHS_DEB}"
>   	local package_to_install="${INSTALL_PACKAGES_NORMAL_DEB}"
>   	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_DEB}"
> -	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_DEB}"
> +	local package_linguas="${INSTALL_PACKAGES_LINGUAS_DEB}"
>   	local task="${INSTALL_TASK_DEB}"
>
>   	rm -f ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
> @@ -155,12 +155,12 @@ package_install_internal_deb () {
>
>   	# Uclibc builds don't provide this stuff..
>   	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
> -		if [ ! -z "${package_lingusa}" ]; then
> +		if [ ! -z "${package_linguas}" ]; then
>   			apt-get install glibc-localedata-i18n --force-yes --allow-unauthenticated
>   			if [ $? -ne 0 ]; then
>   				exit 1
>   			fi
> -			for i in ${package_lingusa}; do
> +			for i in ${package_linguas}; do
>   				apt-get install $i --force-yes --allow-unauthenticated
>   				if [ $? -ne 0 ]; then
>   					exit 1
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index b7afa83..16574e9 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -99,7 +99,7 @@ package_install_internal_ipk() {
>   	local conffile="${INSTALL_CONF_IPK}"
>   	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
>   	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
> -	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_IPK}"
> +	local package_linguas="${INSTALL_PACKAGES_LINGUAS_IPK}"
>   	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
>   	local task="${INSTALL_TASK_IPK}"
>
> @@ -111,8 +111,8 @@ package_install_internal_ipk() {
>
>   	# Uclibc builds don't provide this stuff...
>   	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
> -		if [ ! -z "${package_lingusa}" ]; then
> -			for i in ${package_lingusa}; do
> +		if [ ! -z "${package_linguas}" ]; then
> +			for i in ${package_linguas}; do
>   				opkg-cl ${ipkg_args} install $i
>   			done
>   		fi
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0377100..2cc0584 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -194,7 +194,7 @@ package_install_internal_rpm () {
>   	local confbase="${INSTALL_CONFBASE_RPM}"
>   	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
>   	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
> -	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_RPM}"
> +	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
>   	local providename="${INSTALL_PROVIDENAME_RPM}"
>   	local task="${INSTALL_TASK_RPM}"
>
> @@ -223,8 +223,8 @@ package_install_internal_rpm () {
>
>   	# Uclibc builds don't provide this stuff...
>   	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
> -		if [ ! -z "${package_lingusa}" ]; then
> -			for pkg in ${package_lingusa}; do
> +		if [ ! -z "${package_linguas}" ]; then
> +			for pkg in ${package_linguas}; do
>   				echo "Processing $pkg..."
>
>   				archvar=base_package_archs

Merged into OE-Core

Thanks
	Sau!



