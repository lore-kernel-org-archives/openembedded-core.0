Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2A14B71957
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:08:47 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q04Kr2hY2z3hjFG;
	Tue,  9 Feb 2016 14:08:47 +0100 (CET)
X-Auth-Info: XaNVJT1lwQwZ0YguFYy0DUsYNNrt7m8tFAwbn0ZqiKc=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q04Kq34zwzvdWt; 
	Tue,  9 Feb 2016 14:08:47 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 13:07:54 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<1455017471-6682-6-git-send-email-marex@denx.de>
	<CAJTo0LZ7fpKqnuyzWmQ02dw5DnKS4+XBbAEx=nNmZDi-Fq6+ZA@mail.gmail.com>
In-Reply-To: <CAJTo0LZ7fpKqnuyzWmQ02dw5DnKS4+XBbAEx=nNmZDi-Fq6+ZA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201602091307.54737.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 13:08:49 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 09, 2016 at 12:53:01 PM, Burton, Ross wrote:
> On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3
> > \ +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
> 
> Why did the license checksum change?

Because the LICENSE file now contains one more entry for nios2, which changed
the checksum of the whole file. Maybe we should trim the checksum to use only
the header in the LICENSE file and not the whole file to prevent this ?

This is the change which triggered the change of the checksum:

+diff --git a/LICENSE b/LICENSE
+index 3147094..a06fdcc 100644
+--- a/LICENSE
++++ b/LICENSE
+@@ -45,6 +45,7 @@ compiler.h
+ arch/s390.h
+ uatomic/alpha.h
+ uatomic/mips.h
++uatomic/nios2.h
+ uatomic/s390.h
+ system.h
+

Best regards,
Marek Vasut

