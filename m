Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD33D6D5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 19:43:15 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id t9so1690959qeq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GUnUdtdBCIE1szSudYWk635hfF7Z83pXnYCrppX2sv4=;
	b=npO3zUz4G0vH8LYftZGUYsJ4dYoGe7Y7ZikHOZrts6h1fb6xJeNUVyCAsEyuEFXGeB
	WnfXm6abb7PXGw1Pr5N4ShGPEq4D/88ts8BCenxIPI+7C/CewHQEHaiLi9s/BbeYPoNB
	vrQPYly58+Xat0MrVYMqzXRfREF3ME2aSxXPXqTGb3sHVHfYS1ik6POMySt2rSpVkDPh
	HAS+I7DTsgFog+kxak4eJkMN5fOcnQe4BnGr6I9SC/lVWWpNW5eAGOhebnEFapLF0QEd
	Fv/Z6igJmlXqVAA+1pFdqO9wOE2TprvH0vsSLu2xADrAAbQzDpGLalGqFw33BqjL04Wm
	pCuQ==
MIME-Version: 1.0
X-Received: by 10.49.1.10 with SMTP id 10mr20136420qei.6.1384803797087; Mon,
	18 Nov 2013 11:43:17 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Mon, 18 Nov 2013 11:43:17 -0800 (PST)
Date: Mon, 18 Nov 2013 21:43:17 +0200
Message-ID: <CADV-EXGySaHof6gBdnVmZBDOw2yWB3YT804aHJPGuqE7WLo2Bw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Kernel recompile if "rm_work" defined
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
X-List-Received-Date: Mon, 18 Nov 2013 19:43:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

When I set
INHERIT += "rm_work"
in my local.conf to save some space my kernel now recompiles each time
I run bitbake.

How to fix this without removing "rm_work" from config?

Best regards,
Yevhen

