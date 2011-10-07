Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RCDmC-00052d-MU
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:00:00 +0200
Received: by bke11 with SMTP id 11so5214979bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aApSGZJFRH0a8jjyrSqWIUAhcdesxpRtecf4Bi2ktL8=;
	b=uAmyRYbke6ZLUXjA8IO7mx6D/C5XwYLWWgVGKrHxDzAKcZQhijh67x/dUuBXuvWlpd
	JVNUGI9U4jok7jngWZM91se+GMGtBnCEi2JtqDpG8SSueDFrXteUNnWBcqv9nrK1if7K
	HFOdpQORrIsk/Szz0kT0vBkKusoxOr/bdABjg=
MIME-Version: 1.0
Received: by 10.204.157.136 with SMTP id b8mr1588408bkx.10.1318006459579; Fri,
	07 Oct 2011 09:54:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Fri, 7 Oct 2011 09:54:19 -0700 (PDT)
In-Reply-To: <1317996588.2405.18.camel@ted>
References: <1317996588.2405.18.camel@ted>
Date: Fri, 7 Oct 2011 13:54:19 -0300
X-Google-Sender-Auth: ZS9ZupuSPELV2cuSxmvq4C-a1fw
Message-ID: <CAP9ODKqnEP=T7iFrpN9h8Y-7tAYpYunskvTsFLkMBxpjbtW0bg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Convoluted dependencies
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
X-List-Received-Date: Fri, 07 Oct 2011 17:00:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 7, 2011 at 11:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> gettext-native -> libxml2-native -> python-native
> (hence gettext takes a *long* time to be built)
> What uses the python xml bindings?
...

Maybe a gettext-python-native or similar might be created if something
required the xml bindings for something.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


