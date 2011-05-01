Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QGfbg-0003QF-Sx
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 00:59:16 +0200
Received: by bwz5 with SMTP id 5so4699477bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HzgpkBnQSTj0QzkA8tgCGm/5tmqe1WiDfwKhBPbqKKA=;
	b=FUPM+E11m1EsfzDdHUVT9qCQj9D7vzn7g5jjo2059vFVsr+dCCZW3eqMhLdz1JZbeX
	lSBZI2nofuL/T+az7XLVQQbBSC27FI8aVJlYFqZydbktQ11mWPOUTklKhpJD8xcFT1qY
	4H7uUlL5qP5yXmp3GPDLxESrW5Zng60QdwIoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=d28q7IN4sMKIDpzX/x7bFEebpPNziTE9kM8kPyIRIao+7J6+xSUJg8ihKg+JR6QPCG
	6IsMVYyF9xw1CYP4Iqa/mr4tjZpkBYcQj97oODb+jSTI+DymJ6Uf9jgTMPHCGAOLyUoS
	6VgZD4Mej1vNnMhMSRy4uK/9Cb9JNunYleugQ=
MIME-Version: 1.0
Received: by 10.204.169.130 with SMTP id z2mr2758640bky.137.1304290600555;
	Sun, 01 May 2011 15:56:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Sun, 1 May 2011 15:56:40 -0700 (PDT)
In-Reply-To: <f79ca6085cffcc03b657191214f5a5a301adb2eb.1304200899.git.raj.khem@gmail.com>
References: <cover.1304200899.git.raj.khem@gmail.com>
	<f79ca6085cffcc03b657191214f5a5a301adb2eb.1304200899.git.raj.khem@gmail.com>
Date: Sun, 1 May 2011 19:56:40 -0300
X-Google-Sender-Auth: Oi9AUa22eDvK24Icd-aJTasT8Q4
Message-ID: <BANLkTikv=skcyS0GaQGmH+BQ4gsQ2VqwsQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] alsa-utils_1.0.24.2.bb: Fix build for uclibc targets
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
X-List-Received-Date: Sun, 01 May 2011 22:59:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 30, 2011 at 19:07, Khem Raj <raj.khem@gmail.com> wrote:
...
> +uclibc does not have exp10 function which is glibc extension.
> +Bur we can get the same behavior by using pow()
...

Typo! s/Bur/But/

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


