Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJtDP-0001nq-Nd
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 22:07:31 +0200
Received: by wwb17 with SMTP id 17so6037084wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=G2xox2yYkh6NgFxl61H/qUZ23nDpNjRDY61puYXNYs4=;
	b=JZEg2W5D3Ze+9BVDxwj8cFH/UbmaX3QWz/pVQmdLHQOd/wOD5dQzFN9fHqUktLXLF0
	urYOOQWq3w+GHSYuOfg0ZpQ7NayKQPIMCyWiFsV8Hq6zPrIHqHSjuU/kqUlXx6wpBtbG
	RYhv/P5T4TCLgmKLD5VBBF2tGd8cMZGaIlrlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=pTuliffTQsTeeluJbucowE+UQdgVHRdzvx9UylC/6Z4w/5ihFnyOeMqVU30WY9KElY
	j5pi7hAcP5ze2asBwxjLbgBb2m8xJEdZdWs4JslvZlgst4IHvjTt7wY4NQJO+kfcyhu/
	YKa7kHArJWSWI9a9BKnCy2JXZdWjmUaxtYMlQ=
MIME-Version: 1.0
Received: by 10.216.230.153 with SMTP id j25mr44478weq.22.1305057884111; Tue,
	10 May 2011 13:04:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 13:04:44 -0700 (PDT)
In-Reply-To: <4DC99913.1060403@linux.intel.com>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
	<4DC99913.1060403@linux.intel.com>
Date: Tue, 10 May 2011 17:04:44 -0300
X-Google-Sender-Auth: hRnOXz3BAMJEvVXmyt6G4j0nQNw
Message-ID: <BANLkTimnZyL-Jr0Dyd-CgPKk9k_n_HBT-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cmake.bbclass: fix qmake and rpath issues
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
X-List-Received-Date: Tue, 10 May 2011 20:07:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 16:59, Saul Wold <sgw@linux.intel.com> wrote:
> In Richard's email he proposed one or the other be set, why do you need t=
o
> set both here? =A0If both need to be set then you don't need the override=
.

Because they're different no? Otherwise native.bbclass has those for others=
 too:

...
PACKAGES =3D ""
PACKAGES_virtclass-native =3D ""
PACKAGES_DYNAMIC =3D ""
PACKAGES_DYNAMIC_virtclass-native =3D ""
...

Seems logical, no?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


