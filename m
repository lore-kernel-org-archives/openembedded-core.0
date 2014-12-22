Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD019727E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 13:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMD7lVk007166; Mon, 22 Dec 2014 13:07:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a5ydznFdG6jn; Mon, 22 Dec 2014 13:07:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMD7YFP007162
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 13:07:46 GMT
Message-ID: <1419253691.13316.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 22 Dec 2014 13:08:11 +0000
In-Reply-To: <c0e692b5ec1f49ecaf89b0ecf58c7f927dbe9aab.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
	<c0e692b5ec1f49ecaf89b0ecf58c7f927dbe9aab.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] logrotate: upgrade to 3.8.8
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
X-List-Received-Date: Mon, 22 Dec 2014 13:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-12-21 at 21:28 -0800, Robert Yang wrote:
> * Upgrade to 3.8.8.
> * Remove disable-check-different-filesystems.patch which had been merged
>   by upstream.

Are you sure? Autobuilder shows:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/136/steps/Running%20Sanity%20Tests/logs/stdio

Cheers,

Richard


> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../disable-check-different-filesystems.patch      |   34 --------------------
>  .../{logrotate_3.8.7.bb => logrotate_3.8.8.bb}     |    5 ++-
>  2 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
>  rename meta/recipes-extended/logrotate/{logrotate_3.8.7.bb => logrotate_3.8.8.bb} (89%)
> 
> diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
> deleted file mode 100644
> index 43068bd..0000000
> --- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Disable the check for different filesystems
> -
> -The logrotate supports rotate log across different filesystems now, so
> -disable the check for different filesystems.
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - config.c |    8 --------
> - 1 files changed, 0 insertions(+), 8 deletions(-)
> -
> -diff --git a/config.c b/config.c
> -index a85d1df..24575b3 100644
> ---- a/config.c
> -+++ b/config.c
> -@@ -1453,14 +1453,6 @@ static int readConfigFile(const char *configFile, struct logInfo *defConfig)
> - 						dirName, strerror(errno));
> - 					goto error;
> - 					}
> --
> --					if (sb.st_dev != sb2.st_dev) {
> --					message(MESS_ERROR,
> --						"%s:%d olddir %s and log file %s "
> --						"are on different devices\n", configFile,
> --						lineNum, newlog->oldDir, newlog->files[i]);
> --					goto error;
> --					}
> - 				}
> - 				}
> - 
> --- 
> -1.7.4.1
> -
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
> similarity index 89%
> rename from meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> rename to meta/recipes-extended/logrotate/logrotate_3.8.8.bb
> index faa8e02..8d32938 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
> @@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>  
>  SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
>             file://act-as-mv-when-rotate.patch \
> -           file://disable-check-different-filesystems.patch \
>             file://update-the-manual.patch \
>              "
>  
> -SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
> -SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
> +SRC_URI[md5sum] = "49846e873dddea15964cd0355b9943ca"
> +SRC_URI[sha256sum] = "46a1510ef4a1f4359edd5f361112cfd1523942e85ff28e6cbb0c81bad1829d0f"
>  
>  PACKAGECONFIG ?= "\
>      ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> -- 
> 1.7.9.5
> 



