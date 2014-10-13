Return-Path: <openembedded-devel@urbanec.net>
Received: from mail12.tpgi.com.au (mail12.tpgi.com.au [203.12.160.162])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7F36A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 05:23:17 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 13 Oct 2014 16:23:16 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9D5NEma019224; 
	Mon, 13 Oct 2014 16:23:16 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XdY6C-00082w-D9; Mon, 13 Oct 2014 16:23:12 +1100
Message-ID: <543B61C0.6050500@urbanec.net>
Date: Mon, 13 Oct 2014 16:23:12 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
References: <54380D3A.8060904@urbanec.net>
	<CANyK_8cZMz-JBdWku-yTgA1+RXbt0wGxww+eCf2CBMeb4cFXdA@mail.gmail.com>
	<CANyK_8cZGNxd0=FKA1NK1Y69RaHT4bVry_FjixuQCMW1zPpsLA@mail.gmail.com>
In-Reply-To: <CANyK_8cZGNxd0=FKA1NK1Y69RaHT4bVry_FjixuQCMW1zPpsLA@mail.gmail.com>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Mon, 13 Oct 2014 05:23:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/14 06:17, Paul Barker wrote:
> opkg_remove_pkg is never called with from_upgrade set to a non-zero
> value. The removal of an old package during an upgrade is handled by
> directly calling remove_data_files_and_list and
> remove_maintainer_scripts from opkg_install_pkg. The desired behaviour
> is given in the comments in prerm_upgrade_old_pkg in opkg_install.c,
> the behaviour given by the comment in that function just needs
> implementing.

Indeed, I got fooled by looking at the call to opkg_install_pkg(pkg, 1)

> This is already entered as issue 104 in the opkg issue tracker:
> https://code.google.com/p/opkg/issues/detail?id=104

So it is. Slightly more work than my trivial opkg patch, but then again, 
my trivial opkg patch is not much use ;-) Please disregard it.

> Have you tested this patch before submitting it?

To be honest, I have not tested the opkg "upgrade" patch in isolation. I 
have tested the opkg patch for multiple package upgrade case together 
with my changes to update-rc.d.bbclass changes (i.e. the entire patch I 
posted to the oe-core list) and this has solved the problems that I 
encountered initially. The "fix" for my use case is due to the changes 
in the way the prerm, postrm and postinst scripts work, but reviewing 
those changes, that's not good enough either.

Thanks for the review.

I'll try again later...

Peter

