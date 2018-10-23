Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C13D794EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:49:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9NLmxR2013132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 23 Oct 2018 22:49:01 +0100
Message-ID: <ae8c420e68e7027797576f48f414cbd3bdbaa5a5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 22:48:59 +0100
In-Reply-To: <a2bd44ad10ae076b40b11a1a2c8d0007817b17af.1540191752.git.Qi.Chen@windriver.com>
References: <cover.1540191752.git.Qi.Chen@windriver.com>
	<a2bd44ad10ae076b40b11a1a2c8d0007817b17af.1540191752.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Tue, 23 Oct 2018 21:49:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 15:03 +0800, Chen Qi wrote:
> Add back alternatives for init utilities to avoid regression.
> 
> These alternatives were removed when upgradeing systemd to 239.
> They were removed out of the logic that init utitilies should be
> bound to init manager. However, it turned out that two use cases
> were not covered.
> 
> 1) initramfs using commands like 'reboot' from busybox.
> 2) Users use customized busybox defconfig which enables init
> utilities.
> 
> The first use case caused a regression bug in yocto.
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914
> Patches were sent to fix the reboot problem.
> 
> But this is not enough. As we may have the second use case. In such
> situation, users will find themselves having regression error when
> using 'busybox + systemd' (and busybox is installed after systemd,
> overriding the systemd symlinks).
> 
> So in order to avoid regression, add back these alternatives.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Sorry but this is still failing:


https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/107/steps/7/logs/step7c

Cheers,

Richard


