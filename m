Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 46DAA719CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:53:59 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:d9ca:78f3:9621:b8b5] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1btvd9-0006Zq-Ue; Tue, 11 Oct 2016 13:54:00 +0200
Message-ID: <1476186839.16008.43.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 12:53:59 +0100
In-Reply-To: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 11:54:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-10-11 at 16:02 +0800, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> Source file plural.c might be updated with bison from plural.y, touch
> it
> before applying patches so that this file is consistent across
> builds.

I think it would be better to just configure glibc explicitly without
bison (BISON=no).  It doesn't DEPEND on bison-native anyway so it ought
never to be using it.

p.


