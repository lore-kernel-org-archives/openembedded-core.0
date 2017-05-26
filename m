Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D557E60102
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 17:22:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wZCd91WR1z1qs0G;
	Fri, 26 May 2017 19:22:52 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wZCd802Jfz3hmNV;
	Fri, 26 May 2017 19:22:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ABAkbYd-Wfje; Fri, 26 May 2017 19:22:51 +0200 (CEST)
X-Auth-Info: ElDbRJBSaiKyK1uK7DkwL4gA94r/LDVcv68JvBAGYF8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 26 May 2017 19:22:51 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20170524204636.2797-1-marex@denx.de>
	<20170524210203.1042.10390@do.openembedded.org>
	<CAJTo0LYoxVfWEyp+gjOM_QEwUOXytiWjZmv=62QEekT+-H8W3A@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4925100e-3e5f-666e-3fec-35540f84af13@denx.de>
Date: Fri, 26 May 2017 19:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYoxVfWEyp+gjOM_QEwUOXytiWjZmv=62QEekT+-H8W3A@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHFlbXU6IEFkZCBuaW9zMiB0YXJnZXQ=?=
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
X-List-Received-Date: Fri, 26 May 2017 17:22:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05/25/2017 11:53 AM, Burton, Ross wrote:
> 
> On 24 May 2017 at 22:02, Patchwork <patchwork@patchwork.openembedded.org
> <mailto:patchwork@patchwork.openembedded.org>> wrote:
> 
>     * Issue             Series sent to the wrong mailing list or some
>     patches from the series correspond to different mailing lists
>     [test_target_mailing_list]
>       Suggested fix    Send the series again to the correct mailing list
>     (ML)
>       Suggested ML     poky@yoctoproject.org
>     <mailto:poky@yoctoproject.org>
>     [http://git.yoctoproject.org/cgit/cgit.cgi/poky/
>     <http://git.yoctoproject.org/cgit/cgit.cgi/poky/>]
>       Patch's path:    meta-poky/conf/distro/poky.conf
> 
> 
> Marek, please can you split this into patches for oe-core and meta-poky.

Aw snap, I didn't realize I brought a poky bit into the mix. Yes, I'll
split it once the qemu recipe update lands and I can build test things.

-- 
Best regards,
Marek Vasut

