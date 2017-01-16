Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D23E71BA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:18:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0GEIiRl003944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jan 2017 06:18:44 -0800 (PST)
Received: from server.local (128.224.21.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 Jan 2017 06:18:44 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
	<1484574253-30817-2-git-send-email-ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4b6374eb-ed31-605b-fb96-0987f575adb6@windriver.com>
Date: Mon, 16 Jan 2017 09:18:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484574253-30817-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/2] perf: add PACKAGECONFIG for systemtap
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-16 8:44 AM, Ross Burton wrote:
> Otherwise it's possible to race with systemtap headers being present during the autodetection and disappearing during the build:
>
> tests/sdt.c:14:21: fatal error: sys/sdt.h: No such file or directory
>  #include <sys/sdt.h>
>                      ^
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

A deja-vu signed-off-by!

Bruce

> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 8b5028e..acbb1d9 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -20,6 +20,7 @@ PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
>  PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
>  PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
>  PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
> +PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
>
>  DEPENDS = " \
>      virtual/${MLPREFIX}libc \
>


