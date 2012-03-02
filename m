Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3c4E-0004wT-PN
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 00:39:18 +0100
Received: by lagw12 with SMTP id w12so2790370lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 15:30:47 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr5374816lba.38.1330731047402 (num_hops
	= 1); Fri, 02 Mar 2012 15:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=K1PWHBFnVcuuIkxl0fPKx3jGvdYsXPlB7coJuhkNEiA=;
	b=GbhAjaCxYg2XGnj06Rk4mu75/+Qd1FOwG0ms9KDIvcKntICeXgUbyL+poKeEj6Wu/d
	cNKK9jHHzIYOEFJOPfczxFwwWySbK9sxXckMzc3HJ4AIumN041QeZo+1EZnBog16dbzF
	r3fKVurguC0GR7ph7b4vcQT4xD7L96S2pYGxQk8c+hefpGx7Befb4nJncA6SVaVNKVH3
	dVfCrs7z7DrTNg7PNG9kRsr2Baz0lM30mzFJVjDEDoTmnbC19B12KFHI9xgwGYhTVMTH
	P2cksnWkpi6CG55/Ov2934RekTvoPyHJ9xcMK8kvIjspTKyqgRr9Gl5PyAfEnxKOzU3u
	+Jpg==
Received: by 10.112.8.129 with SMTP id r1mr4430682lba.38.1330731047315; Fri,
	02 Mar 2012 15:30:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Fri, 2 Mar 2012 15:30:17 -0800 (PST)
In-Reply-To: <CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2012 15:30:17 -0800
Message-ID: <CAMKF1sr_9RXwRHYN7M6ELLZEqbQsM7X6RQELiPn697zyGCetzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 23:39:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 2, 2012 at 2:29 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
>
> 3. Recipes not tested yet (need more work):
> meta/recipes-bsp/x-load/x-load.inc (want specific ARCH)
> meta/recipes-bsp/u-boot/u-boot.inc (multiple versions available)
> meta/recipes-core/eglibc/eglibc.inc (multiple versions available)

eglibc is already built parallel. It uses a different flag
EGLIBCPARALLELISM which directly derived from PARALLEL_MAKE
since eglibc uses PARALLELMFLAGS="-j X"


