Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E794977D40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:11:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4TNBnKf014304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 00:11:50 +0100
Message-ID: <1496099509.25229.144.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Max Krummenacher
	<max.oss.09@gmail.com>
Date: Tue, 30 May 2017 00:11:49 +0100
In-Reply-To: <e9b75721-f3e3-7f3f-e781-58df67b4130a@linux.intel.com>
References: <20170526203537.30721-1-max.krummenacher@toradex.com>
	<cf075667-da8d-6b04-8cbb-a39fd3c0fcfa@linux.intel.com>
	<CAEHkU3VWN7gwy1pZYK6izb5V6kr6=s+9fCymb+Px==ZLRZi6-g@mail.gmail.com>
	<CAEHkU3VzMEsCgxwL_mc1MiAQ-1-Ks7WEhyz15T3OpzdpJ-C1+w@mail.gmail.com>
	<e9b75721-f3e3-7f3f-e781-58df67b4130a@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 00:11:51 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 29 May 2017 23:11:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-29 at 18:54 +0300, Alexander Kanavin wrote:
> I see. You are right here. I admit I don't fully understand if it's 
> generally okay for -native recipes to look around in (and later use) 
> host include  directories like that, as we're striving towards 
> reproducible builds, and this behavior is not supportive of them. 
> Richard, can we have your say please?

Its unavoidable really, we have to have some host system we build on as
we need a compiler/headers from it. Even if you build a gcc-native,
what would you compile it with? :)

If you do want to avoid the risk, you'd choose your own custom base OS
(or container) and then always build on that. It would then be both
reproducible and deterministic. We don't want to mandate a specific
host configuration out the box though.

So this patch avoids an issue. We don't tend to run into too many
issues like this one thankfully.

Cheers,

Richard





