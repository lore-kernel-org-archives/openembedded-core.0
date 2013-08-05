Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5961223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:09:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Aug 2013 10:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="376469344"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2013 10:09:58 -0700
Message-ID: <51FFDC66.1000808@linux.intel.com>
Date: Mon, 05 Aug 2013 10:09:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristiana Voicu <cristiana.voicu@intel.com>
References: <cover.1375441054.git.cristiana.voicu@intel.com>
	<002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
In-Reply-To: <002befd249411cf19e27d77a58d7be18e2690807.1375441054.git.cristiana.voicu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] tzdata: upgrade to 2013d
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
X-List-Received-Date: Mon, 05 Aug 2013 17:09:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2013 01:28 AM, Cristiana Voicu wrote:
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>   .../recipes-extended/tzcode/tzcode-native_2013d.bb |    4 ++--
>   .../tzdata/{tzdata_2013b.bb => tzdata_2013d.bb}    |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-extended/tzdata/{tzdata_2013b.bb => tzdata_2013d.bb} (98%)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
> index 52aa9c2..8dea55e 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d2
>   SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
>              ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"
>
> -SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
> -SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
> +SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
> +SRC_URI[tzdata.sha256sum] = "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
>
>   SRC_URI[tzcode.md5sum] = "4616a9560270f180eeb9a08540636890"
>   SRC_URI[tzcode.sha256sum] = "2d9eb90c94644cddb74a490d1184ef9f88efcaa7a2b1bf88be0ee9eeeab707b6"

While the PRS does not seem to report the update, tzcode usually updates 
at the same time (as it has in this case to 20123d), please do both at 
the same time.

Thanks
	Sau!


> diff --git a/meta/recipes-extended/tzdata/tzdata_2013b.bb b/meta/recipes-extended/tzdata/tzdata_2013d.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2013b.bb
> rename to meta/recipes-extended/tzdata/tzdata_2013d.bb
> index 0b34e85..c0f1506 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2013b.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2013d.bb
> @@ -14,8 +14,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
>
>   SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
>
> -SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
> -SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
> +SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
> +SRC_URI[tzdata.sha256sum] = "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
>
>   S = "${WORKDIR}"
>
>

