Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68E2465CED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 07:35:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAA7Zpnb016188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Nov 2014 23:35:51 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 9 Nov 2014 23:35:50 -0800
Message-ID: <54606AD5.1050905@windriver.com>
Date: Mon, 10 Nov 2014 15:35:49 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
	<54601CC7.1060000@windriver.com> <20141110064247.GB2440@jama>
In-Reply-To: <20141110064247.GB2440@jama>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Mon, 10 Nov 2014 07:35:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2014 02:42 PM, Martin Jansa wrote:
> The docs say that IMAGE_INSTALL is for "package_name". So I think it's
> correct that it fails when you put "recipe_name" in it and sometimes
> there isn't any package with the same name. It's the same as trying to
> make RDEPENDS/DEPENDS entries to be interchangeable (putting
> recipe_names to RDEPENDS and package_names to DEPENDS)."
>
> Especially with that patch for xinput-pointercal, if user explicitly
> asks for installing xinput-pointercal, what's the reason to create him
> completely empty package? IMHO it's only hiding that issue from him and
> instead of discovering the issue in do_rootfs task, he has to check
> generated rootfs or even boot the device.

For most recipes, they generate packages with recipe name, it is not
convenience to figure out the different between package_name and
recipe_name, especially for newbies, which I means we should reduce
that convenience, build relationship between recipe and package,
especially when the recipe doesn't generate the same name package.

As you said, for specific recipes, we don't want to generate packages,
it doesn't make sense to install it by setting IMAGE_INSTALL. But if the
recipe generate packages, it is reasonable to take one with recipe
name, take python3 for example, it choose python-core as the provider.

That's why I sent patch for avahi and oprofileui. The avahi didn't generate
package avahi, but it is reasonable to choose avahi-daemon, as the
SUMMARY said it is a IPv4 configuration daemon.

For oprofileui, it only generates package oprofileui-viewer, if we have
oprofileui as its nick name, I think it is more convenience for the users.

//Hongxu

