Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 27D9565C8A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 11:32:08 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3B20668A01C; Sun,  9 Oct 2016 12:32:09 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E9BDC68A019;
	Sun,  9 Oct 2016 12:32:08 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A325C67402CE;
	Sun,  9 Oct 2016 13:32:08 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
References: <1d898f50-ceb1-ca9d-ec79-e9f043a88c8f@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <f6ceb0b6-2c3c-652c-174a-c5b6881b6dd3@mlbassoc.com>
Date: Sun, 9 Oct 2016 13:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1d898f50-ceb1-ca9d-ec79-e9f043a88c8f@mlbassoc.com>
Subject: Re: Serious build error
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
X-List-Received-Date: Sun, 09 Oct 2016 11:32:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-09 13:24, Gary Thomas wrote:
> Using Poky/Yocto rev 65107a9abe6c6c92c2c21e7dacfe4cc028ab7cb7 (2016-10-09), I get this
> during do_rootfs for my image:
>
> Collected errors:
>   * calculate_dependencies_for: Cannot satisfy the following dependencies for epiphany:
>   *      webkitgtk (>= 2.12.5) *
>   * opkg_solver_install: Cannot install package epiphany.
>
> I'm not sure how to interpret this as webkitgtk v2.12.5-r0 is in my build?
> I'm also not sure why the version pinning as the only reference I can find
> for this is in .../meta/recipes-gnome/epiphany/epiphany_3.20.3.bb:
>   DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
>
> I also didn't find any use of epiphany in any of the image recipes
> in the default Poky/Yocto.  Is this actually being tested on a regular
> basis?
>

n.b. I do use epiphany in my [image] recipe, I just didn't see
any use of it in any of the OE-core+Poky/Yocto recipes.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

