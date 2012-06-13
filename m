Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sepa6-0005BM-JP
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 17:34:02 +0200
Received: by ghbz2 with SMTP id z2so458313ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IK/e7f7TFsoAGmICEv8Qxigxp/G/+dzjNCm+MMzWW2A=;
	b=zkw0oGSzSrNM/nFMv6ASOrKvaK0gPFMo95Bk6IWbJRbUUANTJC6UUkd1VPuceViTyd
	+qCD1Td6B25dcDlO2yAuQ8W0XyR+c9JaistpVWbxTfzG2mxACEGx8rnxkewDTy9iiYQG
	a9Bvv7euPag12Gyb5skGIYC9ikdAg6YX25MpQCBZPFJ4VXt6hb3/AeNPHbDG/Arm3DO4
	s/qJj7H1RaWizcLwCUcRwu0SwHkU9nhBMAsfXFS9B5HFfdIB7yeofs247XRQBd1UoH1Z
	AZU9x6tMLrg0+7SwYL7lPyK+fY/YDXBRJwMNitV7sR9iW9oHo8uibHobXmd/XwG+ExuB
	9iwg==
MIME-Version: 1.0
Received: by 10.50.47.166 with SMTP id e6mr10886318ign.55.1339601005949; Wed,
	13 Jun 2012 08:23:25 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 13 Jun 2012 08:23:25 -0700 (PDT)
In-Reply-To: <CAMKF1spLk2Tc3F_SQMxci8YubBBij1_pYmX0pEBYBtjqEwBrYw@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
	<4FD78DDA.5010907@windriver.com>
	<CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
	<CAMKF1so9J5noXwZuyVMbTQHrcvbFtmPFg83e6=OHzyS_7BF-dQ@mail.gmail.com>
	<CAOHjBZs9DQP=uHuh7BE=gA9rHRQ=T7Lh+EV86VASBDGq_oScbA@mail.gmail.com>
	<CAMKF1spLk2Tc3F_SQMxci8YubBBij1_pYmX0pEBYBtjqEwBrYw@mail.gmail.com>
Date: Wed, 13 Jun 2012 17:23:25 +0200
Message-ID: <CAOHjBZu_4bbtug8Dy9hFd0gnu85kzAWhMcWsuoObwFnQKY1o6g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
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
X-List-Received-Date: Wed, 13 Jun 2012 15:34:02 -0000
Content-Type: multipart/alternative; boundary=14dae934080719b3b304c25c2abb

--14dae934080719b3b304c25c2abb
Content-Type: text/plain; charset=ISO-8859-1

I confirm the USE_DEVFS is set to zero by default.
I'll investigate for a solution, thanks.

Giuseppe

2012/6/13 Khem Raj <raj.khem@gmail.com>

> On Wed, Jun 13, 2012 at 7:48 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Solved right now!
> > I was forced to re-run the oe-init-build-dev script, maybe something was
> > broken and
> > restarting by scratch solved the issue.
> >
> > Just another question. I have appended to core-image-minimal the
> > IMAGE_DEVICE_TABLES
> > to point to an own .txt file containing the devices to create for the
> image
> > (as well as I did in old oe-classic).
> > After the build, looking at the rootfs of the core-image-minimal
> directory I
> > see the /dev empyt and also the
> > log.do_rootfs reports that "min. I/O units was not specified".
> > Any differencies against the old implementation?
>
>
> Dont think so. Do you use USE_DEVFS set to 1 ? if not then it should
> have worked.
>
> >
> > Many thanks Khem,
> > Giuseppe
> >
> > 2012/6/13 Khem Raj <raj.khem@gmail.com>
> >>
> >> On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli
> >> <giuseppe.condorelli@gmail.com> wrote:
> >> > Hi Khem, Mark,
> >> >
> >> > I've not changed the location of the local repository since it was
> >> > created
> >> > months ago.
> >> > This problem appeared yesterday and I cannot find a why.
> >>
> >> can you bisect and see if its some patch in OE or bitbake ?
> >>
> >> > For information, I'm on a FC14 host machine and the repository is on a
> >> > physical hdd and not
> >> > mounted from NFS for example.
> >> >
> >> > Cheers,
> >> > Giuseppe
> >> >
> >> >
> >> >
> >> > 2012/6/12 Mark Hatle <mark.hatle@windriver.com>
> >> >>
> >> >> On 6/12/12 8:57 AM, Khem Raj wrote:
> >> >>>
> >> >>> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
> >> >>> <giuseppe.condorelli@gmail.com>  wrote:
> >> >>>>
> >> >>>> OSError: [Errno 1] Operation not permitted:
> >> >>>>
> >> >>>>
> >> >>>>
> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
> >> >>>
> >> >>>
> >> >>> what is your host machine ? did you also update bitbake ?
> >> >>
> >> >>
> >> >> It also could be the filesystem.  What filesystem type are you using?
> >> >>  (on
> >> >> the host system...)  If you are using something like fat32, you may
> run
> >> >> into
> >> >> problems like this because it does not have the ability to change
> >> >> permissions and modes.. since the underlying filesystem does not
> >> >> support
> >> >> them.
> >> >>
> >> >> --Mark
> >> >>
> >> >>
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >> >
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >> >
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae934080719b3b304c25c2abb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I confirm the USE_DEVFS is=A0set to zero by default.</div><div>I&#39;l=
l investigate for a solution, thanks.</div><div>=A0</div><div>Giuseppe<br><=
br></div><div class=3D"gmail_quote">2012/6/13 Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Wed, Jun 13, 2012 at 7:48 AM, Giusepp=
e Condorelli<br>

&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Solved right now!<br>
&gt; I was forced to re-run the oe-init-build-dev script, maybe something w=
as<br>
&gt; broken and<br>
&gt; restarting by scratch solved the issue.<br>
&gt;<br>
&gt; Just another question. I have appended to core-image-minimal the<br>
&gt; IMAGE_DEVICE_TABLES<br>
&gt; to point to an own .txt file containing the devices to create for the =
image<br>
&gt; (as well as I did in old oe-classic).<br>
&gt; After the build, looking at the rootfs of the core-image-minimal direc=
tory I<br>
&gt; see the /dev empyt and also the<br>
&gt; log.do_rootfs reports that &quot;min. I/O units was not specified&quot=
;.<br>
&gt; Any differencies against the old implementation?<br>
<br>
<br>
</div>Dont think so. Do you use USE_DEVFS set to 1 ? if not then it should<=
br>
have worked.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Many thanks Khem,<br>
&gt; Giuseppe<br>
&gt;<br>
&gt; 2012/6/13 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli<br>
&gt;&gt; &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.cond=
orelli@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi Khem, Mark,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;ve not changed the location of the local repository sin=
ce it was<br>
&gt;&gt; &gt; created<br>
&gt;&gt; &gt; months ago.<br>
&gt;&gt; &gt; This problem appeared yesterday and I cannot find a why.<br>
&gt;&gt;<br>
&gt;&gt; can you bisect and see if its some patch in OE or bitbake ?<br>
&gt;&gt;<br>
&gt;&gt; &gt; For information, I&#39;m on a FC14 host machine and the repos=
itory is on a<br>
&gt;&gt; &gt; physical hdd and not<br>
&gt;&gt; &gt; mounted from NFS for example.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt; Giuseppe<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 2012/6/12 Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriv=
er.com">mark.hatle@windriver.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 6/12/12 8:57 AM, Khem Raj wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli<=
br>
&gt;&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">=
giuseppe.condorelli@gmail.com</a>&gt; =A0wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; OSError: [Errno 1] Operation not permitted:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &#39;/oelinux/condorg/openembedded-core/stlinux-3=
.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/p=
ackage/usr&#39;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; what is your host machine ? did you also update bitba=
ke ?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It also could be the filesystem. =A0What filesystem type =
are you using?<br>
&gt;&gt; &gt;&gt; =A0(on<br>
&gt;&gt; &gt;&gt; the host system...) =A0If you are using something like fa=
t32, you may run<br>
&gt;&gt; &gt;&gt; into<br>
&gt;&gt; &gt;&gt; problems like this because it does not have the ability t=
o change<br>
&gt;&gt; &gt;&gt; permissions and modes.. since the underlying filesystem d=
oes not<br>
&gt;&gt; &gt;&gt; support<br>
&gt;&gt; &gt;&gt; them.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --Mark<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/lis=
tinfo/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/m=
ailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailma=
n/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae934080719b3b304c25c2abb--
