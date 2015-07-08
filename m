Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A041C607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68C1jWV001713; Wed, 8 Jul 2015 13:02:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KZ9RC5IwheeB; Wed,  8 Jul 2015 13:02:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68C2R8A001771
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Jul 2015 13:02:38 +0100
Message-ID: <1436356947.27597.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Wed, 08 Jul 2015 13:02:27 +0100
In-Reply-To: <CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Wed, 08 Jul 2015 12:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-08 at 15:00 +0300, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
> > Quite simple configuration (MIPS64 N32 image) fails to build (see below).
> > I have verified these patches in both single lib and in multilib cases.
> > Tri-lib images and SDK for MIPS build fine with these patches.
> 
> Any comments on this patchset? It would be nice to have N32 ubroken in
> the current
> master tree.

Mark, can you review these patches please?

Cheers,

Richard


