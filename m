Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlNYp-00012O-6h
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 18:36:08 +0100
Received: by mail-oa0-f52.google.com with SMTP id o6so2357239oag.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=k1oUrzESAE8gcs5SOAdj13saY/MNiYt8SWWj8icgyrc=;
	b=rXcP0iJVuOEUu+X6PxdV1PcSaur0IYC6qv8sqMuZ79liUIselvZHib35kYwzbqhwgr
	r74QmLDYQoB+o1D3cCxQChAJszpIIiW2THZvUA77jdl78Pdmsz0Up5Z3aEp6ZYsxQeqp
	RHwoqnAKh6WsAoDZFMZY9UIBrqV1py1DrG1AqpFZT47iTJ9yVx/o6q8YXsqbaqa5gvzu
	n4YkHX7z4G/kJ2+EPDcX8ZnFyReHtJ3w/Gdi+qp2JGmhFKLONz0eDafXKgdJgKmIpOuT
	n8imWIZ4iwYYDvFsXr7re6B7oDD4SBrHyQz9flUN/ppODRpv8Pw+Llfhm0yDw8oH4V1K
	kw3w==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr5402761obp.62.1355937674806; Wed,
	19 Dec 2012 09:21:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Wed, 19 Dec 2012 09:21:14 -0800 (PST)
In-Reply-To: <50D1F76D.4070000@intel.com>
References: <50D1F76D.4070000@intel.com>
Date: Wed, 19 Dec 2012 15:21:14 -0200
X-Google-Sender-Auth: Ew1J-QKKmybBAnvkIUQRm4exbuA
Message-ID: <CAP9ODKoJMX6m6094W0f=o0OG6-kdrByLBAhNq_XU-Y7SSVqzyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 17:36:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 19, 2012 at 3:20 PM, Radu Moisan <radu.moisan@intel.com> wrote:
> Hi guys,
>     I have prepared a branch on poky-contrib (rmoisan/systemd) where I
> pulled systemd from meta-openembedded. The goal is to merge this into
> oe-core, so please take a look and give me your feedback on stuff that needs
> work or things that I might have done wrong, so that I can prepare it for
> merge.
>     At this point core-image-minimal and core-image-sato both boot fine with
> systemd. There still are a few warnings but not critical(at runtime), at
> least in my opinion, you may want to take a look at those too.
>     You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"

In this case, systemd is made *available* or used? Is it possible to
have sysvinit image and another systemd?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


