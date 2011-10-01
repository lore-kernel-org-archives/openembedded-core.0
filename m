Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RA4h7-0006wy-8w
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 20:53:53 +0200
Received: by bke11 with SMTP id 11so3294855bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Oct 2011 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=8/d0aGppcPdmnNdoul0uEUzgTyNUeFYaXT3EObgwybM=;
	b=kbwBeyuy6iF4Cm7QpMUJ1O1PWjenXz9EAC5jJLvc0hav+oj0Ok+TS9xImB3+FACE4b
	McxLROcfZTFdtKH2A9yOPEO7dd6PGrn0a/mUFuQnCFEgtEysp9W9L/yTtSolQ6ouAxV6
	9+PLwWpwSdgdB0LfHQIYvGbY6P5BG2sJ0cDBs=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr9484660bku.218.1317494900166;
	Sat, 01 Oct 2011 11:48:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Sat, 1 Oct 2011 11:48:20 -0700 (PDT)
In-Reply-To: <1317402578.12332.218.camel@ted>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
Date: Sat, 1 Oct 2011 15:48:20 -0300
X-Google-Sender-Auth: 4ChFsu0H1VnDSJxAwVqTmt747Qg
Message-ID: <CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Sat, 01 Oct 2011 18:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 14:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> Thanks. I've taken the two patches. I'd love to get rid of hal, in fact
> its on my list of things that need to migrate out of OE-Core...
...

From default images this shouldn't be difficult but don't remove hal
from oe-core since many embedded OS still use it and haven't migrate
to udev or devicekit yet.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


