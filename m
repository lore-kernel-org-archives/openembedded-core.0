Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SbShM-0000ck-I4
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 10:31:39 +0200
Received: by obhx4 with SMTP id x4so8191264obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=uFLcZ3qViQpf+znlBmzmlSRynrRsWFirXbXNMtvZtmE=;
	b=1CHahOExRZ40Y+hf5/E3lU98jTxywJRZ35JXhLTdYrEN7qfO+r0/HWlqpGkbKoKlpo
	87PhbTsBsi44TiyxphYQIvnTNfVOluFGytqJRd8tWNiJuIELlNTt0rqmSMor8Hi1PbD3
	pT3gMmQJf7mfltQj8Ehk4yFMQU3tOV9jl0EsYv6NTfmaeivzlDAL7g+9SI+s41qeq7NN
	E08fEmWA3ooytMe7QfQoAUFb0TsV3CoV+V0nnCnL+7FGGsK8Njf7qKx6Xy6UCHKcN/bA
	Yj2LoR6CB8BbADdPWIETjgCWFtZEgkYAU7HxHR3SUOJvEx3LiJuUXBiayhupdSjnRp6E
	J1hQ==
MIME-Version: 1.0
Received: by 10.182.207.39 with SMTP id lt7mr11175589obc.67.1338798071261;
	Mon, 04 Jun 2012 01:21:11 -0700 (PDT)
Received: by 10.182.8.3 with HTTP; Mon, 4 Jun 2012 01:21:11 -0700 (PDT)
Date: Mon, 4 Jun 2012 10:21:11 +0200
Message-ID: <CAOHjBZukor5Cy+2N-s0rFiiwR8Epp2vDaPuw7o5B4u-BMno3LQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: libiconv/gettetxt circular dependency on eglibc
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
X-List-Received-Date: Mon, 04 Jun 2012 08:31:40 -0000
Content-Type: multipart/alternative; boundary=e89a8f642d9476a8f304c1a137e1

--e89a8f642d9476a8f304c1a137e1
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm falling in a circular dependency error between libiconv and gettext
during eglibc build.
libiconv (as set in tclibc-eglibc.inc) is set to "eglibc", so the recipe
for libiconv shouldn't be included
in the build list (it inherits gettext and gettext depends on libiconv).
Please can you clarify this?

Many thanks,
Giuseppe

--e89a8f642d9476a8f304c1a137e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I&#39;m falling in a circular dependen=
cy error between libiconv and gettext during eglibc build.</div><div>libico=
nv (as set in tclibc-eglibc.inc) is set to &quot;eglibc&quot;, so the recip=
e for libiconv shouldn&#39;t be included</div>

<div>in the build list (it inherits gettext and gettext depends on libiconv=
).</div><div>Please can you clarify this?</div><div>=A0</div><div>Many than=
ks,</div><div>Giuseppe</div>

--e89a8f642d9476a8f304c1a137e1--
