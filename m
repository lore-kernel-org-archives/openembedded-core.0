Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R7C8b-0007JX-Be
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 22:14:21 +0200
Received: by bke11 with SMTP id 11so4196662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 13:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Y2VDVwq1tIJ0S8AAE3IBRvzqS0QQFb+/QCGBrdHsv20=;
	b=bgGt1X+bLIAucO3G8Ezi0grw6PFkZx/yxxu2uM6OmW1Xcc3eg1DdP59rlBu9aYfRsS
	WGzS7iIuu+iUL0VVwXqImOubibJJ+N1W1+H+M6bIc/91CY4DT4InMpIDXNRWAtlve/31
	MkgHgSf+9MFMairnRTwEaooAQJcGw3ccf14ps=
MIME-Version: 1.0
Received: by 10.204.7.207 with SMTP id e15mr2940986bke.62.1316808540328; Fri,
	23 Sep 2011 13:09:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Fri, 23 Sep 2011 13:09:00 -0700 (PDT)
In-Reply-To: <1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
Date: Fri, 23 Sep 2011 17:09:00 -0300
X-Google-Sender-Auth: ajPahbVLMNv1w5UcGnINtT50-UE
Message-ID: <CAP9ODKqYbuwZ8a0gJrAY3gYKwGPioH9Nj69+nLWamUGLnEFLsQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 04/10] dbus-glib: include bash-completion stuff
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
X-List-Received-Date: Fri, 23 Sep 2011 20:14:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2011 at 16:46, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
...
> +FILES_${PN} =3D "${libdir}/lib*.so.* \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${sysconfdir}/bash_completion.d/dbus-bash-c=
ompletion.sh \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir}/dbus-bash-completion-helper"
...

I'd prefer to have this in another package.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


