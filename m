Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 218A17653B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Nov 2015 02:51:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA12puAJ000329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Oct 2015 19:51:56 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 31 Oct 2015 19:51:56 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1446345922-19621-1-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56357E45.80103@windriver.com>
Date: Sat, 31 Oct 2015 22:51:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446345922-19621-1-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-oe][PATCH] mariadb: update to 5.5.46
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
X-List-Received-Date: Sun, 01 Nov 2015 02:51:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Oops, wrong list.

../Randy


On 2015-10-31 10:45 PM, Randy MacLeod wrote:
> This is the latest release in the 5.5.x stable series.
> It fixes 11 CVEs as listed:
>     https://mariadb.com/kb/en/mariadb/mariadb-5546-release-notes/
> and fixes 10s of internal MariaDB tracked defects.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../mysql/{mariadb-native_5.5.45.bb => mariadb-native_5.5.46.bb}      | 0
>   meta-oe/recipes-support/mysql/mariadb.inc                             | 4 ++--
>   .../recipes-support/mysql/{mariadb_5.5.45.bb => mariadb_5.5.46.bb}    | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.45.bb => mariadb-native_5.5.46.bb} (100%)
>   rename meta-oe/recipes-support/mysql/{mariadb_5.5.45.bb => mariadb_5.5.46.bb} (100%)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> similarity index 100%
> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index 47a16a1..42a4eda 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -14,8 +14,8 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
>              file://fix-a-building-failure.patch \
>             "
>
> -SRC_URI[md5sum] = "6ec397f717f6e2e4e9154e76de9ec9fc"
> -SRC_URI[sha256sum] = "4dc3aff6941ef1068412002915d795bcf67db0eaa38a5c6f3af57474c4226fb0"
> +SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
> +SRC_URI[sha256sum] = "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
>
>   S = "${WORKDIR}/mariadb-${PV}"
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.45.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
> similarity index 100%
> rename from meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
> rename to meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

