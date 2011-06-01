Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRsZz-0000bQ-9V
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:03:51 +0200
Received: by bwz5 with SMTP id 5so483032bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rCJawYSw0+j7qmv4QzFwWnSemEjzXkQ1nIoj5urgFUQ=;
	b=yHO74MytptO2XLTfjxA2iCSMrg2Yvw0ZtyzLp3zAQOf8bgt+QMDmpiGCB5vDsj/krD
	fRadfgLHvUbNFg1+9+M8tmXwxsMR1ueHfBBcSt6DzVEL4VNDiPfsD6dOcCP28emePewq
	uZQMhYIR77unrJOXO4I0I/AgQgSK1Pe1fH40g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gXay3sueEQLqp/ph9N/ohn9TyhqFdBjqjEQIZxru+A24QLGyOTiHhu3j5lT0RyTfIB
	7dnU3uWv5B6dLJpHHonyotk8KO5AcM66HiV7RDlyWbDDe2cNTgXDpFV8LCxBvVpbXgSi
	1CaucRtqicfOi7HqhXmZJ0o1km6mLpmexHsSo=
MIME-Version: 1.0
Received: by 10.204.47.18 with SMTP id l18mr7412346bkf.31.1306962040558; Wed,
	01 Jun 2011 14:00:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Wed, 1 Jun 2011 14:00:40 -0700 (PDT)
In-Reply-To: <1306961600.3119.15.camel@lenovo.internal.reciva.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
	<1306961600.3119.15.camel@lenovo.internal.reciva.com>
Date: Wed, 1 Jun 2011 21:00:40 +0000
X-Google-Sender-Auth: 0gfkf4NC4CQYM4ApKLjuhbkDWZY
Message-ID: <BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Wed, 01 Jun 2011 21:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2011 at 20:53, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
>> Are you able to reproduce it?
>
> No, it works fine for me. =A0I get:
>
> checking how to link with libpthread... -lpthread
> checking for libdl... yes
> checking how to link with libdl... -ldl
> checking whether we are using the GNU C++ compiler... yes
>
> This is with the current head of oe-core on qemuarm.

I am building for i586 but I doubt it is related.

I get:

checking for libpthread... yes
checking how to link with libpthread... /usr/lib/libpthread.so
checking for libdl... no
checking whether we are using the GNU C++ compiler... yes

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


