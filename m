Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 37FA47F404
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 14:23:09 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D81542E8938;
	Sat,  3 Aug 2019 09:23:09 -0500 (CDT)
Date: Sat, 3 Aug 2019 09:23:07 -0500
From: Seebs <seebs@seebs.net>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190803092307.486e930d@seebsdell>
In-Reply-To: <CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
	<20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Sat, 03 Aug 2019 14:23:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 3 Aug 2019 05:33:46 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> Will this fix the file ownership issue that we see with Glibc-locale
> packages from time to time?

I have no idea. Since I haven't got a reliable reproducer for it, I
can't test it in a sane way.

-s

