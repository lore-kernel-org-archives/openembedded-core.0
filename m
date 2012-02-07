Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusBA-0001It-Kr
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 22:02:20 +0100
Received: by eekd41 with SMTP id d41so2271551eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w64IQFPPNI6CmvX45+eTHgR7Dslj4y2XrTLHqR0wh+A=;
	b=lXwlWtD80Q4k4jXVUWrgJuHcT5YjfIbL86p1BrZJGEptU2BDwRY6/AmY9+iw8ISaE7
	Vy2kPEiZUQax6q1ff+4PbnFfqd/yJPqpV8kLuGC8Z9nXhb8uvo8u+742VyPxdFQH8xVo
	vAma6jQjYwxJGYcvZWceUEh8moEhK9OUzmA5Q=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr5403618eeb.39.1328648058133; Tue,
	07 Feb 2012 12:54:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 12:54:18 -0800 (PST)
In-Reply-To: <4F318D77.5020901@linux.intel.com>
References: <1328646568-25721-1-git-send-email-andrei@gherzan.ro>
	<4F318D77.5020901@linux.intel.com>
Date: Tue, 7 Feb 2012 18:54:18 -0200
X-Google-Sender-Auth: gOS4FBqseiaeZu454XNmMnk72Z0
Message-ID: <CAP9ODKpZwQHyAsYeR-BRTChgrb68xi8enrn_RoajXX4mBU7TJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Tue, 07 Feb 2012 21:02:20 -0000
Content-Type: multipart/alternative; boundary=90e6ba6153a8895d0704b865fb0f

--90e6ba6153a8895d0704b865fb0f
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 18:45, Saul Wold <sgw@linux.intel.com> wrote:

> We are trying to address warning that come from the build, so can you
> please address the packaging issues and the location of libcrypto as it's
> in /usr/lib while dhclient is in /sbin and may not have /usr yet (see prior
> discussions about / and /usr boundry issues.)
>

What would be the fix for it? move dhclient onto /usr/sbin?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--90e6ba6153a8895d0704b865fb0f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Feb 7, 2012 at 18:45, Saul Wold <span di=
r=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div id=3D":1do">We are trying to address warning that come from the build,=
 so can you please address the packaging issues and the location of libcryp=
to as it&#39;s in /usr/lib while dhclient is in /sbin and may not have /usr=
 yet (see prior discussions about / and /usr boundry issues.)<br>
</div></blockquote></div><br>What would be the fix for it? move dhclient on=
to /usr/sbin?<br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail:=
 <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyst=
ems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank"=
>http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--90e6ba6153a8895d0704b865fb0f--
