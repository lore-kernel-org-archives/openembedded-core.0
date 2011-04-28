Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QFZLH-0003gA-P1
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 00:05:47 +0200
Received: by vxd7 with SMTP id 7so2712377vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=YwKeSX7H0gKvDGm/GtN98YAmPHZLxPvAe1s88BNrGjU=;
	b=IPid/uFMCNbzv4LUms7FZT/gRPVzU2wQ0t6JJD5UzJCwQ13Ui/khqKZyJJuUeRLnT9
	DTWkwEvsPKQFKHS5JgAwWki39D1MgSA0XLx9DYlTx2RpIikGNrL7KFUM+312OvVu9CaC
	fCeuIghNb/+cIf8ABHpxVUBkLGf/6Md/wiv/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=icMTJcRZaG9wyRVIclb3Fcft7YZbanTRU0fCcwyM8yChCa1BNFN3risiAUpXaaBA0t
	QoDtb13Jl+dToL9tUpo0HWTfuDj+Y9mLHM/WBhJ1heFFz93SzeE0fCtAwPLsPQ2TslZw
	DcFw3ZaQJa0cACBfdUxnvsUXP0y12waFjI43c=
Received: by 10.52.91.71 with SMTP id cc7mr2934038vdb.288.1304028195058; Thu,
	28 Apr 2011 15:03:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Thu, 28 Apr 2011 15:02:55 -0700 (PDT)
In-Reply-To: <4DB9DADA.1020304@windriver.com>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
	<20110428092232.GA3259@jama.jama.net> <4DB9859D.7070609@windriver.com>
	<1304024672.2171.396.camel@vorpal> <4DB9DADA.1020304@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Apr 2011 15:02:55 -0700
X-Google-Sender-Auth: XXttilxwBqIxcWncWk1rdNNLPH8
Message-ID: <BANLkTimxB2LuGWGtjyBKQgFTkKqb5p3YfA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: poky@yoctoproject.org
Subject: Re: [poky] RFC: design of network based PR service
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
X-List-Received-Date: Thu, 28 Apr 2011 22:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 2:23 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> Checksums and timestamps are not enough to determine a logical progressio=
n of
> the components.
>
> We need something that informs the user where these changes fit in the gr=
and
> scheme of things. =C2=A0Are they newer or older then a recipe of the same=
 name (and
> package version)?

I think we might want to stop using the term PR to describe what
you're talking about here.  PR has historically had a quite specific
meaning to us, given how bitbake has operated, and how stamps worked.
It sounds like you want to formalize what we've likely all been doing
manually -- PR .=3D ".1" or whatever in the .bbappend of a given layer.
Do you think we really need a format string for this, or would
introducing a new variable that's simply a list of extra version
components, and which is used by the packaging classes, likely not by
bitbake itself, get the job done? Am I grasping your need correctly?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


