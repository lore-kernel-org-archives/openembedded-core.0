Return-Path: <marex@denx.de>
X-Greylist: delayed 459 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Jan 2020 00:38:05 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BEC5C7FD83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 00:38:05 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47v3mM483Dz1rVvq;
	Fri, 10 Jan 2020 01:30:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47v3mM3vbPz1qr28;
	Fri, 10 Jan 2020 01:30:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id jgfzt6FZCRVT; Fri, 10 Jan 2020 01:30:26 +0100 (CET)
X-Auth-Info: BwV3zIOYk1T6qNQH2wXWlbmozXJprwm8p+lGU6eYQ1M=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 10 Jan 2020 01:30:26 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200109183753.2696071-1-raj.khem@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cdaba820-fb70-435d-8384-863bbbf4c009@denx.de>
Date: Fri, 10 Jan 2020 01:30:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109183753.2696071-1-raj.khem@gmail.com>
Subject: Re: [PATCH] weston-init: Let weston run without pam on distros without pam
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
X-List-Received-Date: Fri, 10 Jan 2020 00:38:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/9/20 7:37 PM, Khem Raj wrote:
> When pam is not part of distro, user specific XDG_* environment
> variables are not available since PAMName=login is in-effective and as a
> result weston can not start because it direly needs XDG_RUNTIME_DIR
> defined, therefore launching weston directly in systemd service will not
> work, therefore call the helper script weston-start, which is also used
> with sysvinit
> 
> extend enabling fbdev backend fallback to all qemu machines

Looks good to me, thanks !

