Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id AB83A6078E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 15:11:33 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id v84so90278134oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KhaPk8B0Z4OUkqGgvo6pjY82AZo2QUMhM/TeB2Q82Ho=;
	b=jJ87z/ml3fPQQ6JdSXY6MOMVIIXG1MK4z3Lu1dmFOyuAtPFULNQk7Xu4PYP1BawRgq
	ZOVTqXfwWgTZ36Ropwra/qDEQD2dz6TgONmQX62aWOFeu+vx6Pfct5n2/2FVW9YcHfCR
	htM3IHeQ5KSCetaOevwpeexZXsZlEYyuOFNft0VlEQgNZMFKr/bHy+Xelbm3JCYgZdiH
	lvtNxmlJDLQV+DGgx3rbAMHgBFdHjWLqLgsEge9NwsXaVJet36SuPxWn7Mnw8ePaf/+g
	cUyTsMp4fx9hxonpSsnO58fNPlOVdAnoGzdVuAo/uujIfKHNE1pMBVDHsfJpK9ihQDV6
	fRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KhaPk8B0Z4OUkqGgvo6pjY82AZo2QUMhM/TeB2Q82Ho=;
	b=g7OFi6io80fYX6nH8skgKnup4ZEigKYcBJoNRnMH2n0KFmKlhIq9F+I2JTQavkgZI9
	L1WXxll5k8L1xq2NLIQexQkXubR5PM3ImTDqCBkLImEa3cckBrHChHGexTF6noF3Oh0r
	KE+/W/uLkUF34J2JAqfyoy+Zm+YqCytPVf5bpHt1DU0lVYuR+pWC3n34gcvhNgx1gVWx
	8DQzo1yP/mHM8USQPr7RmpOEHSQFusKHQfzgAcaj7QisF7PFPDC6gb5wc6Uj4fbT+NpA
	3w25strIXBygIEKEDtOAXdEVjMCcfI+cGCZsplQQt+aljaaM6Gtmow1OQjK5spDCEOyZ
	SxkA==
X-Gm-Message-State: AKaTC01YWua4SYqQ8ss9X/fZd4I1F01zb5mypdDA38w5Lr/YgPRn+8OlhFASh7HRavjaQZMe1AnwmKCZFEsGIQ==
X-Received: by 10.157.17.174 with SMTP id v43mr48399711otf.251.1481555495445; 
	Mon, 12 Dec 2016 07:11:35 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Mon, 12 Dec 2016 07:11:15 -0800 (PST)
In-Reply-To: <20161212105853.GA21809@linux.intel.com>
References: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
	<CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
	<20161212105853.GA21809@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 12 Dec 2016 08:11:15 -0700
X-Google-Sender-Auth: 5a-fH9jjT7kupfpkjzgi_rqGmgE
Message-ID: <CABcZANkuDeLUAX5u993W=7b9LMEVW0nTNc=ahmB_YZZgsCg=+A@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] edgerouter.conf: enable generation of wic.bmap
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 15:11:35 -0000
Content-Type: multipart/alternative; boundary=94eb2c18fcd4056a86054377858c

--94eb2c18fcd4056a86054377858c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 3:58 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Sat, Dec 10, 2016 at 11:40:38AM -0700, Christopher Larson wrote:
> > On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com=
>
> > wrote:
> >
> > > Enabled generation of block map(bmap) files for wic images
> > > built for edgerouter machine. This should simplify flashing
> > > images with bmaptool.
> > >
> > > [YOCTO #10621]
> > >
> > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > >
> >
> > I think this is more of a distro decision than machine, whether they wa=
nt
> > to support use of bmaptool for their users/customers. It=E2=80=99d be n=
ice if it
> > was easier to control compression from the distro, too. For example, if
> we
> > want to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be =
nice to be
> > able to switch to that for all machines that use wic. I=E2=80=99m not s=
ure how
> best
> > to pull that off, however. Something to think about for the future.
>
> Thanks for pointing out to it. I did it this way for two reasons:
> - IMAGE_FSTYPES was already modified in edgerouter.conf
> - I wanted to enable generation of wic.bmap for subset of machines, i.e.
>   only for hardware reference BSPs mentioned in README.hardware
>

That=E2=80=99s a fair point. As khem indicated, this is a bit of an interse=
ction
between distro and machine, hardware capabilities and distro policy. I
expect this is fine as is, but something to consider improving going
forward. I=E2=80=99m not certain a distro/machine feature makes sense for s=
omething
like this, but perhaps something else might.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18fcd4056a86054377858c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 12, 2016 at 3:58 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Sat, Dec 10, 2016 at 11:40:38AM -0700, Christopher Larson wrote=
:<br>
&gt; On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh &lt;<a href=3D"mailto:ed.b=
artosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; Enabled generation of block map(bmap) files for wic images<br>
&gt; &gt; built for edgerouter machine. This should simplify flashing<br>
&gt; &gt; images with bmaptool.<br>
&gt; &gt;<br>
&gt; &gt; [YOCTO #10621]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.=
intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; I think this is more of a distro decision than machine, whether they w=
ant<br>
&gt; to support use of bmaptool for their users/customers. It=E2=80=99d be =
nice if it<br>
&gt; was easier to control compression from the distro, too. For example, i=
f we<br>
&gt; want to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be=
 nice to be<br>
&gt; able to switch to that for all machines that use wic. I=E2=80=99m not =
sure how best<br>
&gt; to pull that off, however. Something to think about for the future.<br=
>
<br>
</span>Thanks for pointing out to it. I did it this way for two reasons:<br=
>
- IMAGE_FSTYPES was already modified in edgerouter.conf<br>
- I wanted to enable generation of wic.bmap for subset of machines, i.e.<br=
>
=C2=A0 only for hardware reference BSPs mentioned in README.hardware<br></b=
lockquote><div><br></div><div>That=E2=80=99s a fair point. As khem indicate=
d, this is a bit of an intersection between distro and machine, hardware ca=
pabilities and distro policy. I expect this is fine as is, but something to=
 consider improving going forward. I=E2=80=99m not certain a distro/machine=
 feature makes sense for something like this, but perhaps something else mi=
ght.</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder -=
 BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software=
 Engineer, Mentor Graphics</div>
</div></div>

--94eb2c18fcd4056a86054377858c--
