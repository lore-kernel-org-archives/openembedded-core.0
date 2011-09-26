Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8AML-0004Tk-KQ
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:32:33 +0200
Received: by gxk4 with SMTP id 4so5330716gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 05:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A+K5MRmruYEAjdW8dTh5mmaziw3HnD/xtxh9lhuTaGc=;
	b=cipEbuQsJ5gqbjtYjaxiSaUq5YqeY3GunDLm6fsvvn5UId8aDThnniTtg0+dzcWDoC
	f514Yd60HoFjUU379eE535lR2xOkEsmED3yu/QlW3zXa1LEpefGymDYweFhG7aOI8Swm
	ggdLT3PZfKPqdj5Ss/YfO3uhtdMVTDGF9Dqt0=
MIME-Version: 1.0
Received: by 10.204.139.20 with SMTP id c20mr4653616bku.218.1317040026974;
	Mon, 26 Sep 2011 05:27:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Mon, 26 Sep 2011 05:27:06 -0700 (PDT)
In-Reply-To: <1317029042.26109.29.camel@ted>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
	<1317029042.26109.29.camel@ted>
Date: Mon, 26 Sep 2011 09:27:06 -0300
X-Google-Sender-Auth: a3ZoVIe49Zf9mRfR6kUZKu1SB2s
Message-ID: <CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 12:32:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2011 at 06:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> FWIW, something like git cherry can identify your local changes so you
> could apply them on top of master so there are other ways to make your
> usecase work...

This breaks the value of using a SCM since you won't have a common parent.

As Chris, I'd prefer to have it merged.

The only way it can complicate issue is if fixes are cherry-picked
into the stable branch. If they're are done into the stable and merged
into master this works wonderfully.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


