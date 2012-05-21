Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SWQJh-0006qS-GJ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 12:58:21 +0200
Received: by pbbrq2 with SMTP id rq2so5903377pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OpV87OebLQ1JbZFTB8VmXq6MPTRyi72Zm2e5NT9Y2OQ=;
	b=NGiDhiiUaTzFzjEkq0H7ccwZY7CwdKVj/Ik3o0FP1IBVlD79eLerCfWBq4ZKA6gw9s
	Bat0d0TV2VzGaOWKVgyXepq4kzCGYqdgpq6eoEOUJx766j3C8QYuCLxAMNck7Qzmvu0q
	JdZjpfu5NfZB5zgwwAUXgVgxe68Mjtoi+OZL9Glwn6H/aHtAeBJz5kcXy1vMd6HJNHQW
	GrHA8jYyfCccFS7g2rsPiehYqgG0a/DdRddGg4M+d/B6ldvq0h8etHpGFy+TtxFp3Fzl
	rIYLozn6c8jlgKVrvhT3pIrCj8ncDB53OLHWUO6TWnGtLQ3myCSZMxcCZDCMHaVs7dsT
	31Dg==
MIME-Version: 1.0
Received: by 10.68.132.101 with SMTP id ot5mr3220156pbb.91.1337597290587; Mon,
	21 May 2012 03:48:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Mon, 21 May 2012 03:48:10 -0700 (PDT)
In-Reply-To: <20120521065305.GB3166@jama.jama.net>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
	<20120521065305.GB3166@jama.jama.net>
Date: Mon, 21 May 2012 07:48:10 -0300
X-Google-Sender-Auth: Uh9-SLDtC8nguhPAjMVtbNr31pc
Message-ID: <CAP9ODKqF=gnm9O7wA+7qDmXpesBO3qNS8QtnGVQmM=srL=4Qfg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v1 1/1] Reorder and -dev
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
X-List-Received-Date: Mon, 21 May 2012 10:58:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 3:53 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> the rest looks ok, but I'm pretty scared from such changes, does your
> buildhistory diffs show just *-config file moves or something else too?

It would be nice if some images could be build before and after the
patch and check before proposing this for merging.

> When you're at it, does it make sense to move also ${PN}-doc
> ${PN}-locale before ${PN} in PACKAGES? Both have well defined FILES
> patterns, so ${PN} last can be used as catch all.

It'd be awesome; but let's do it step by step or the time to fix all
possible mess of it might be tooooo long ;-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


