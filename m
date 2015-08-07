Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79A88763CE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:25:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t779PAuo028989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Aug 2015 02:25:10 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 7 Aug 2015 02:25:10 -0700
Message-ID: <55C47974.9030201@windriver.com>
Date: Fri, 7 Aug 2015 17:25:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<0321088b6ef57a419568c584ef1cc791bb40218b.1438619216.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <0321088b6ef57a419568c584ef1cc791bb40218b.1438619216.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 2/7] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Fri, 07 Aug 2015 09:25:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander,

I think that one or more autobuilder failures related to this patch:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/430/steps/BuildImages/logs/stdio

// Robert

On 08/04/2015 12:29 AM, Alexander Kanavin wrote:
> Google Code is shutting down soon and distcc has moved to github.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-devtools/distcc/distcc_3.1.bb | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
> index e4b9313..8ea3cac 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
> @@ -17,16 +17,14 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
>
>   RRECOMMENDS_${PN} = "avahi-daemon"
>
> -SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
> +SRC_URI = "git://github.com/distcc/distcc.git \
>              file://separatebuilddir.patch \
>              file://0001-zeroconf-Include-fcntl.h.patch \
>              file://default \
>              file://distccmon-gnome.desktop \
>              file://distcc \
>              file://distcc.service"
> -
> -SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
> -SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
> +SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
>
>   inherit autotools pkgconfig update-rc.d useradd systemd
>
>

