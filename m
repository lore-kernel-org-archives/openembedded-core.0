Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C9D91731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 05:46:34 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8463E68A01C; Mon, 11 Apr 2016 06:46:33 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id CEE7A68A019;
	Mon, 11 Apr 2016 06:46:32 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 7A0D2674004E;
	Mon, 11 Apr 2016 07:46:32 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <570B3A38.9000000@mlbassoc.com>
Date: Mon, 11 Apr 2016 07:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: Issues installing GTK based packages
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
X-List-Received-Date: Mon, 11 Apr 2016 05:46:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

When installing epiphany into an existing system, I'm now
getting these errors:
   Configuring libgtk-3.0.
   ///var/lib/opkg/info/libgtk-3.0.postinst: line 3: glib-compile-schemas: not found
   Configuring gsettings-desktop-schemas.
   ///var/lib/opkg/info/gsettings-desktop-schemas.postinst: line 2: glib-compile-schemas: not found
   Configuring epiphany.
   ///var/lib/opkg/info/epiphany.postinst: line 2: glib-compile-schemas: not found

I believe this is because glib-compile-schemas was moved from
glib-2.0-utils to glib-2.0-dev by this change (Poky)

commit cc97d5760100415ed22fa329e8962e5f37b8d741
Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date:   Wed Mar 23 10:59:08 2016 +0200

     glib-2.0: Fix packaging

     * move gdbus-codegen to ${PN}-codegen
     * move other development tools and data files to ${PN}-dev
     * remove references to non-existent paths

     (From OE-Core rev: 351064e9c5deb6411c8a0d40ebd4fd4f83299d4e)

     Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Installing glib-2.0-dev just to get this tool doesn't seem reasonable as
it hauls in a boatload of other packages, including bash and friends, which
I don't want on my target.

Filed as bug #9431

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

