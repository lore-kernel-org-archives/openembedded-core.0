Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLOtn-0003tZ-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:41:47 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:35:39 -0700
Received: by faan26 with SMTP id n26so7394061faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:35:38 -0700 (PDT)
Received: by 10.223.76.27 with SMTP id a27mr4340644fak.12.1320194138049;
	Tue, 01 Nov 2011 17:35:38 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l18sm1991908fab.9.2011.11.01.17.35.36
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:35:37 -0700 (PDT)
Message-ID: <4EB09056.1050905@intel.com>
Date: Tue, 01 Nov 2011 17:35:34 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <201110310905.49436.paul.eggleton@linux.intel.com>
	<1320078403-23724-1-git-send-email-msm@freescale.com>
In-Reply-To: <1320078403-23724-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v3 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Wed, 02 Nov 2011 00:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2011 09:26 AM, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> v2: Change to use PACKAGES_prepend instead of explictly listing all packages
> and also fixing the fact we missed the -dev and -dbg packages before
>
> v3: Use += instead of _prepend to add strace-graph packages
>
>   meta/recipes-devtools/strace/strace_4.5.20.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
> index b3d2aa5..53df067 100644
> --- a/meta/recipes-devtools/strace/strace_4.5.20.bb
> +++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
> @@ -5,7 +5,9 @@ LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
>   PR = "r2"
>
> -RDEPENDS = "perl"
> +PACKAGES =+ "${PN}-graph "
> +FILES_${PN}-graph = "${bindir}/strace-graph"
> +RDEPENDS_${PN}-graph = "perl"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>              file://sigmask.patch \

Merged into OE-Core

Thanks
	Sau!



