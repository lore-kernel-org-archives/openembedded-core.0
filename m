Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoKol-0002hx-Cq
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:44:27 +0200
Received: by ggnp4 with SMTP id p4so9830279ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=HXzRmCyaPqBrBveDw60hU+xCDspBywP1xoO15FMD0dc=;
	b=iWSDoTCPglk0tB69TRAAWW1Vx846WFciC0DANCH5icdl/bkzXPP22NCiKFq8SZQCw0
	sbkw/5JY9iiEJAtiymfJ0T7iMxY7v3gqrDrNnvq6bAT0ZSxN1afAgZQ9IpYSLFx91yVB
	NMx/AAwY7hi9sIEjQpcZbu1VpJMOBmBtYEwSf1/Mjitmlc45iZxwjt/YLOW+6IhWXNwh
	qmHR5/2AEuJbrzWhgPmP3sMCc9k1GCkxyzd7cN89J7ZbWEAjRKgcMPmam8Pn/lI227Sg
	n76jAQETIkKTHiBw3ij+HiK94yrF6nVr7l1hGoHnpFPcTNs5zMDnAj6kL6sWKuNHOeLl
	K5RQ==
Received: by 10.50.160.198 with SMTP id xm6mr9705600igb.0.1341865997167; Mon,
	09 Jul 2012 13:33:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 13:32:56 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <alpine.DEB.2.02.1207091224240.1542@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
	<CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
	<alpine.DEB.2.02.1207091120520.1353@oneiric>
	<1803032.sCdKSRoOHk@helios>
	<alpine.DEB.2.02.1207091224240.1542@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 23:32:56 +0300
Message-ID: <CAK18fxHyF2i8j-uoz7CVMGGNj3n21LUJpvkZ7kgbfGt+xeb4MQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm4k0zjbb85zIoo/31YrVRI2K2VcoFgAjRRe7eVg5VOBpPp6cJpIMg5x5YE7Bpqc5R3BFky
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Mon, 09 Jul 2012 20:44:27 -0000
Content-Type: multipart/alternative; boundary=14dae934103d18ebcb04c46b86b6

--14dae934103d18ebcb04c46b86b6
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 9, 2012 at 7:25 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Mon, 9 Jul 2012, Paul Eggleton wrote:
>
> > On Monday 09 July 2012 11:24:27 Robert P. J. Day wrote:
> > > On Mon, 9 Jul 2012, Andrei Gherzan wrote:
> > > > So IMHO the EXTRA_IMAGE_FEATURES variable in the image should be
> > > > merged in the IMAGE_FEATURES above. I don't see the meaning of it.
> > >
> > >   yup, that was precisely the point i was making.  so given the
> > > potential for confusion, what should be the "best practise" here?
> > > based on my sketchy understanding, it seems the proper approach would
> > > be to let recipe files use IMAGE_FEATURES exclusively, while
> > > specifically reserving EXTRA_IMAGE_FEATURES for the developer's
> > > local.conf file, and avoid the current unpleasant mixing.
> >
> > Sounds like a good idea to me.
>
>   i'll send in a patch that does that, especially since
> local.conf.sample specifically instructs the developer to use
> EXTRA_IMAGE_FEATURES.   patch coming shortly.
>
>
Good.

@g

--14dae934103d18ebcb04c46b86b6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Jul 9, 2012 at 7:25 PM, Robert P. J. Day=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_=
blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<div class=3D"im">On Mon, 9 Jul 2012, Paul Eggleton wrote:<br>
<br>
&gt; On Monday 09 July 2012 11:24:27 Robert P. J. Day wrote:<br>
&gt; &gt; On Mon, 9 Jul 2012, Andrei Gherzan wrote:<br>
&gt; &gt; &gt; So IMHO the EXTRA_IMAGE_FEATURES variable in the image shoul=
d be<br>
&gt; &gt; &gt; merged in the IMAGE_FEATURES above. I don&#39;t see the mean=
ing of it.<br>
&gt; &gt;<br>
&gt; &gt; =A0 yup, that was precisely the point i was making. =A0so given t=
he<br>
&gt; &gt; potential for confusion, what should be the &quot;best practise&q=
uot; here?<br>
&gt; &gt; based on my sketchy understanding, it seems the proper approach w=
ould<br>
&gt; &gt; be to let recipe files use IMAGE_FEATURES exclusively, while<br>
&gt; &gt; specifically reserving EXTRA_IMAGE_FEATURES for the developer&#39=
;s<br>
&gt; &gt; local.conf file, and avoid the current unpleasant mixing.<br>
&gt;<br>
&gt; Sounds like a good idea to me.<br>
<br>
</div>=A0 i&#39;ll send in a patch that does that, especially since<br>
local.conf.sample specifically instructs the developer to use<br>
EXTRA_IMAGE_FEATURES. =A0 patch coming shortly.<br>
<div class=3D"im HOEnZb"><br></div></blockquote><div>=A0</div><div>Good.=A0=
</div><div><br></div><div>@g</div></div>

--14dae934103d18ebcb04c46b86b6--
