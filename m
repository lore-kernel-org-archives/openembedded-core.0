Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 885197472E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 21:16:13 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id E8CBE2E8922;
	Sat, 31 Mar 2018 16:16:13 -0500 (CDT)
Date: Sat, 31 Mar 2018 16:16:08 -0500
From: Seebs <seebs@seebs.net>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180331161608.351f1300@seebsdell>
In-Reply-To: <CAJdd5GZ8kS3fcB9j1U8bqOjM3wjc6qAizwOw7-E_ry3wOrPGSQ@mail.gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
	<1522501975.11431.208.camel@linuxfoundation.org>
	<CAJdd5GZ8kS3fcB9j1U8bqOjM3wjc6qAizwOw7-E_ry3wOrPGSQ@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 21:16:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 Mar 2018 16:03:01 -0500
Joshua Watt <jpewhacker@gmail.com> wrote:

> Looks like maybe gdk-pixbuf-query-loaders has the unlucky honour of
> being one of the few programs that invokes the pseudo syscall()
> wrapper before any other functions that pseudo wraps and the missing
> initializer made it explode?

That seems exceedingly likely, because indeed, that's supposed to be at
the top of the wrapper. Thanks.

-s

