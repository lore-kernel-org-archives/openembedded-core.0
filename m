Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1165E74C4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:59:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7KAxV9R007970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 20 Aug 2018 11:59:32 +0100
Message-ID: <d7b2186dfc7f0b24fb45e779aa0086288e05080a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, ChenQi <Qi.Chen@windriver.com>
Date: Mon, 20 Aug 2018 11:59:31 +0100
In-Reply-To: <CAMKF1srgDJK9M7=y5LGxB-93FGk-dwyh0W+ALyC5a0_NidkE8Q@mail.gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
	<74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
	<f64a8311-b32f-3074-96dd-ff7364a43b2d@windriver.com>
	<CAMKF1srgDJK9M7=y5LGxB-93FGk-dwyh0W+ALyC5a0_NidkE8Q@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Mon, 20 Aug 2018 10:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-19 at 19:41 -0700, Khem Raj wrote:
> On Sun, Aug 19, 2018 at 7:19 PM ChenQi <Qi.Chen@windriver.com> wrote:
> > 
> > There's a build failure on autobuilder.
> > 
> > https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/70
> > 0/steps/BuildImages/logs/stdio
> > 
> 
>  I pushed a patch to pull branch which should fix it
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/
> master&id=a05cc1ee8eb1cb05064164a9ae62db6dc78d022b

I'm afraid not:

https://autobuilder.yocto.io/builders/nightly-musl/builds/1252/steps/Bu
ildImages/logs/stdio

https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/701/st
eps/BuildImages/logs/stdio

Cheers,

Richard

