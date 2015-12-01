Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4BD6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:01:13 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3p97T5360Dz3hjNK;
	Tue,  1 Dec 2015 17:01:13 +0100 (CET)
X-Auth-Info: lEZjfhFXkpQFaO1544+ouTSwigGeg3LGoa+Xc+6Mkzo=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3p97T5252vzvdWt; 
	Tue,  1 Dec 2015 17:01:13 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 17:01:12 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1448983859-6096-1-git-send-email-marex@denx.de>
	<201512011642.38085.marex@denx.de>
	<CAJTo0LZYZ4GYKdMK7SGQxtd1o3PyO1zberj6nn0QXmAfhr8fDw@mail.gmail.com>
In-Reply-To: <CAJTo0LZYZ4GYKdMK7SGQxtd1o3PyO1zberj6nn0QXmAfhr8fDw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201512011701.12802.marex@denx.de>
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
X-List-Received-Date: Tue, 01 Dec 2015 16:01:13 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, December 01, 2015 at 04:46:57 PM, Burton, Ross wrote:
> On 1 December 2015 at 15:42, Marek Vasut <marex@denx.de> wrote:
> > Looks like it depends on OpenSSL, so adding "DEPENDS = "openssl"" to the
> > recipe would be the solution, right ?
> 
> Assuming it's a hard dependency, yes.

I was wrong, I just looked into the upstream git of libbsd and there's the
solution:

http://cgit.freedesktop.org/libbsd/commit/?id=8493c7f27da2dcd2de71e9c7782c3d020d89c2a2

Best regards,
Marek Vasut

