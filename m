Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RKMrd-0001Ms-Md
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2011 05:19:17 +0100
Received: by bkbzv3 with SMTP id zv3so1358778bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2011 21:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sCX2zqRWqf9cykCTxcYwGxMq+9ahssb/2Z6smBxjFPM=;
	b=rAMswodKJGvyQSiRh1SErhcQ7QtmVQ+ZmsXZSDwXxR/F28ezTJpJwhoYgPxygHm+9U
	0LedhYIKDnlTpDxVnHZGFCxQoMKGQh6KVB0jH40ezbh5iBFR1qVzskMAiy+1IIzXdJkD
	YZCkcenWhDWdw5pce5ouK4g7Va8xWEWKCqQY8=
MIME-Version: 1.0
Received: by 10.204.38.16 with SMTP id z16mr6634828bkd.66.1319947994128; Sat,
	29 Oct 2011 21:13:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Sat, 29 Oct 2011 21:13:14 -0700 (PDT)
In-Reply-To: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
References: <20111028205842.GA17752@gonzales.palutemo>
	<1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 30 Oct 2011 02:13:14 -0200
X-Google-Sender-Auth: v9o8nhbSejzdBdYq0H2KqOKz8Pc
Message-ID: <CAP9ODKq09hVbQSAkDoKHztUnnUwwPMg3GfhoZspOad3CMhQsOw@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2011 04:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 08:53, Martin Jansa <martin.jansa@gmail.com> wrote:
...
> + =A0 =A0 =A0 if [ -z "$D" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chown messagebus:messagebus ${localstatedir=
}/run/dbus ${localstatedir}/lib/dbus
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chown root:messagebus ${libexecdir}/dbus-da=
emon-launch-helper
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chmod 4754 ${libexecdir}/dbus-daemon-launch=
-helper
> + =A0 =A0 =A0 fi

If you use $D in directories it will work for in-target and rootfs
installs allowing use of it in read-only-fs.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


