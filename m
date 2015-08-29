Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9751760FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 12:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7TCaxAI030495; Sat, 29 Aug 2015 13:36:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ae2Ywc2cPIEG; Sat, 29 Aug 2015 13:36:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7TCajHL030450
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Aug 2015 13:36:56 +0100
Message-ID: <1440851805.32588.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Aug 2015 13:36:45 +0100
In-Reply-To: <CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Sat, 29 Aug 2015 12:37:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 21:39 +0100, Burton, Ross wrote:
> 
> On 26 August 2015 at 16:48, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>         The main idea is to keep only what is strictly needed for
>         make_ext4fs tool.
>         
> 
> Assuming that make_ext4fs is a tool to create an ext4 file system,
> what's the difference between that and our mke2fs which is used to
> create ext4 file systems?
> 
We've worked quite hard to land the ext4 rootfs creation code into
upstream e2fsprogs. I'd like to understand if we're missing anything for
that to work with fastboot. If we are, I suspect it wouldn't be hard to
add and should save maintenance of a separate tool (support in e2fsprogs
means we get any other ext* improvements for free).

Cheers,

Richard




