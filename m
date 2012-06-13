Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sep2Y-0003U9-Q1
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:59:23 +0200
Received: by ghbz2 with SMTP id z2so419426ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6uTAH3yQE4/PiG5NQbYwRF9D5TrZ5cE7z8oRzs+z9K4=;
	b=IPcX+unj2d6qGs9Rq3QaUsjLsBk5dLn1ZgDv4iLfd0HE1H8xlaznKBwr0ocQCFPtGy
	qUY1BRJzAfj+EgYotQ5AaN+VDCyR7bIeuDWaXQ6qFP9rrOccF/ZHjX6lOIKlX+vMtL7g
	HG3ND2us56RAoM0jw+28qj/8aHpEhWprZ5fzSfU1mlMr2NW0zjiTBIvtvC50leAuT9H6
	k5qal4Nx3jD66rOxqoTY6UDoIbY19iK1Kk/j8c7+mT7TP3RB3V9UPHl34ArIcYcZz9CR
	vy7CYRiIc6ARhQRXZdl/4Tu4+LIt1WB3tz0QiUJfL6heIqFK4NZjfyg0iSDZiC8MErsx
	1w4Q==
MIME-Version: 1.0
Received: by 10.50.187.201 with SMTP id fu9mr10962354igc.5.1339598925908; Wed,
	13 Jun 2012 07:48:45 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 13 Jun 2012 07:48:45 -0700 (PDT)
In-Reply-To: <CAMKF1so9J5noXwZuyVMbTQHrcvbFtmPFg83e6=OHzyS_7BF-dQ@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
	<4FD78DDA.5010907@windriver.com>
	<CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
	<CAMKF1so9J5noXwZuyVMbTQHrcvbFtmPFg83e6=OHzyS_7BF-dQ@mail.gmail.com>
Date: Wed, 13 Jun 2012 16:48:45 +0200
Message-ID: <CAOHjBZs9DQP=uHuh7BE=gA9rHRQ=T7Lh+EV86VASBDGq_oScbA@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jun 2012 14:59:23 -0000
Content-Type: multipart/alternative; boundary=14dae9340a6f1ecb6804c25baed0

--14dae9340a6f1ecb6804c25baed0
Content-Type: text/plain; charset=ISO-8859-1

Solved right now!
I was forced to re-run the oe-init-build-dev script, maybe something was
broken and
restarting by scratch solved the issue.

Just another question. I have appended to core-image-minimal the
IMAGE_DEVICE_TABLES
to point to an own .txt file containing the devices to create for the image
(as well as I did in old oe-classic).
After the build, looking at the rootfs of the core-image-minimal directory
I see the /dev empyt and also the
log.do_rootfs reports that "min. I/O units was not specified".
Any differencies against the old implementation?

Many thanks Khem,
Giuseppe

2012/6/13 Khem Raj <raj.khem@gmail.com>

> On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Hi Khem, Mark,
> >
> > I've not changed the location of the local repository since it was
> created
> > months ago.
> > This problem appeared yesterday and I cannot find a why.
>
> can you bisect and see if its some patch in OE or bitbake ?
>
> > For information, I'm on a FC14 host machine and the repository is on a
> > physical hdd and not
> > mounted from NFS for example.
> >
> > Cheers,
> > Giuseppe
> >
> >
> >
> > 2012/6/12 Mark Hatle <mark.hatle@windriver.com>
> >>
> >> On 6/12/12 8:57 AM, Khem Raj wrote:
> >>>
> >>> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
> >>> <giuseppe.condorelli@gmail.com>  wrote:
> >>>>
> >>>> OSError: [Errno 1] Operation not permitted:
> >>>>
> >>>>
> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
> >>>
> >>>
> >>> what is your host machine ? did you also update bitbake ?
> >>
> >>
> >> It also could be the filesystem.  What filesystem type are you using?
>  (on
> >> the host system...)  If you are using something like fat32, you may run
> into
> >> problems like this because it does not have the ability to change
> >> permissions and modes.. since the underlying filesystem does not support
> >> them.
> >>
> >> --Mark
> >>
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

--14dae9340a6f1ecb6804c25baed0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Solved right now!</div><div>I was forced to re-run the oe-init-build-d=
ev script, maybe something was broken and</div><div>restarting by scratch s=
olved the issue.</div><div>=A0</div><div>Just another question. I have appe=
nded to core-image-minimal the IMAGE_DEVICE_TABLES</div>
<div>to point to an own .txt file containing the devices to create for the =
image (as well as I did in old oe-classic).</div><div>After the build, look=
ing at the rootfs of the core-image-minimal directory I see the /dev empyt =
and also the</div>
<div>log.do_rootfs reports that &quot;min. I/O units was not specified&quot=
;.</div><div>Any differencies against the old implementation?</div><div>=A0=
</div><div>Many thanks Khem,</div><div>Giuseppe<br><br></div><div class=3D"=
gmail_quote">
2012/6/13 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span><br><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,20=
4,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quote"=
>
<div class=3D"im">On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Hi Khem, Mark,<br>
&gt;<br>
&gt; I&#39;ve not changed the location of the local repository since it was=
 created<br>
&gt; months ago.<br>
&gt; This problem appeared yesterday and I cannot find a why.<br>
<br>
</div>can you bisect and see if its some patch in OE or bitbake ?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; For information, I&#39;m on a FC14 host machine and the repository is =
on a<br>
&gt; physical hdd and not<br>
&gt; mounted from NFS for example.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Giuseppe<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; 2012/6/12 Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 6/12/12 8:57 AM, Khem Raj wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.=
condorelli@gmail.com</a>&gt; =A0wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; OSError: [Errno 1] Operation not permitted:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &#39;/oelinux/condorg/openembedded-core/stlinux-3.0-build/=
tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/us=
r&#39;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; what is your host machine ? did you also update bitbake ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; It also could be the filesystem. =A0What filesystem type are you u=
sing? =A0(on<br>
&gt;&gt; the host system...) =A0If you are using something like fat32, you =
may run into<br>
&gt;&gt; problems like this because it does not have the ability to change<=
br>
&gt;&gt; permissions and modes.. since the underlying filesystem does not s=
upport<br>
&gt;&gt; them.<br>
&gt;&gt;<br>
&gt;&gt; --Mark<br>
&gt;&gt;<br>
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

--14dae9340a6f1ecb6804c25baed0--
