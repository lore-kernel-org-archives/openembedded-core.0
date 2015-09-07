Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27F4860017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 19:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87JR5WP006458; Mon, 7 Sep 2015 20:27:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LnmQqkoMql3X; Mon,  7 Sep 2015 20:27:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87JQrqc006448
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 7 Sep 2015 20:27:04 +0100
Message-ID: <1441654013.24871.259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 07 Sep 2015 20:26:53 +0100
In-Reply-To: <cover.1441552859.git.raj.khem@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 19:27:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
> Changes Since last time
> - Now that 225 is out upgrade recipe to 225, changes between 224 and 225 are minor
>   but fixes in networkd are important
> - Implement systemd-sysv-install for OE
> - Enable getopt in busybox needed for systemd-sysv-install
> - Remove update-rc.d from default uninstall list in rootfs creation
> - Tested date and systemd unit tests manually to pass
> - Booted core-image-cmdline-full on all qemu targets

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/480

The date test failed in two of the sanity runs with this series
applied :(

Cheers,

Richard


