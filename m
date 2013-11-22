Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3015D6CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:31:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAMAVACp000413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:31:10 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 22 Nov 2013 02:31:09 -0800
Message-ID: <528F326C.8090808@windriver.com>
Date: Fri, 22 Nov 2013 18:31:08 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1385113330.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1385113330.git.jackie.huang@windriver.com>
Cc: phcoder@gmail.com, dvhart@linux.intel.com
Subject: Re: [PATCH 0/2 v5] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 10:31:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I changed the Upstream-Status of the patch to backport according to 
Vladimir's comment, but I'm not going to send a v6, just update the pull 
request here:

--
The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:

   librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)

are available in the git repository at:

   git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_v5_1122_3
 
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_v5_1122_3

Jackie Huang (2):
   grub-efi: change to generate EFI image in target package
   grub-efi: allow compilation without large model support

  meta/classes/grub-efi.bbclass                      |   4 +-
  ...allow-a-compilation-without-mcmodel-large.patch | 131 
+++++++++++++++++++++
  .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  |  44 ++++---
  3 files changed, 158 insertions(+), 21 deletions(-)
  create mode 100644 
meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
  rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => 
grub-efi_2.00.bb} (77%)

Thanks,
Jackie

On 11/22/2013 6:00 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> v5 comments:
> Replace the patch "allow a compilation without mcmodel=large" with the one
> provided by Vladimir Serbinenko <phcoder@gmail.com>.
>
> --
> The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:
>
>    librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_v5_1122_1
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_v5_1122_1
>
> Jackie Huang (2):
>    grub-efi: change to generate EFI image in target package
>    grub-efi: allow compilation without large model support
>
>   meta/classes/grub-efi.bbclass                      |   4 +-
>   ...allow-a-compilation-without-mcmodel-large.patch | 141 +++++++++++++++++++++
>   .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  |  44 ++++---
>   3 files changed, 168 insertions(+), 21 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>   rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

