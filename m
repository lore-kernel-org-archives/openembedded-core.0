Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QHfdX-00028X-0S
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 19:13:19 +0200
Received: by gxk3 with SMTP id 3so511354gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=YcSK328RgqZPjKK1WNal2g7RjYK+tNglxSWVFVvUdsc=;
	b=BJ4zwpU+tc5PltCRm06/Ysukkvlheq5bM14cz4f2z07qoHeFyJMGVIursCzbyeFSDu
	BxmLjiK9eOERJQ4BW6Utjz6Vs+iPLziySdxctpYpfhRchhxkubX3aP2tGW6Wh9MiKVbM
	PEXDUv6hrLj33G9MpndERlBVW6YARbEtBZUSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Q+8y6WhhntqSzCfkI+xEm98Jt6JZqYaX3BvZ3gGsGMlr2BZlNRMLBET3enmx1sIjN7
	lO+iWmKtRj5GeUDsK/39jVmprOrQBCFURIZDxhq3MdNaAR6BAnsVFQ+r7f/i1/hfclfX
	y7Bgxda3FyAoI0YRzHeKk3Bg2U1OUGZgcYPK8=
MIME-Version: 1.0
Received: by 10.91.92.1 with SMTP id u1mr1303893agl.128.1304529037905; Wed, 04
	May 2011 10:10:37 -0700 (PDT)
Received: by 10.90.32.18 with HTTP; Wed, 4 May 2011 10:10:37 -0700 (PDT)
In-Reply-To: <1304524804.21461.158.camel@rex>
References: <cover.1304515719.git.ke.yu@intel.com>
	<1304518043.21461.154.camel@rex>
	<BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
	<1304524804.21461.158.camel@rex>
Date: Wed, 4 May 2011 19:10:37 +0200
Message-ID: <BANLkTikZai0KEv6hJ25GatZ9YUzdg6N+Hg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 17:13:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/4 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Wed, 2011-05-04 at 16:24 +0200, Frans Meulenbroeks wrote:
> > Most of the time the SRCREV is before the PV, but not always (and
> sometimes
> > separated with an empty line and sometimes not).
>
> Patches welcome...
>

I know. It was more a hint for future changes.
Also this probably should be part of a more global style cleanup to make
things more according to the style guide.

[...]

> >
> > PS: speaking of yaffs2 utils: it could be considered to move to a
> somewhat
> > newer version (not that I care as I do not use yaffs2)
>
> It is something we should look at going, yes although I don't think
> yaffs2 has changed that much in a while.
>
> The latest changes are about 13 months old, but there seem to be quite some
changes since 2007 (although quite some seem cosmetical).

(btw there is also an abiword cvs recipe with a srcdate of 2007; somehow odd
given the number of regular releases abiword has).

Frans.

