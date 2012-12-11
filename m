Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TiNfn-0001G6-SQ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 12:06:58 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so2677823lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FHSS6u6Xc1pePxpPPtRy6UGlhvZqg+obddaH5Vt4jDI=;
	b=hPAXbdftytjMGactcZ77yHN2F+eKqJ3GB4dPaCbhZSP3FeTxIptXI13Ygid6e1TObX
	BOfVMnJ2UHSig+M6DG74NOH2izEBHK3lndKfWuMcu0OBOcjI4Ge65D/JpznNEs5gt4xE
	LnVIwSrDwVqMb+AZJL+mg2McSzGyoD+czc6d0Lxgrjm9J2y9uqTjxpgsB12sZvYIF1r6
	IS0jJUbB+wuwE7IQs5WqgHpDkqpMjV5X2b6YwP3JDUTDHu88DKpG0qsSy8AhlwIgB7ho
	JtyGFHawov9Weepm0HC0e5YAnVboRUzVjGpRrjZtVk7qBmA1KNeZVNKdsFd8KQguM/Q3
	DLaA==
MIME-Version: 1.0
Received: by 10.112.49.65 with SMTP id s1mr7381543lbn.123.1355223139858; Tue,
	11 Dec 2012 02:52:19 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Tue, 11 Dec 2012 02:52:19 -0800 (PST)
In-Reply-To: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Tue, 11 Dec 2012 05:52:19 -0500
Message-ID: <CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add 3.7 version of linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 11:06:58 -0000
Content-Type: multipart/alternative; boundary=f46d040167bbd7bb0004d09179c2

--f46d040167bbd7bb0004d09179c2
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> I would like to know are there plans to use 3.7 kernel for libc headers.
> This will allow me to drop own copy which I need to keep due to AArch64
> stuff which got added in 3.7 cycle.
>

There aren't any plans to use 3.7 for the headers, since we are tracking
the headers
with the same cadence as the yocto release kernels. Otherwise, we'd really
need
to have all versions available, and keeping things clean and focussed was
the
goal.

3.8 is the next likely update.

That being said,  since the libc-headers version is controlled by the
LINUXLIBCVERSION in tcmode-default.inc, simply having 3.7 headers
available shouldn't cause any problems or disconnects.

So we can open up the discussion if we want to carry extra libc headers or
keep with the current strategy. I've added Richard explicitly to the cc' so
he
can jump in as appropriate.

Cheers,

Bruce


>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d040167bbd7bb0004d09179c2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 11, 2012 at 5:12 AM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a href=3D=
"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.juszkiewicz=
@linaro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">I would like to know are there plans to use 3.7 kernel for=
 libc headers.<br>


This will allow me to drop own copy which I need to keep due to AArch64<br>
stuff which got added in 3.7 cycle.<br></blockquote><div><br></div><div>The=
re aren&#39;t any plans to use 3.7 for the headers, since we are tracking t=
he headers</div><div>with the same cadence as the yocto release kernels. Ot=
herwise, we&#39;d really need=A0</div>
<div>to have all versions available, and keeping things clean and focussed =
was the</div><div>goal.</div>
<div><br></div><div>3.8 is the next likely update.</div><div><br></div><div=
>That being said, =A0since the libc-headers version is controlled by the</d=
iv><div>LINUXLIBCVERSION in=A0tcmode-default.inc, simply having 3.7 headers=
</div>
<div>available shouldn&#39;t cause any problems or disconnects.=A0</div><di=
v><br></div><div>So we can open up the discussion if we want to carry extra=
 libc headers or</div><div>keep with the current strategy. I&#39;ve added R=
ichard explicitly to the cc&#39; so he</div>
<div>can jump in as appropriate.</div><div><br></div><div>Cheers,</div><div=
><br></div><div>Bruce</div><div>
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;<br>
</div>

--f46d040167bbd7bb0004d09179c2--
