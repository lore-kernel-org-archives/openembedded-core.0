Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3A865C85
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 22:24:54 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z107so4687030qgd.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Nov 2014 14:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vJx6wHJ2UIPGQJWoNNBatRJKXW0HriREnss+27jCyaw=;
	b=YHRBky8dWyWbO0Bb3vEVF7OIIhvaTuZ1B+H8R10gQ+EhU3SJzTqV0itQt51WdMC1wn
	Wlgl2O56jMAGnJFurFrBGcm1f5ElhNbIyW/RRxfkTNzXlvxmH7e/BEFocaNdpLuusQo0
	rGpxOE8OKwnR5Og7oqHo5kYfF559fSXbvoIiXCkluVMQUMMrp3YsDObVMcNoRkjgv7Mx
	suN0sXmdWPMXrD7PDmt7nVL5h7BwlXmcP3lBGQjCQkFAIZM4s2LnDskxNz0pX1zYf3HC
	5NxL0j1KqnZe2BqC538RTzZ2QyCQKFDWXu62REJL4v5CjU1U6tgNzGog3xvE0ETDU9eK
	A89w==
X-Gm-Message-State: ALoCoQmr8uV7kPc54CEBmg1bcgLxWKX7lUrnkWBsCgUvIy4cA273w2Mxc1Wfi7XrhW6wqrn3BLg0
X-Received: by 10.224.28.193 with SMTP id n1mr38563492qac.93.1415571894408;
	Sun, 09 Nov 2014 14:24:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sun, 9 Nov 2014 14:24:34 -0800 (PST)
In-Reply-To: <C5FE670A-7A85-44C1-8658-243252007B9A@dominion.thruhere.net>
References: <20141107121040.3488494c@tyr.amer.corp.natinst.com>
	<C5FE670A-7A85-44C1-8658-243252007B9A@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 9 Nov 2014 22:24:34 +0000
Message-ID: <CAJTo0Lb4aqpfYWHZ20FruDJzQec7NvaUuH2E0rBi6CxwWSWJYA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Sun, 09 Nov 2014 22:25:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca30ebb11b0507748366

--001a11c2ca30ebb11b0507748366
Content-Type: text/plain; charset=UTF-8

On 8 November 2014 18:55, Koen Kooi <koen@dominion.thruhere.net> wrote:

> I can if you'd like that, the utils were few and small, so I put them all
> in ${PN}, let me know if you still want them seperate.


Personally I don't see a reason to split the tools up, but following
tradition and shipping them in $sbindir is sensible.

Ross

--001a11c2ca30ebb11b0507748366
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2014 18:55, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I can if you&#39;d l=
ike that, the utils were few and small, so I put them all in ${PN}, let me =
know if you still want them seperate.</blockquote></div><br>Personally I do=
n&#39;t see a reason to split the tools up, but following tradition and shi=
pping them in $sbindir is sensible.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11c2ca30ebb11b0507748366--
