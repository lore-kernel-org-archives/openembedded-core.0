Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DC1396E9A4
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:19:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0TEHocR001621; Wed, 29 Jan 2014 14:19:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6ocI7ldICOPB; Wed, 29 Jan 2014 14:19:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0TEJROL001644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 14:19:29 GMT
Message-ID: <1391005162.24655.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Wed, 29 Jan 2014 14:19:22 +0000
In-Reply-To: <1391004721-15474-2-git-send-email-jason.wessel@windriver.com>
References: <1391004721-15474-1-git-send-email-jason.wessel@windriver.com>
	<1391004721-15474-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] unfs3: Fix dependencies and allow target builds
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
X-List-Received-Date: Wed, 29 Jan 2014 14:19:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 08:12 -0600, Jason Wessel wrote:
> Fixed in this patch:
>   * All patches marked as submitted to the upstream
>   * Remove the pseudo dependency because unfs3 can fully stand alone
>     or be used with pseudo and it does not link against pseudo
>   * Dependencies to flex for nativesdk and target builds are fixed
>     such that unfs3 can be deployed into an image
>   * Delete commented out unfs3 references in separatebuilddir.inc
>     because unfs3 works correctly with autotools.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/conf/distro/include/seperatebuilddir.inc      |    2 --
>  .../unfs3/unfs3/alternate_rpc_ports.patch          |    2 +-
>  .../unfs3/unfs3/fix_compile_warning.patch          |    2 +-
>  .../fix_pid_race_parent_writes_child_pid.patch     |    2 +-
>  .../unfs3/unfs3/fix_warnings.patch                 |    2 +-
>  .../unfs3/unfs3/relative_max_socket_path_len.patch |    2 +-
>  .../unfs3/unfs3/rename_fh_cache.patch              |    2 +-
>  .../unfs3/unfs3/tcp_no_delay.patch                 |    2 +-
>  .../unfs3/unfs3/unfs3_parallel_build.patch         |    2 +-
>  meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   17 ++---------------
>  10 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
> index 64e8f6d..a4869c5 100644
> --- a/meta/conf/distro/include/seperatebuilddir.inc
> +++ b/meta/conf/distro/include/seperatebuilddir.inc
> @@ -528,7 +528,6 @@ B_pn-nativesdk-renderproto = "${SEPB}"
>  B_pn-nativesdk-sqlite3 = "${SEPB}"
>  B_pn-nativesdk-systemtap = "${SEPB}"
>  # Not automake, no out of tree build support
> -#B_pn-nativesdk-unfs3 = "${SEPB}"
>  B_pn-nativesdk-util-macros = "${SEPB}"
>  B_pn-nativesdk-xcb-proto = "${SEPB}"
>  B_pn-nativesdk-xcmiscproto = "${SEPB}"
> @@ -676,7 +675,6 @@ B_pn-tremor = "${SEPB}"
>  B_pn-tslib = "${SEPB}"
>  B_pn-udev = "${SEPB}"
>  # Not automake, no out of tree build support
> -#B_pn-unfs3-native = "${SEPB}"
>  B_pn-usbutils = "${SEPB}"
>  B_pn-util-linux = "${SEPB}"
>  B_pn-util-linux-native = "${SEPB}"

If unfs is now autotools based, can we enable out of tree builds here?

Cheers,

Richard


