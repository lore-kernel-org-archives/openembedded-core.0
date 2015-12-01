Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D5BB86011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:42:38 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3p973f5YxXz3hjJ1;
	Tue,  1 Dec 2015 16:42:38 +0100 (CET)
X-Auth-Info: /shOka2Muji6j3OaN4mPVZGn6GlzGgeIqkE6rVAp9sI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3p973f4X9nzvdWt; 
	Tue,  1 Dec 2015 16:42:38 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 16:42:37 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1448983859-6096-1-git-send-email-marex@denx.de>
	<CAJTo0LZR6VgXVi848c=RZVw=+u1GyetHWkwTXuwEyxTocsa2sA@mail.gmail.com>
In-Reply-To: <CAJTo0LZR6VgXVi848c=RZVw=+u1GyetHWkwTXuwEyxTocsa2sA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201512011642.38085.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Tue, 01 Dec 2015 15:42:39 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, December 01, 2015 at 04:39:47 PM, Burton, Ross wrote:
> Hi Marek,

Hi Ross,

> On 1 December 2015 at 15:30, Marek Vasut <marex@denx.de> wrote:
> > Upgrade the library version to recently released 0.8.0 .
> 
> Fails to build from a clean sysroot:
> | In file included from
> 
> /data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/0.8.0-r0/libbsd-0.8.
> 0/src/getentropy.c:28:0:
> 
> /data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/0.8.0-r0/libbsd-0.8.
> 0/src/getentropy_linux.c:50:25: fatal error: openssl/sha.h: No such file or
> directory

Looks like it depends on OpenSSL, so adding "DEPENDS = "openssl"" to the
recipe would be the solution, right ?

Best regards,
Marek Vasut

