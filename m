Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QMcTx-0001LA-0k
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:51:53 +0200
Received: by yxn22 with SMTP id 22so496113yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=zeh+d0L2ZfNmt5XRiYjNGIY37ugxKZa/C/b/x8z6qX0=;
	b=qGwGVdM+0ORGaL0ad3v9n1oiBocGLWV/CpWC+S7IAj70qBcpqswwy5hGSHHYVO/wUt
	SK0SZKBar3NwDCl1Mr1t6xlrbH2Q6/EjpVfkvo9P+GBSPYGvpBPha45n906o9vOFevdq
	DvKrWF5MmfFQ6giHbAzzG2B5YpJRvXtSWjUQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d9RDbwyUaNPME6W8fWVS04ESwu40Z8KsBhR5OQiBk8m4i/U0VlP1zW7fZvp1q2n0vW
	RuvqlctpbogWFk4K/tQkPlF6iXoi7Kw2F6JpHNlmhUqFqvUVzimKA9xkjgAiOal7zYoF
	1UwjGs4cM5Ozd4B25NPH0P4mG+baUC3jBw8xU=
MIME-Version: 1.0
Received: by 10.91.218.17 with SMTP id v17mr1297864agq.18.1305708537996; Wed,
	18 May 2011 01:48:57 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Wed, 18 May 2011 01:48:57 -0700 (PDT)
In-Reply-To: <1305705436.3424.299.camel@rex>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
	<1305705436.3424.299.camel@rex>
Date: Wed, 18 May 2011 10:48:57 +0200
Message-ID: <BANLkTimxzmHLg9FkMuF8HOYiUuDiBjzR8w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 08:51:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/18 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
> > I think we need to globalize libc variable like MACHINE or MULTIMACHINE
> > and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
> > in base.bbclass for sanity. Something like attached patch might be
> > able to do it
>
> Having assessed how many places in the system we'd need to make this
> kind of change I'm now of the opinion its too great. I think
> manipulating TMPDIR is a better cleaner solution and we should inject
> this there...
>
>
> Note that this introduces  additional build time and space to rebuild
native recipes for the different TMPDIR variants. Something which is not
needed with the solution from Khem, if I properly understand things.

From a conceptual point of view it seems better to mangle the target subdir
name  in work (e.g. ppce300c3-oe-linux-uclibc) or introduce a subdir in
TMPDIR for  (e.g. ppce300c3-oe-linux/uclibc )

(actually I seem to recall that we have or had something in OE as well,
something like deploy/glibc)

Frans

