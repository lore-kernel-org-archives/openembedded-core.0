Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64F0E6AE9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 16:12:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6BGCTPY026887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2013 09:12:29 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 09:12:28 -0700
Date: Thu, 11 Jul 2013 11:12:23 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20130711111223.06985e9f@e6410-2>
In-Reply-To: <1373529521-31010-1-git-send-email-B40290@freescale.com>
References: <1373529521-31010-1-git-send-email-B40290@freescale.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: pseudo-native breaks native builds for symver.patch
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
X-List-Received-Date: Thu, 11 Jul 2013 16:12:32 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 11 Jul 2013 15:58:41 +0800
Chunrong Guo <B40290@freescale.com> wrote:

>       *symver.patch causes failure if the host glibc does not provide the glibc-2.0 version of the symbol.

I don't think we should take this out unconditionally, because it was added
to address a (different) problem -- we were ending up with the pseudo-native
libraries being used with host glibc that might be too old, and not have
newer versions.

I was under the impression that glibc tried to maintain binary compatibility
a fairly long way back; which hosts are omitting this symbol? What
architecture are you on?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

