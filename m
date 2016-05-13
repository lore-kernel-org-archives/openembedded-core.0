Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4026FFD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 12:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DClKnJ008857; Fri, 13 May 2016 13:47:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SfFJNjZ0gUP9; Fri, 13 May 2016 13:47:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DClGKf008853
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 May 2016 13:47:17 +0100
Message-ID: <1463143636.9746.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 13:47:16 +0100
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [PATCH 00/42] GCC/GDB/Binutils Upgrades
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
X-List-Received-Date: Fri, 13 May 2016 12:47:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-11 at 10:35 -0700, Khem Raj wrote:
> This patchset covers gcc 6 upgrade along with gdb 7.11
> and glibc 2.24 ( upcoming ) release.
> 
> Rest of upgrades are necessaciated by gcc-6 due to backports
> that were already in newer versions of packages
> 
> It has been boot tested with core-image-minimal on all qemu
> machines
> 
> The following changes since commit
> a5970809a2f01dbd152684266e2a3d946d896620:
> 
>   oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes
> (2016-05-11 10:33:16 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-6
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log
> /?h=kraj/gcc-6

I went through and included a subset of this into -next, with a view to
getting the basic pieces out the way. There were a number of pieces I
didn't get in the first pass, either due to v2's which I couldn't
easily update to, a failure on the autobuilder, or that the change was
significant and I wanted to get the "easy" bulk of the patches out the
way before for example the gcc version switch.

If you could therefore rebase against master, fix the systemd issue and
resend what is left that would be extremely helpful, thanks!

Cheers,

Richard

