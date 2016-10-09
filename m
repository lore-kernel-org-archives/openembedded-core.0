Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 2214360234
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 11:24:37 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 01BDD68A01C; Sun,  9 Oct 2016 12:24:37 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9699368A019;
	Sun,  9 Oct 2016 12:24:37 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 50CAB67402CE;
	Sun,  9 Oct 2016 13:24:37 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <1d898f50-ceb1-ca9d-ec79-e9f043a88c8f@mlbassoc.com>
Date: Sun, 9 Oct 2016 13:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: Serious build error
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
X-List-Received-Date: Sun, 09 Oct 2016 11:24:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Using Poky/Yocto rev 65107a9abe6c6c92c2c21e7dacfe4cc028ab7cb7 (2016-10-09), I get this
during do_rootfs for my image:

Collected errors:
   * calculate_dependencies_for: Cannot satisfy the following dependencies for epiphany:
   *      webkitgtk (>= 2.12.5) *
   * opkg_solver_install: Cannot install package epiphany.

I'm not sure how to interpret this as webkitgtk v2.12.5-r0 is in my build?
I'm also not sure why the version pinning as the only reference I can find
for this is in .../meta/recipes-gnome/epiphany/epiphany_3.20.3.bb:
   DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \

I also didn't find any use of epiphany in any of the image recipes
in the default Poky/Yocto.  Is this actually being tested on a regular
basis?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

