Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RKMwA-0001VM-0V
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2011 05:23:58 +0100
Received: by bkbzv3 with SMTP id zv3so1359598bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2011 21:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3sxmneVsSGDo2ZdzwLP1SfpMjlcT7kTJmE9zLIvGtJE=;
	b=ZMZ8iXK8IovXk4CcnvWCyRPbSWIinnXBwb15niaFWhY6iEOrjZKWZCgwudqcPasIjq
	Wvi4W2PdIc1DfTeUST6oGzT2VDCyoIUUpYUrogVxFlfHhxYiF5nHa3x7jTS+kWAzvMO9
	zMF/3GohCxxWuCzadhmb5QOK+i4pvzJwZwFDc=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr298849bku.40.1319948273180; Sat,
	29 Oct 2011 21:17:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Sat, 29 Oct 2011 21:17:53 -0700 (PDT)
In-Reply-To: <CAP9ODKq09hVbQSAkDoKHztUnnUwwPMg3GfhoZspOad3CMhQsOw@mail.gmail.com>
References: <20111028205842.GA17752@gonzales.palutemo>
	<1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKq09hVbQSAkDoKHztUnnUwwPMg3GfhoZspOad3CMhQsOw@mail.gmail.com>
Date: Sun, 30 Oct 2011 02:17:53 -0200
X-Google-Sender-Auth: jQRTiV4-Iq8RH5ZqLSMymVUxsW0
Message-ID: <CAP9ODKpmANAfsXHLgzh=S7-KRK7i3+WMeaThXmspxjqa95xu9w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: add work around to set right owner in postinst
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
X-List-Received-Date: Sun, 30 Oct 2011 04:23:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2011 at 02:13, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Sat, Oct 29, 2011 at 08:53, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> ...
>> + =A0 =A0 =A0 if [ -z "$D" ] ; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chown messagebus:messagebus ${localstatedi=
r}/run/dbus ${localstatedir}/lib/dbus
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chown root:messagebus ${libexecdir}/dbus-d=
aemon-launch-helper
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chmod 4754 ${libexecdir}/dbus-daemon-launc=
h-helper
>> + =A0 =A0 =A0 fi
>
> If you use $D in directories it will work for in-target and rootfs
> installs allowing use of it in read-only-fs.

As in http://paste.debian.net/141111/ (untested)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


