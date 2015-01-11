Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C517165D3B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jan 2015 01:56:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0B1uihE005080
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 10 Jan 2015 17:56:44 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 10 Jan 2015 17:56:44 -0800
Message-ID: <54B1D85A.8080408@windriver.com>
Date: Sun, 11 Jan 2015 09:56:42 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1420781433.git.liezhi.yang@windriver.com>
	<65b1798d9384b162e2aba3dc77cfc7e98ce1519d.1420781433.git.liezhi.yang@windriver.com>
	<CAJTo0LbxRcAj-LEsaYGefk8AyF_MpwzNFznzvx3x07E7A9wyVA@mail.gmail.com>
In-Reply-To: <CAJTo0LbxRcAj-LEsaYGefk8AyF_MpwzNFznzvx3x07E7A9wyVA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gnu-efi: upgrade to 3.0.1
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
X-List-Received-Date: Sun, 11 Jan 2015 01:56:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/10/2015 01:20 AM, Burton, Ross wrote:
> Hi Robert,
>
> On 9 January 2015 at 05:33, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
>     <http://gnu-efi_3.0u.bb> b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
>     <http://gnu-efi_3.0.1.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb <http://gnu-efi_3.0u.bb>
>     rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb <http://gnu-efi_3.0.1.bb>
>
>
> You failed to update the SRC_URI and checksums.  :)

OOPS, sorry, 3.0.1 has a lot of changes, I'll remove the gnu-efi from the PULL,
and update it in another patch.

Update the PULL, remove gnu-efi:

   git://git.openembedded.org/openembedded-core-contrib rbt/binutils
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/binutils

Robert Yang (3):
   python-git: upgrade to 0.3.3
   python-gitdb: upgrade to 0.6.1
   binutils: upgrade to 2.25


// Robert

>
> Ross

