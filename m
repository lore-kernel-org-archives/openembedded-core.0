Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RybXo-0005wI-2q
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Feb 2012 05:05:08 +0100
Received: by vbbff1 with SMTP id ff1so3020043vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 19:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.108.70 as permitted sender) client-ip=10.220.108.70; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.108.70 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.108.70])
	by 10.220.108.70 with SMTP id e6mr6990585vcp.74.1329537412968 (num_hops
	= 1); Fri, 17 Feb 2012 19:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=23XjGMHHiQmdkqEza8vA8gvtW49WlRnHHE6cUi3oN40=;
	b=XnMO8BIaYiBkT2hsOj0z018sFJ4pVQfEsf9sg5EKcZsX9kKBP0oFEHiW3BHPPxs52h
	7yVOLT8jLD2DjQdzSZ4XTJsjrLBIeLOKd0k0+/KylrcIgQQV//nsq5HHMViTYD8GhMSE
	68qSGcY5v0FThLBUtw0oXqIP8vZMJ/zGXsXIU=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr5622567vcp.74.1329537412901; Fri,
	17 Feb 2012 19:56:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 19:56:52 -0800 (PST)
In-Reply-To: <1329510550.2591.122.camel@x121e.pbcl.net>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
	<1329506739.2591.114.camel@x121e.pbcl.net>
	<CAP9ODKq5jiun+bcQZeR2d9Dx2gJM3v=eu2N2WiCuwTb7sb4A-A@mail.gmail.com>
	<1329508773.2591.116.camel@x121e.pbcl.net>
	<CAP9ODKq7u3Vg+YU8GDMQH3vBw_GPH-Wuq9C7fa=DnEuUo0mr1A@mail.gmail.com>
	<1329509501.2591.118.camel@x121e.pbcl.net>
	<CAP9ODKqgFVA5K6DQG-hZXww+fiFX+H4hGcqfWjn691ng3jgGVA@mail.gmail.com>
	<1329510550.2591.122.camel@x121e.pbcl.net>
Date: Sat, 18 Feb 2012 01:56:52 -0200
X-Google-Sender-Auth: dmNxJoA859zwPnyS0f_5kD2jLiQ
Message-ID: <CAP9ODKqzR1RBD2u4goHUS8dAV04LDHtreivvNOdw+twU7as2Og@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Sat, 18 Feb 2012 04:05:08 -0000
Content-Type: multipart/alternative; boundary=f46d043748cb3629eb04b9350d2a

--f46d043748cb3629eb04b9350d2a
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 18:29, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2012-02-17 at 18:14 -0200, Otavio Salvador wrote:
> > On Fri, Feb 17, 2012 at 18:11, Phil Blundell <philb@gnu.org> wrote:
> >         We seem to be going in circles here but, to go back to what I
> >         said at
> >         the beginning, why can't you use the existing run-postinsts
> >         recipe
> >         rather than adding a new script?
> >
> >
> > My image didn't end with it installed. I did a very small image and I
> > expect that independently of what I choose, rootfs behave right.
>
> Ah, I see.  Yes, that's a fair point.  Maybe rootfs_ipk itself should
> inject ${ROOTFS_PKGMANAGE_BOOTSTRAP} into the image if it notices that
> there are postinsts which require running and no other package manager
> is installed.  I think it would be better not to have multiple scripts
> doing the same thing if we can avoid it, otherwise you end up having to
> fix things like ordering issues in all of them independently.


Not easy to do because it might not have been built before.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d043748cb3629eb04b9350d2a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 17, 2012 at 18:29, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Fri, 2012-02-17 at 18:14 -0200, Otavio Salvador wrote:=
<br>
&gt; On Fri, Feb 17, 2012 at 18:11, Phil Blundell &lt;<a href=3D"mailto:phi=
lb@gnu.org">philb@gnu.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 We seem to be going in circles here but, to go back to=
 what I<br>
&gt; =A0 =A0 =A0 =A0 said at<br>
&gt; =A0 =A0 =A0 =A0 the beginning, why can&#39;t you use the existing run-=
postinsts<br>
&gt; =A0 =A0 =A0 =A0 recipe<br>
&gt; =A0 =A0 =A0 =A0 rather than adding a new script?<br>
&gt;<br>
&gt;<br>
&gt; My image didn&#39;t end with it installed. I did a very small image an=
d I<br>
&gt; expect that independently of what I choose, rootfs behave right.<br>
<br>
</div>Ah, I see. =A0Yes, that&#39;s a fair point. =A0Maybe rootfs_ipk itsel=
f should<br>
inject ${ROOTFS_PKGMANAGE_BOOTSTRAP} into the image if it notices that<br>
there are postinsts which require running and no other package manager<br>
is installed. =A0I think it would be better not to have multiple scripts<br=
>
doing the same thing if we can avoid it, otherwise you end up having to<br>
fix things like ordering issues in all of them independently.</blockquote><=
div><br></div><div>Not easy to do because it might not have been built befo=
re.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--f46d043748cb3629eb04b9350d2a--
