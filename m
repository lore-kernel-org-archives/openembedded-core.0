Return-Path: <fenixk19@mail.ru>
Received: from fallback7.mail.ru (fallback7.mail.ru [94.100.181.128])
	by mail.openembedded.org (Postfix) with ESMTP id CC15960169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 20:36:13 +0000 (UTC)
Received: from smtp30.i.mail.ru (smtp30.i.mail.ru [94.100.177.90])
	by fallback7.mail.ru (mPOP.Fallback_MX) with ESMTP id C9F0A1216C861
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 23:17:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID;
	bh=U+U7YFep7Fw5duHLRFvxHB03h+TmTeplJxttEe3BqGQ=; 
	b=JP/Vjytm/mvPjqsKaAFQoOkScgOasit28F/2uqYlyY2jaqUGkXaPWCY3ZHNPs4HDpJmRbKnVxp99cprlG2xtr0bgnNHo50lDXvyW1cJRIkBkCZCQywVkZXBWzK1a0MIsXZOy7FfcaykzybaoxT17k73MEQyfjAlQ4JLDIr9vurM=;
Received: from [77.244.254.229] (port=40186 helo=[0.0.0.0])
	by smtp30.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1XwGMa-0007rJ-7M for openembedded-core@lists.openembedded.org;
	Wed, 03 Dec 2014 23:17:28 +0300
Message-ID: <547F6FD4.3010602@mail.ru>
Date: Wed, 03 Dec 2014 23:17:24 +0300
From: Alexander Varnin <fenixk19@mail.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Spam: Not detected
X-Mras: Ok
Subject: a question on libatomic
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
X-List-Received-Date: Wed, 03 Dec 2014 20:36:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!
I'm using openembedded as a part of poky to build OS and softward for my
Freescale IMX53.

There was libatomic introduced in gcc 4.8, and I see it is getting build
- I see the respective rpm packages in the deploy directory.
But it doesn't getting installed to my target rootfs image - there is no
files called "libatomic*". Doing bitbake libatomic doesn't give me a
result. So, could somebody tell me, how can I force build system to
install libatomic on target?


