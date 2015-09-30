Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C42B600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UGhien018406; Wed, 30 Sep 2015 17:43:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4ONx5uqR5TJX; Wed, 30 Sep 2015 17:43:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UGhW7r018351
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2015 17:43:43 +0100
Message-ID: <1443631412.5162.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Sep 2015 17:43:32 +0100
In-Reply-To: <20150930162101.GE2405@jama>
References: <1443620963.5162.85.camel@linuxfoundation.org>
	<20150930162101.GE2405@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/sstatetests: Add test that MACHINE doesn't change target sigs
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
X-List-Received-Date: Wed, 30 Sep 2015 16:43:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-30 at 18:21 +0200, Martin Jansa wrote:
> On Wed, Sep 30, 2015 at 02:49:23PM +0100, Richard Purdie wrote:
> > When we change between two machines with the same tune, we shouldn't see 
> > rebuilds of binaries. This adds a test for this using the qemux86copy 
> > machine. We also extend the test to cover multilibs.
> 
> 2nd level of this test is to verify that all allarch recipes have the
> same signatures even for 2 MACHINEs with different tunes.
> 
> Thanks for looking into this.

There is already another test in the file which covers that and some
nativesdk constraints too.

Cheers,

Richard


