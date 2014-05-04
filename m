Return-Path: <joelf@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id D9B3E605F4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 20:53:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s44KrClh007681
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 15:53:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s44KrC9B028037
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 15:53:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 15:53:12 -0500
Received: from [10.247.29.57] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s44KrCxW006084	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 15:53:12 -0500
Message-ID: <5366A8B5.6020900@ti.com>
Date: Sun, 4 May 2014 15:53:09 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Quick question about OE-core/bitbake's re-building
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
X-List-Received-Date: Sun, 04 May 2014 20:53:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

How does it figure out when it needs to rebuild a package?

For example if I modify the file:
 ../meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service

Does it track the modification time to know it needs to rebuild
"systemd-serialgetty"?

Because doing such a modification didn't cause it to rebuild.

Even if I modify the recipe by simply opening it and writing to it, it
doesn't do any rebuild of the recipe. How is it normally supposed to work?

I have PRSERV turned on, I'm hoping that any modification to the recipe
itself or the files it installs should be enough to rebuild. So far, the
rebuild doesn't always happen.

thanks,
-Joel

