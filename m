Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjwUt-00026F-NF
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:53:15 +0200
Received: by pzk1 with SMTP id 1so2270847pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=U+Qswnx7kDe7aA9ZB5rPkapV/W8TdR3xYXhX7b/yg5U=;
	b=kiXH+RBDyWdwsnvODZmKpyIX+Twwl0IRqZQHRVq7Bqn+0hDM3/jzd8MWof7e5c3ONW
	69hOl8sZ60rAsNMb6sC1EEZfhCqsRwdsijPPBfilZwrtZxyAotgJ7s5vhWcQDleTI16O
	4B/i+IWVTYwegzNOh4zplyX5cEv+/FE8Lewug=
Received: by 10.68.35.105 with SMTP id g9mr505947pbj.479.1311266947242; Thu,
	21 Jul 2011 09:49:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 09:48:37 -0700 (PDT)
In-Reply-To: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
References: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 09:48:37 -0700
Message-ID: <CAMKF1srHzFH9PpmKcSMFhSRUstGnt6Pf-z6pirXQFWTpci0vWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 16:53:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 5:17 AM, Kumar Gala <galak@kernel.crashing.org> wro=
te:
> Why do we have a split between powerpc-common & powerpc-linux?
>
> I assume powerpc-linux is used and picked up for powerpc-linux-uclibc in =
addition to normal powerpc-linux.
>
> I'm looking at adding powerpc64 support and powerpc-common is all kinda o=
f broken for it. =C2=A0I'd like to just merge powerpc-common & powerpc-linu=
x (as powerpc-linux 32-bit) for now and start a new powerpc-common that ref=
actors 32/64 commonalities.
>
> Unless someone says otherwise about the meaning of these files.

powerpc-common is shared between uclibc and eglibc at present and may
be shared with other OSes that may build with OE in future.
traditionally powerpc-common implicitly implied 32bit so I am not
surprised if its broken for ppc64. You could add powerpc64-common
and leave 32bit alone. See how its done for mips64 in oe.dev

http://git.openembedded.org/cgit.cgi/openembedded/tree/site

>
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


