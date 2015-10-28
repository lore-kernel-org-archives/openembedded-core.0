Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B47875D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 02:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S2BdKG017180
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Oct 2015 19:11:39 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 19:11:39 -0700
Message-ID: <56302ED9.6010307@windriver.com>
Date: Wed, 28 Oct 2015 10:11:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1445954460.git.liezhi.yang@windriver.com>
	<6aacdcc20175b509fa9adca8a7bfa861e443ee09.1445954460.git.liezhi.yang@windriver.com>
	<CAJTo0La8YZQafC-8SKdBt_4K5N8TsHU6bq3oeykJ6-j6pc6isw@mail.gmail.com>
In-Reply-To: <CAJTo0La8YZQafC-8SKdBt_4K5N8TsHU6bq3oeykJ6-j6pc6isw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-smartpm-native: prefer same arch when install
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
X-List-Received-Date: Wed, 28 Oct 2015 02:11:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/2015 02:45 AM, Burton, Ross wrote:
>
> On 27 October 2015 at 14:05, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     We had made smart install multilib RDEPENDS correctly from
>     package_manager.py, but it couldn't handle RRECOMMANDS, this patch fix
>     the issue from python-smartpm-native, and make it work well.
>
>     The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use
>     pkg_A's arch when possible.
>
>
> I added this patch and rebuilt core-image-sato, then ran buildhistory-diff:
>
> Changes to images/intel_corei7_64/glibc/core-image-sato
> (installed-package-names.txt):
>    lib32-ncurses-terminfo-base was added
>    lib32-libjpeg9 was added
>    lib32-glibc-gconv-iso8859-1 was added
>    lib32-shared-mime-info was added
>    lib32-libxml2 was added
>    lib32-wpa-supplicant-cli was added
>    lib32-libgdk-pixbuf-2.0-loader-png was added
>    lib32-wpa-supplicant-passphrase was added
>    lib32-pango-module-basic-fc was added
>    lib32-bash was added
>    lib32-libgdk-pixbuf-2.0-loader-jpeg was added
>    lib32-libgdk-pixbuf-2.0-loader-gif was added
>    lib32-libgdk-pixbuf-2.0-loader-xpm was added
>    lib32-glibc-gconv was added
>
> Some of those are good (gdk-pixbuf and pango), some bad (bash,
> wpa-supplicant-cli), some probably bugs in packages that should be allarch
> (termino, shared-mime-info).

I think that lacking something so that it doesn't work is worse than have more
things but works ?

// Robert

>
> I'm undecided what we do about this.  Fixing the dependency chains is good, but
> we're definitely pulling in more than expected.
>
> Ross

