Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD1E56D558
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 18:33:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Nov 2013 10:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="411940727"
Received: from unknown (HELO [10.255.15.149]) ([10.255.15.149])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2013 10:33:33 -0800
Message-ID: <528D007D.50306@linux.intel.com>
Date: Wed, 20 Nov 2013 10:33:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	openembedded-core@lists.openembedded.org
References: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
	<1384965670-23435-2-git-send-email-paul@paulbarker.me.uk>
In-Reply-To: <1384965670-23435-2-git-send-email-paul@paulbarker.me.uk>
Subject: Re: [PATCH RFC 1/3] opkg: Update to version 0.2.0
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
X-List-Received-Date: Wed, 20 Nov 2013 18:33:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2013 08:41 AM, Paul Barker wrote:
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>   meta/recipes-devtools/opkg/opkg_0.2.0.bb | 14 ++++++++++++++
>   meta/recipes-devtools/opkg/opkg_svn.bb   | 14 --------------
>   2 files changed, 14 insertions(+), 14 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg_0.2.0.bb
>   delete mode 100644 meta/recipes-devtools/opkg/opkg_svn.bb
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.2.0.bb b/meta/recipes-devtools/opkg/opkg_0.2.0.bb
> new file mode 100644
> index 0000000..7affbff
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg_0.2.0.bb
> @@ -0,0 +1,14 @@
> +require opkg.inc
> +
> +SRC_URI = "https://opkg.googlecode.com/files/${BPN}-${PV}.tar.gz \
> +           file://no-install-recommends.patch \
> +           file://add-exclude.patch \
> +           file://opkg-configure.service \
> +"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +SRC_URI[md5sum] = "e8a6fd34fb2529191fe09dc14c934cc3"
> +SRC_URI[sha256sum] = "81b7055eb4c12c5e5652339305c9236cf357890717d4bea063963f3f434d966f"
> +
> +PR = "${INC_PR}.0"

Since we are creating new version, we can completely drop the PR here 
and the INC_PR in the opkg.inc.

Sau!

> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> deleted file mode 100644
> index cd0485f..0000000
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require opkg.inc
> -
> -SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
> -           file://no-install-recommends.patch \
> -           file://add-exclude.patch \
> -           file://opkg-configure.service \
> -"
> -
> -S = "${WORKDIR}/trunk"
> -
> -SRCREV = "653"
> -PV = "0.1.8+svnr${SRCPV}"
> -
> -PR = "${INC_PR}.0"
>

