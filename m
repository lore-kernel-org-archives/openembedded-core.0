Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C6EDC6C3A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 19:55:56 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y17so27076781wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xYU3yldih3jEqpTOEjX3Gb8/ch/d3MhgZmkSQvnNSj4=;
	b=E2Cy3DGJSFlzTAz+jRSsO0KnhC4GP3NeU5C6RVEcNDUbEH1oGbcrkcTYihD4QBSq3h
	NTeT7yFVpX+l2D4of8DhVuXD/bqZpeM+RB7eZFSDpe+pyRBZ/T9fJCQ7o2RJ4YIySvou
	QmVIQWsisYo0/pA02lkuwmP8vyiDTJlxd4W0pjNsRT8VtGITvcxzllnrZOiUaX9kfkya
	EjpKVgZioD1J63RUbb/MCqxhEVWrc2YZ+vwDTAo1+JL+BDXu8hRbyWppFXeGDwNDChqI
	P3oFvXdrNaTtPq5NSj++jZRJjRjoG2uHyqSKtyhkFNIGywJkHQpcd+Rcam9joZD7VnuO
	T9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xYU3yldih3jEqpTOEjX3Gb8/ch/d3MhgZmkSQvnNSj4=;
	b=IxvBP+GrzKmqUwj5WriixtHgFHbMPP4NKudkMxpncg5B75Nz3Glb+BhGOkwiFZ6smA
	GVxtbzMPYbYr34ccsjrstmNdpm8W9u1tjFbaU6FWSbQf8OjRwvoxQ4jh1vBgcVBaTDIX
	fPB1GHCqZgySeNB1Zvk5KtdgaNYrlKsxO49ef0zPZGLbPw9BCkCuqPGQvgajLej1M5A1
	9jr8w2vAuKApn7LB0ojsur/gb+IPFTQQkkivdW5qL6LGiII7EPBes9YXOjbNBQmsxAyS
	gasqMvOqMv6ci6+IdWLkkooI3s5qRykkpHo6Rj53/eFofCABXP+36pvS39q0jXxwrAj8
	iGgw==
X-Gm-Message-State: APjAAAUnOlBNmK66cpC7kGQ4gGGW3PmFlMDKEemBw9EMBp+/Vs9x8v7k
	ewjDcYPVCEhQH8BOv6VFBRagm/i8A5p/gBh9cGI=
X-Google-Smtp-Source: APXvYqy76/unk5jmyJSIsvkbnjXzf8cQNHc6NbUffT4HgQM2cwZ1YqVD7rSXrwa/veWRAhWgu9iCSDTb21o0BA0M5LE=
X-Received: by 2002:a5d:6652:: with SMTP id f18mr53888798wrw.246.1577476557227;
	Fri, 27 Dec 2019 11:55:57 -0800 (PST)
MIME-Version: 1.0
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
	<cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
	<CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
	<CAJdd5Gbbmv45-q0G1FSDgfNLNQG+xHArorf=F=-wZtdOPU85xA@mail.gmail.com>
	<a9bc7048e2f7dd45a6fd6e7730c8143573646ac7.camel@linuxfoundation.org>
In-Reply-To: <a9bc7048e2f7dd45a6fd6e7730c8143573646ac7.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 27 Dec 2019 13:55:46 -0600
Message-ID: <CAJdd5GYUDegdRO7kR_PcM8oO4BoEbhxunYfm7qanGBnW-eBTjw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Fri, 27 Dec 2019 19:55:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 22, 2019 at 3:25 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-12-22 at 10:22 -0600, Joshua Watt wrote:
> > On Sun, Dec 22, 2019, 10:17 AM Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> > >
> > > On Sun, Dec 22, 2019, 10:09 AM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Sun, 2019-12-22 at 10:00 -0600, Joshua Watt wrote:
> > > > It won't help the other native/cross to target boundary mapping
> > > > issue.
> > > >
> > > > See above, I'm wondering if we could abuse the method field to
> > > > make
> > > > this work? Certainly we could test that...
> > >
> > > That seems reasonable for a quick test. The method is supposed to
> > > be the output hash calculation method, so my first instinct would
> > > be that it is better in the long run to add another field e.g.
> > > "class" or something.
> >
> > Perhaps based on ${NATIVELSBSTRING} like sstate.bbclass path? That
> > has nice congruency with sstate file paths, which I like
>
> If only that were the right thing.
>
> We need:
>
>     if bb.data.inherits_class('native', d):
>         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
>     elif bb.data.inherits_class('cross', d):
>         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
>
> i.e. SSTATE_PKGARCH but only for native/cross.

Ok, so I've had a little bit of time to think about this.

From a more theoretical standpoint, I think that hash equivalence only
works if all of the possible variables that can impact the output hash
are present in the taskhash. Otherwise, you can end up in cases
described above where the same taskhash results in diverging output
hashes that will never converge back together (in this case because
the build host arch differs). For most target recipes this should
already be true because we certainly want to rebuild the recipe if any
of the inputs that could possibly affect the output change. One of the
great parts about hash equivalence is that it sort dynamically and
automatically figures out if these changes don't actually change
anything and accounts for it so we don't have to manually figure out
which variables for which recipes could be whitelisted (not that we
would embark on that madness!).

However, for some recipes (e.g. native and cross), the taskhash is
incomplete in this case because we don't actually care about the
specific binary output from these recipes; we actually care about the
behaviour of these recipes when they are run (e.g. we don't care if
gcc-cross running on x86_64 or aarch is the exact same binary as long
as it produces the exact same cross compiled target binary in both
cases). Hash equivalence sort of falls down a little bit here because
there is no sane way to hash the "behaviour" of a native or cross
recipe. If there were we could set the output hash algorithm for
native and cross recipes to "OEOminiscentBehaviourHash" and all would
be well :) In lieu of that, the next best thing is to make sure that
the inputs we give to the hash equivalence server are the full set
that affect the output hash, just like we do for target builds. This
works because we do expect that on a given build host arch, the output
should be the same from build to build.

So, the real question is how do we make sure that the inputs to the
hash equivalence server are all the ones that affect the output hash?
I think there are a few options:
 1) Make up yet another hash (yahash) that is equivalent to the
taskhash + the hash of variables "unwhitelisted" for the purpose of
hash equivalence. Instead of dealing with taskhashes, the hash
equivalence deals with yahashes
 2) Just like #1, except that the yahash is only the unwhitelisted
variables and hash equivalence uses both the taskhash and the yahash
for lookups.
 3) Implement some sort of "namespace" field in the hash equivalence
tables that is used to filter out entries appropriately (basically,
the solution proposed by Richard).

I don't really have a strong opinion either way.... #3 seems much
easier, but the thing that worries me is if we are going to find other
variables that should be unwhitelisted and do #1 or #2 anyway.

As stated, I think that one of the advantages of hash equivalence is
that we can be a little more aggressive with what we "unwhitelist" and
let the hash equivalence process itself figure out if variable
actually makes a difference in the output.

>
> Cheers,
>
> Richard
>

