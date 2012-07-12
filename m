Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpMIc-0001e6-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 18:31:31 +0200
Received: by ggnp4 with SMTP id p4so2418795ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 09:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=HSXndClHhYSovBoD/haHY/a7f6gPbmceR4rkud3QgHQ=;
	b=kukha5Yrl0KF8A1XiwmBgkk9e6U/46cgVwc8UBBk0pd0KUdlAbuvggB02R7xo7FwUf
	/HnuKgHganziTSvEvcOVTlHuym3RRNMVAkuv6I4Z55XyOX2r/C5dFnEUsMvFzYSc959s
	/pBdVcNSDOBSBf+ZZnWPTPPFWnm5/vBZVSqj+eU0xoAVwDRY9wvbD1UQks25PR70CC3x
	AouZV9n4iyX9/UkM5PKVrPXf+Dh6AF6eko2VTKP35fxem8VJT4P3j+5hnnuH3uP9XFGs
	O/8u4kFnvDh7vsswJr2r3jMTdNHZwTFpLprmS4ClEGnx327HikVjIlSto8BjAB+45MrB
	9WwA==
Received: by 10.50.87.138 with SMTP id ay10mr18033733igb.43.1342110016947;
	Thu, 12 Jul 2012 09:20:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Thu, 12 Jul 2012 09:19:56 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <06E3CF4C-6484-43DA-94A5-6BA6EC8D51B4@dominion.thruhere.net>
References: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
	<A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
	<CAK18fxHimz3FTZ9AuTF2ORz=JSgmU51ZAMgDk+2fwo4reA2GoQ@mail.gmail.com>
	<06E3CF4C-6484-43DA-94A5-6BA6EC8D51B4@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 19:19:56 +0300
Message-ID: <CAK18fxFLziad1US2HgXuH52uhCyVvYGCe+o6uV9JxvN8-+VwLw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlnAafz467qsu48VNAd/AmpSvctBj3lx6yHMSE8xdwE0rcc7q58jzP7rjB8LlhLBAmotO3r
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
X-List-Received-Date: Thu, 12 Jul 2012 16:31:31 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba673cf475504c4a45694

--e89a8f3ba673cf475504c4a45694
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 7:19 PM, Koen Kooi <koen@dominion.thruhere.net>wrot=
e:

>
> Op 12 jul. 2012, om 17:51 heeft Andrei Gherzan het volgende geschreven:
>
> > On Thu, Jul 12, 2012 at 6:40 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> >
> > Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan <andrei@gherzan.ro> het
> volgende geschreven:
> >
> > > Hello,
> > >
> > > Koen suggested to add -T to xz commands. We have this option
> implemented in our current version .1alpha.
> > >
> > > -T threads, --threads=3Dthreads
> > >               Specify the number of worker threads to use.  Setting
> threads to
> > >               a special value 0 makes xz use as many threads as there
> are  CPU
> > >               cores  on  the system.  The actual number of threads ca=
n
> be less
> > >               than threads if the input file is not big enough  for
>  threading
> > >               with  the  given  settings or if using more threads
> would exceed
> > >               the memory usage limit.
> > >
> > > -------------------
> > >
> > > Memory: 7.8 GiB
> > > Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
> > >
> > > File to compress: 1.9G
> > >
> > > xz -f -k -e -9 --check=3Dcrc32 (current configuration)
> > > Memory: 673Mb
> > > real    6m37.170s
> > > user    6m35.389s
> > > sys     0m0.884s
> > > Compressed file size: 3.4Mb
> > >
> > > xz -f -k -e -9 -T 4 --check=3Dcrc32
> > > Memory: Cannot allocate memory
> > >
> > > xz -f -k -e -8 -T 4 --check=3Dcrc32
> > > Memory: 1.8G
> > > real    3m24.462s
> > > user    12m8.502s
> > > sys     0m2.180s
> > > Compressed file size: 3.4Mb
> > >
> > > xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
> > > Memory: 471Mb
> > > real    1m9.265s
> > > user    4m8.972s
> > > sys     0m0.944s
> > > Compressed file size: 3.4Mb
> > >
> > > So my conclusion would be to use the default -e -6 with -T 4.
> >
> > Out of curiousity, what does -T0 give you?
> >
> >
> > Exactly the same as -T 0.
>
> I don't see that in the results above :)


Sorry. Wanted to type -T 4. :)

--e89a8f3ba673cf475504c4a45694
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 12, 2012 at 7:19 PM, Koen Kooi <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_b=
lank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
Op 12 jul. 2012, om 17:51 heeft Andrei Gherzan het volgende geschreven:<br>
<div><div class=3D"h5"><br>
&gt; On Thu, Jul 12, 2012 at 6:40 PM, Koen Kooi &lt;<a href=3D"mailto:koen@=
dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan &lt;<a href=3D"mailto:an=
drei@gherzan.ro">andrei@gherzan.ro</a>&gt; het volgende geschreven:<br>
&gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Koen suggested to add -T to xz commands. We have this option impl=
emented in our current version .1alpha.<br>
&gt; &gt;<br>
&gt; &gt; -T threads, --threads=3Dthreads<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 Specify the number of worker threads =
to use. =A0Setting threads to<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 a special value 0 makes xz use as man=
y threads as there are =A0CPU<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cores =A0on =A0the system. =A0The act=
ual number of threads can be less<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 than threads if the input file is not=
 big enough =A0for =A0threading<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 with =A0the =A0given =A0settings or i=
f using more threads would exceed<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 the memory usage limit.<br>
&gt; &gt;<br>
&gt; &gt; -------------------<br>
&gt; &gt;<br>
&gt; &gt; Memory: 7.8 GiB<br>
&gt; &gt; Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4<br>
&gt; &gt;<br>
&gt; &gt; File to compress: 1.9G<br>
&gt; &gt;<br>
&gt; &gt; xz -f -k -e -9 --check=3Dcrc32 (current configuration)<br>
&gt; &gt; Memory: 673Mb<br>
&gt; &gt; real =A0 =A06m37.170s<br>
&gt; &gt; user =A0 =A06m35.389s<br>
&gt; &gt; sys =A0 =A0 0m0.884s<br>
&gt; &gt; Compressed file size: 3.4Mb<br>
&gt; &gt;<br>
&gt; &gt; xz -f -k -e -9 -T 4 --check=3Dcrc32<br>
&gt; &gt; Memory: Cannot allocate memory<br>
&gt; &gt;<br>
&gt; &gt; xz -f -k -e -8 -T 4 --check=3Dcrc32<br>
&gt; &gt; Memory: 1.8G<br>
&gt; &gt; real =A0 =A03m24.462s<br>
&gt; &gt; user =A0 =A012m8.502s<br>
&gt; &gt; sys =A0 =A0 0m2.180s<br>
&gt; &gt; Compressed file size: 3.4Mb<br>
&gt; &gt;<br>
&gt; &gt; xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)<br>
&gt; &gt; Memory: 471Mb<br>
&gt; &gt; real =A0 =A01m9.265s<br>
&gt; &gt; user =A0 =A04m8.972s<br>
&gt; &gt; sys =A0 =A0 0m0.944s<br>
&gt; &gt; Compressed file size: 3.4Mb<br>
&gt; &gt;<br>
&gt; &gt; So my conclusion would be to use the default -e -6 with -T 4.<br>
&gt;<br>
&gt; Out of curiousity, what does -T0 give you?<br>
&gt;<br>
&gt;<br>
&gt; Exactly the same as -T 0.<br>
<br>
</div></div>I don&#39;t see that in the results above :)</blockquote></div>=
<br><div>Sorry. Wanted to type -T 4. :)</div>

--e89a8f3ba673cf475504c4a45694--
