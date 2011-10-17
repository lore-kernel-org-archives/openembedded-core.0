Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFmou-0006Rj-KV
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:01:32 +0200
Received: by bkat8 with SMTP id t8so5738136bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=h6+IQnGivjnBjPd61z1iow3cZLFGBLRU7PhXTqt2jG4=;
	b=w6Dme3NKpmHEESMqMmHwdsvLietL9wVkmtvOBwMZXAySbMgaglQA+VF0OcHW9hdwfr
	ztn68IP1NBrglzs65fQHC/X2JCgNb7zkAm29Z+cCS/0xjXqjuNeH8VakDA85A/dJCkjS
	o4YMjt/me1RgfhsrfA3uegoofgmAKFaUGHdQs=
MIME-Version: 1.0
Received: by 10.204.7.138 with SMTP id d10mr8983395bkd.31.1318856144264; Mon,
	17 Oct 2011 05:55:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Mon, 17 Oct 2011 05:55:44 -0700 (PDT)
In-Reply-To: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 17 Oct 2011 10:55:44 -0200
X-Google-Sender-Auth: w_0WpL5UmRIa7Lg4DRZ-7w_Hyt0
Message-ID: <CAP9ODKrrHLwOhNpL01_0oirD+m6nYjPbgGhDNBGpBaYJhBsQFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Mon, 17 Oct 2011 13:01:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 10:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> * ie syslog-ng has a lot of .so and .la files in ${libdir}/${BPN}/ and
> =A0fails with this QA check:
> | ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so:=
 syslog-ng path
> '/work/i586-oe-linux/syslog-ng-3.2.2-r6.1/packages-split/syslog-ng/usr/li=
b/syslog-ng/libafsocket.so'
> * I haven't tried to rebuild from scratch to check if this changes is
> =A0creating more QA issues about unpackaged files then what is trying to
> =A0fix (ie in syslog-ng), that's why it's RFC
...

Even it raising new warinings it seems the way to go.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


