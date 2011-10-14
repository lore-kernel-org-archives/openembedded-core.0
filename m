Received: from mail-yx0-f173.google.com ([209.85.213.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REVQp-0007mn-Bm
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 02:15:23 +0200
Received: by yxk38 with SMTP id 38so243214yxk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 17:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QhnTNZhrhHMqb8Vf/xVReQNkaN+HznUK3NHoehhKtrQ=;
	b=r2/pbxoFU/5jTLpNhncXhIQN43z1kmljZLVG2Z/UtbePh4Ex9PVrcc5nn4s+JyM+Jh
	rSXJQKMmFS6s0QcK4fgQ8jxc0hcYZ9jtesXWnzHQrls0U9H04YPnVuOw6l7nw8qYgMvD
	X/sekwzMIz4tsIoscbWSjtGnab8TvBX9NQkDM=
Received: by 10.68.8.233 with SMTP id u9mr12549411pba.30.1318550978054; Thu,
	13 Oct 2011 17:09:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 17:09:08 -0700 (PDT)
In-Reply-To: <1318535180.3158.4.camel@lenovo.internal.reciva.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
	<20111003150904.GR7364@jama.jama.net>
	<1318535180.3158.4.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 17:09:08 -0700
Message-ID: <CAMKF1spsGP=k24dbbX+p4dQLncBcaP5BX6Qf0S4ZrcttnfqSGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Fri, 14 Oct 2011 00:15:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 12:46 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-10-03 at 17:09 +0200, Martin Jansa wrote:
>> On Mon, Oct 03, 2011 at 04:02:10PM +0100, Phil Blundell wrote:
>> > Can you add some commentary explaining why this is necessary -- i.e.
>> > what exactly is lacking in uClibc to mean it doesn't have "prober TLS
>> > support"?
>>
>> I'm not using uClibc myself and tracking original bbclass in OE-classic
>> leads to this commit
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa/mesa-tls.inc?id=b527d8f723c98c77f2f5c5358062e5348493d767
>>
>> So I'm CCing woglinde and he will probably explain it.
>
> I see this patch has been applied in the meantime so I guess it's a
> slightly academic question now, but I still think it would benefit from
> some further explanation.

This patch is no longer needed. Since uclibc now supports TLS/NPTL and
we do not support
Linuxthreads in OE (starting with oe-core) if we did configure with LT
then uclibc does
not have TLS implementation that goes with LT but thats a moot point in oe-core

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


