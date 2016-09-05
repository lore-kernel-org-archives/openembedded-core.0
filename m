Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6530C77261
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 09:13:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u859DKZb003601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 02:13:23 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 02:13:20 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1473064099.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d5d4b909-aa2e-ebd7-676b-e5746719dc66@windriver.com>
Date: Mon, 5 Sep 2016 17:13:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1473064099.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] meta: fix gobject-introspection-native and coreutils-native
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
X-List-Received-Date: Mon, 05 Sep 2016 09:13:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please use the patch on oe-core-contrib:

   git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
   coreutils: enable xattr for native
   gobject-introspection: set GI_SCANNER_DISABLE_CACHE for native


On 09/05/2016 04:29 PM, Robert Yang wrote:
> The following changes since commit 0a024bf2f2ed14be9b6e3e8e911e826969ff9b7e:
>
>   poky: Update to linux-yocto 4.8 (2016-09-04 16:58:53 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib rbt/2fixes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/2fixes

This was poky-contrib.

// Robert

>
> Robert Yang (2):
>   coreutils: enable xattr for native
>   gobject-introspection: set GI_SCANNER_DISABLE_CACHE for native
>
>  meta/recipes-core/coreutils/coreutils_8.25.bb                          | 3 ++-
>  .../gobject-introspection/gobject-introspection_1.48.0.bb              | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>

