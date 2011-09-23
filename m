Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R7AJR-0004jf-Ci
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 20:17:25 +0200
Received: by bke11 with SMTP id 11so4106461bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=noFcKvM1YdOX8z7DdCScVYA4ews7T0RmAwu9tko8gCc=;
	b=D/w3DoVfExmBxwxzqZUu2FX/ImfcZ/RC9lWMJa5XAjQDjb+hSjzz+RdO25XOUY5HYQ
	O9kTOAGUIfdtg6n5tZabKpPI1QOPgp8/YQ0mwmC7wSpVJ0ITafXQ0lBmM+22Gs42zLJj
	odyg/WqThkGFnLjm34pZ151RWe7akiOds0XYU=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr2765322bku.114.1316801524299;
	Fri, 23 Sep 2011 11:12:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Fri, 23 Sep 2011 11:12:04 -0700 (PDT)
In-Reply-To: <1316799031.3125.3.camel@ted>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
Date: Fri, 23 Sep 2011 15:12:04 -0300
X-Google-Sender-Auth: B2Ca8f0bj5LA4Np4DHHwtQFR77E
Message-ID: <CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Sep 2011 18:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2011 at 14:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> I don't really see the point of this. Basically you're asking that every
> time there is a commit to the branch there is also a merge commit. You
> can just as easily either force a checkout of master, or merge against
> master with a one sided merge. Git doesn't have the confidence to do
> that automatically but I'm pretty sure there is a simple way to tell git
> to do a one sided merge...

Not every time but at every release and point release.

one sided merge make you lose all local changes you did. Doesn't seems
a valid upgrade path but a "replace path".

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


