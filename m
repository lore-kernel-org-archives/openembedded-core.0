Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 865A66A59F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 18:28:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6CISQrM009779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2013 11:28:26 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 12 Jul 2013 11:28:26 -0700
Date: Fri, 12 Jul 2013 13:28:18 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>
Message-ID: <20130712132818.79ac7905@e6410-2>
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E104187A5@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1373529521-31010-1-git-send-email-B40290@freescale.com>
	<20130711111223.06985e9f@e6410-2>
	<B21730BB6DA1D24B83348D9301EA417E104187A5@039-SN2MPN1-022.039d.mgd.msft.net>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 12 Jul 2013 18:28:30 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 12 Jul 2013 02:10:21 +0000
Guo Chunrong-B40290 <B40290@freescale.com> wrote:

> Powerpc architecture and ppc64 hosts.

Okay. We haven't previously tried pseudo on those that I know of. We may need
to revisit the way this patch gets applied. For the short term, it might be
possible to apply it only to x86 or x86_64.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

