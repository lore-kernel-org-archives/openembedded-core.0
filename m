Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sfb6v-000136-58
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:19:05 +0200
Received: by vbbfr13 with SMTP id fr13so1931173vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9vKIZVtTeSdle+mUbB2H42jsjfpg/T2Cxz0oYza2964=;
	b=YS89f6NDqUfRtcNaTnKL824TDGpHTBogOi5+wQ4TrbQiZnaQEWDERX65eVFsCHO19h
	sjde5XvGma8al/bXjjcLCekjA+b/8/BSvDKMfg4+HufRETej1LDbxmZn7TGN9y9cemDe
	x0jp505FW1jE0NDUamkCPx8dupH0xyXRwGU3N3sOPldVQWEcZlhMgKPcpyuOc52Tq+fe
	Xdirgb3TPVPmM8NLu6Y+axSErrm9dUxvLXfAN81P5mJX28J7HwYYOH2O6zXjgc3o2i7d
	YzzikMeea54+QjoHZS5be6nHUNmsTk0SkWbtnq4f9SfUfXgVSqWXL9ibn/jnLH81MO9g
	PT6A==
MIME-Version: 1.0
Received: by 10.52.92.228 with SMTP id cp4mr2846011vdb.42.1339783705763; Fri,
	15 Jun 2012 11:08:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Fri, 15 Jun 2012 11:08:25 -0700 (PDT)
In-Reply-To: <4FDB57DB.5090407@gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<4FDB57DB.5090407@gmail.com>
Date: Fri, 15 Jun 2012 15:08:25 -0300
X-Google-Sender-Auth: OyWyNfXggEXKHrP1qX8hkdy3aW4
Message-ID: <CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 15 Jun 2012 18:19:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I think creating a networking layer is fine idea, alongside meta-oe,
> as a separate layer in meta-openembedded repo. Reshuffling recipes
> from meta-oe into different layers is fine. I would like to avoid copies.

I'd prefer if it used another git repository; people needing to use it
shouldn't be forced to clone whole meta-oe.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


