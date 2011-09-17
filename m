Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R53OA-0002lz-NI
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:29:34 +0200
Received: by bke11 with SMTP id 11so13884352bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=O/4d9+8h+9UaOZIRfvIafmgrB593PgmaGqXUOgUIpQ8=;
	b=nbKQ+7Yg/WHHdkuY0XO1piiDOb+uIBEFKCh4N9RH+MVbx4l2QKur/19LYAJ7sBvYcv
	h3uAyYpkrwOrb4/eR9siWNtpPWp/tpkbcbg/7oRUYzHJsbUpssgySeFhfpTlQfxQeKPI
	ICiL6Z7NQ8o9/Rh0/3nfsXmayrdmBDGJyva4M=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr569441bku.114.1316298260600; Sat,
	17 Sep 2011 15:24:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 17 Sep 2011 15:24:20 -0700 (PDT)
In-Reply-To: <1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 17 Sep 2011 19:24:20 -0300
X-Google-Sender-Auth: 6UOIta4Wcm3RI6WOOO4aZOxTWu0
Message-ID: <CAP9ODKrRnNkg60i4Nj6O5kgQOajDe=gXnkSWr7U2vXVfS+yDYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Sat, 17 Sep 2011 22:29:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 19:18, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present in
> meta-oe kernel.bbclass. Several machines depend on this functionality.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

+1

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


