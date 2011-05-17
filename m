Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QMKtU-0005oh-L3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:05:04 +0200
Received: by bwz5 with SMTP id 5so559929bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wGISGNMohX59phtC5fHw1XBtLdsCwuw61bqCs506qsE=;
	b=e0rnoRpLPwOM6/XA2t2inNwuDZb/47w+E2Jl3Cq8ebPkHe26mHh10hu1j7s+YJfBYT
	i52dfZEr3Umqjgx3QwuAEbXYgAX1/LIiVKiAzpBANQk+EB61SgZfXBIA1otiXBqpQ25O
	ZQb5Jmy3BXK/ga8/loY4sMBjqXBReXnPi7N34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vOIGu9d+bCNqDnqCa+bFqWGVfzHxD52KsQqmY6AtHAfDFQscxzKwS3aNHm0OrBSSM7
	veb3+xlHF8WE5LLtgoScfxpfz0GRWiYMkjNHpJp6G4RRKrOwCKinykrxFJ63jnoM/8Ny
	kftHUf3HPv5CXdQUmHJ+nK8nS+6z+wQNgUeAQ=
MIME-Version: 1.0
Received: by 10.204.163.130 with SMTP id a2mr708913bky.108.1305640930732; Tue,
	17 May 2011 07:02:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Tue, 17 May 2011 07:02:10 -0700 (PDT)
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Date: Tue, 17 May 2011 11:02:10 -0300
X-Google-Sender-Auth: _Z469-tFNg0obDgKj67AWsnApO0
Message-ID: <BANLkTimNBR_9K9qpFUjxbzR_=rsY5GbTmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v2 00/15] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Tue, 17 May 2011 14:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 19:25, Darren Hart <dvhart@linux.intel.com> wrote:
...
> Darren Hart (13):
> =A0create-pull-request: alphabetize arguments
> =A0create-pull-request: whitespace cleanup
> =A0create-pull-request: use git request-pull and arbitrary remotes
> =A0create-pull-request: rewrite known private URLs to public URLs
> =A0create-pull-request: provide an RFC mode via -c argument
> =A0send-pull-request: whitespace cleanup
> =A0send-pull-request: remove local mta support
> =A0send-pull-request: fix greedy auto-cc regex
> =A0send-pull-request: don't send all patches to everyone even with -a
> =A0send-pull-request: verify git sendemail config
> =A0create-pull-request: add untested oe repository support
> =A0send-pull-request: streamline git-send-email usage
> =A0*pull-request: add copyright, license, and descriptions
>
> Otavio Salvador (2):
> =A0create-pull-request: do not check certificate
> =A0create-pull-request: add GitHub remote support

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


