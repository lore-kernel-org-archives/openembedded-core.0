Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R7sfm-0004zR-4u
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:39:26 +0200
Received: by bke11 with SMTP id 11so5157675bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qbbwXwUURRN7cl+y05EBfGtC7MnIeIOQcgknrx2qCtk=;
	b=aXsb1cinQeSai4Ep0a221QYT6mzsSiXsrwHsP8bKrTdQECxODIFSR1nP60dP6Avn1i
	NmDU5v44WLKZEFcyDiFM94w14rvfJxDLe59cDJOrN1fp6f6EkHe4G69+bbRTZZHZFNUL
	l8YI4oqHJd5pkSV9v3Uva12Xy9lxo2zKmrPaE=
MIME-Version: 1.0
Received: by 10.204.130.138 with SMTP id t10mr3751361bks.10.1316972042566;
	Sun, 25 Sep 2011 10:34:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Sun, 25 Sep 2011 10:34:02 -0700 (PDT)
In-Reply-To: <1316971251.8185.31.camel@ted>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKqYbuwZ8a0gJrAY3gYKwGPioH9Nj69+nLWamUGLnEFLsQ@mail.gmail.com>
	<1316971251.8185.31.camel@ted>
Date: Sun, 25 Sep 2011 14:34:02 -0300
X-Google-Sender-Auth: Y7Twrl1oPpFvrBkcLMGo9s5MqxI
Message-ID: <CAP9ODKquVa1GNpKfchhExqswpYSY+qYFAmqQQcx4HHmP4LUupA@mail.gmail.com>
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
X-List-Received-Date: Sun, 25 Sep 2011 17:39:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2011 at 14:20, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-09-23 at 17:09 -0300, Otavio Salvador wrote:
>> On Fri, Sep 23, 2011 at 16:46, Dmitry Eremin-Solenikov
>> <dbaryshkov@gmail.com> wrote:
>> ...
>> > +FILES_${PN} =3D "${libdir}/lib*.so.* \
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${sysconfdir}/bash_completion.d/dbus-bas=
h-completion.sh \
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir}/dbus-bash-completion-helper=
"
>> ...
>>
>> I'd prefer to have this in another package.
>
> Me too, I think this should be packaged separately (with a RRECOMMENDS
> on bash-completion for good measure).

I don't think RRECOMMENDS are good in this case; people were using it
without this for long time and noone has noticed yet so it seems not
that required.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


