Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D51826C011
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:42:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2013 08:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1014,1367996400"; d="scan'208";a="396069955"
Received: from unknown (HELO [10.255.14.205]) ([10.255.14.205])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2013 08:42:17 -0700
Message-ID: <52260359.5090507@linux.intel.com>
Date: Tue, 03 Sep 2013 08:42:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: maxin.john@enea.com
References: <1378121770-55045-1-git-send-email-maxin.john@enea.com>
In-Reply-To: <1378121770-55045-1-git-send-email-maxin.john@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sqlite3: update to version 3.8.0.1
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
X-List-Received-Date: Tue, 03 Sep 2013 15:42:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2013 04:36 AM, maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>
> Upgrade to latest version 3.8.0.1
>

Is there something special about this update?

Otherwise I will hold this until after 1.5 since we are now in 
stabilization and do not do updates of packages at this time, especially 
something that is used by pseudo.

Thanks
	Sau!

> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>   meta/recipes-support/sqlite/sqlite3_3071700.bb |   10 ----------
>   meta/recipes-support/sqlite/sqlite3_3080001.bb |   10 ++++++++++
>   2 files changed, 10 insertions(+), 10 deletions(-)
>   delete mode 100644 meta/recipes-support/sqlite/sqlite3_3071700.bb
>   create mode 100644 meta/recipes-support/sqlite/sqlite3_3080001.bb
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3071700.bb b/meta/recipes-support/sqlite/sqlite3_3071700.bb
> deleted file mode 100644
> index 113e8ce..0000000
> --- a/meta/recipes-support/sqlite/sqlite3_3071700.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require sqlite3.inc
> -
> -LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
> -
> -SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "18c285053e9562b848209cb0ee16d4ab"
> -SRC_URI[sha256sum] = "8ff46d0baa9e64c0815544e829e985f1161c096aa6344c8f430791dbeadc2baf"
> -
> -S = "${WORKDIR}/sqlite-autoconf-${PV}"
> diff --git a/meta/recipes-support/sqlite/sqlite3_3080001.bb b/meta/recipes-support/sqlite/sqlite3_3080001.bb
> new file mode 100644
> index 0000000..692e56a
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3_3080001.bb
> @@ -0,0 +1,10 @@
> +require sqlite3.inc
> +
> +LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
> +
> +SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "ee32c96e5db6c6d651c7c9b71082cf7c"
> +SRC_URI[sha256sum] = "1d92ccfca5629701b207e57e86fdf0a01d8dca61c60e1246f92ec8d87408cf36"
> +
> +S = "${WORKDIR}/sqlite-autoconf-${PV}"
>

