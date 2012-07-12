Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpLrY-0001HX-Bw
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 18:03:32 +0200
Received: by yenl13 with SMTP id l13so2368451yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 08:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=dEzIcLY+4aSOdE09+305TBz4giQn3zE69ovOBO3T3/I=;
	b=dCsgZvDDP2rg3EW0YhWfXb7iTX0GMRBgYpkwY0vDK9I0CDeZ/luFyL0LYmzJ/xD2+B
	JFpD01BnDl6ak1F62/YEH3YtzI9bGGGjuBqvjHCm0o/4nWoGyD0AWHPSpcnzP6JLQ8PC
	HvqO9BACvwIAoMX5OZZe2WyJRu3sxzz8lR4EEMYRTNhcy4hqEuv7dnZj441KjrqZBW/v
	nDynttjZzQcxMu6Y7lguH1z2Le87SR0O6ymNibMl4xeOGolURFwbo/jxhnL9sM6DHdkW
	RItqsSDKdEg5dnbG89C5s1VYcW5qUMazvrPHsC9yNwc/M5DofIj45CKZgn80EYWdYGKM
	cstA==
Received: by 10.50.94.163 with SMTP id dd3mr17714670igb.8.1342108337876; Thu,
	12 Jul 2012 08:52:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Thu, 12 Jul 2012 08:51:57 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
References: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
	<A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 18:51:57 +0300
Message-ID: <CAK18fxHimz3FTZ9AuTF2ORz=JSgmU51ZAMgDk+2fwo4reA2GoQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmMVfvJej8cyjeimvySDaQsEm55R0AwPXSjkyzP0RiLhgyzfJA7ZjY3pc9lMr/o5vLo6oXy
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Results for xz compression with different -T and and -e
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
X-List-Received-Date: Thu, 12 Jul 2012 16:03:32 -0000
Content-Type: multipart/alternative; boundary=e89a8f2357fdbaad1a04c4a3f2eb

--e89a8f2357fdbaad1a04c4a3f2eb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 6:40 PM, Koen Kooi <koen@dominion.thruhere.net>wrot=
e:

>
>
> Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan <andrei@gherzan.ro> het
> volgende geschreven:
>
> > Hello,
> >
> > Koen suggested to add -T to xz commands. We have this option implemente=
d
> in our current version .1alpha.
> >
> > -T threads, --threads=3Dthreads
> >               Specify the number of worker threads to use.  Setting
> threads to
> >               a special value 0 makes xz use as many threads as there
> are  CPU
> >               cores  on  the system.  The actual number of threads can
> be less
> >               than threads if the input file is not big enough  for
>  threading
> >               with  the  given  settings or if using more threads would
> exceed
> >               the memory usage limit.
> >
> > -------------------
> >
> > Memory: 7.8 GiB
> > Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
> >
> > File to compress: 1.9G
> >
> > xz -f -k -e -9 --check=3Dcrc32 (current configuration)
> > Memory: 673Mb
> > real    6m37.170s
> > user    6m35.389s
> > sys     0m0.884s
> > Compressed file size: 3.4Mb
> >
> > xz -f -k -e -9 -T 4 --check=3Dcrc32
> > Memory: Cannot allocate memory
> >
> > xz -f -k -e -8 -T 4 --check=3Dcrc32
> > Memory: 1.8G
> > real    3m24.462s
> > user    12m8.502s
> > sys     0m2.180s
> > Compressed file size: 3.4Mb
> >
> > xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
> > Memory: 471Mb
> > real    1m9.265s
> > user    4m8.972s
> > sys     0m0.944s
> > Compressed file size: 3.4Mb
> >
> > So my conclusion would be to use the default -e -6 with -T 4.
>
> Out of curiousity, what does -T0 give you?
>
>
Exactly the same as -T 0.

@g

--e89a8f2357fdbaad1a04c4a3f2eb
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 12, 2012 at 6:40 PM, Koen Kooi <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_b=
lank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
<br>
Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan &lt;<a href=3D"mailto:andrei@=
gherzan.ro">andrei@gherzan.ro</a>&gt; het volgende geschreven:<br>
<div><div class=3D"h5"><br>
&gt; Hello,<br>
&gt;<br>
&gt; Koen suggested to add -T to xz commands. We have this option implement=
ed in our current version .1alpha.<br>
&gt;<br>
&gt; -T threads, --threads=3Dthreads<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 Specify the number of worker threads to us=
e. =A0Setting threads to<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 a special value 0 makes xz use as many thr=
eads as there are =A0CPU<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cores =A0on =A0the system. =A0The actual n=
umber of threads can be less<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 than threads if the input file is not big =
enough =A0for =A0threading<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 with =A0the =A0given =A0settings or if usi=
ng more threads would exceed<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 the memory usage limit.<br>
&gt;<br>
&gt; -------------------<br>
&gt;<br>
&gt; Memory: 7.8 GiB<br>
&gt; Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4<br>
&gt;<br>
&gt; File to compress: 1.9G<br>
&gt;<br>
&gt; xz -f -k -e -9 --check=3Dcrc32 (current configuration)<br>
&gt; Memory: 673Mb<br>
&gt; real =A0 =A06m37.170s<br>
&gt; user =A0 =A06m35.389s<br>
&gt; sys =A0 =A0 0m0.884s<br>
&gt; Compressed file size: 3.4Mb<br>
&gt;<br>
&gt; xz -f -k -e -9 -T 4 --check=3Dcrc32<br>
&gt; Memory: Cannot allocate memory<br>
&gt;<br>
&gt; xz -f -k -e -8 -T 4 --check=3Dcrc32<br>
&gt; Memory: 1.8G<br>
&gt; real =A0 =A03m24.462s<br>
&gt; user =A0 =A012m8.502s<br>
&gt; sys =A0 =A0 0m2.180s<br>
&gt; Compressed file size: 3.4Mb<br>
&gt;<br>
&gt; xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)<br>
&gt; Memory: 471Mb<br>
&gt; real =A0 =A01m9.265s<br>
&gt; user =A0 =A04m8.972s<br>
&gt; sys =A0 =A0 0m0.944s<br>
&gt; Compressed file size: 3.4Mb<br>
&gt;<br>
&gt; So my conclusion would be to use the default -e -6 with -T 4.<br>
<br>
</div></div>Out of curiousity, what does -T0 give you?<br><br></blockquote>=
<div>=A0</div><div>Exactly the same as -T 0.=A0</div><div><br></div><div>@g=
</div></div><br>

--e89a8f2357fdbaad1a04c4a3f2eb--
