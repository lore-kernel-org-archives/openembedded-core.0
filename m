Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QUhIx-0002fB-R7
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:37:55 +0200
Received: by gxk3 with SMTP id 3so37827gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=S6MvcltenMJqeSBL2Qph1VgcBX/d/h24wFmtCukduj0=;
	b=Q1GAuzLOUYH+BNpf/0ojazC6XG6+DRpzjY+9uLotGCipi/a9N/aR/DA/Rbf6YaCCbL
	c/uDivGdziRDCthFzaX/PjM6PgeMQYyTIuTwIc61kvKL5Ab+f/WWM8M1rQkM0UOmpaNF
	cY056w5uvNU4WOSZi1Iq9uCufEr7BgW12L18I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=LwC9pwSUUD8C9b786FOE0xKILYQxlMcAQDD+wTpnsBmZC0kHgfbrrjX3jJ2142prsO
	wbOXyZgMEHZ5XngjAnET4Hz1kHWEEnZNUA3lp+snK0sCE1PVQyi4eoOvm2SLBXevslyR
	O0NE6ywvz/847EyYfYFw3Uw52eKG7FNTRms7I=
MIME-Version: 1.0
Received: by 10.91.169.16 with SMTP id w16mr2143038ago.89.1307633668801; Thu,
	09 Jun 2011 08:34:28 -0700 (PDT)
Received: by 10.90.98.4 with HTTP; Thu, 9 Jun 2011 08:34:28 -0700 (PDT)
In-Reply-To: <4DF0E4A8.1000608@windriver.com>
References: <4DF0A70C.7080501@windriver.com> <4DF0E4A8.1000608@windriver.com>
Date: Thu, 9 Jun 2011 17:34:28 +0200
Message-ID: <BANLkTimV_znbLegSD-E3EEeFqEasmDHa4Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Kang Kai <Kai.Kang@windriver.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: Question about apply eglibc configurability to create minimal image
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
X-List-Received-Date: Thu, 09 Jun 2011 15:37:56 -0000
Content-Type: multipart/alternative; boundary=0016e645aaca53438204a5493046

--0016e645aaca53438204a5493046
Content-Type: text/plain; charset=ISO-8859-1

2011/6/9 Mark Hatle <mark.hatle@windriver.com>

> On 6/9/11 5:57 AM, Kang Kai wrote:
> > Hi Mark,
> >
> > I am focus on eglibc itself compilation with disabling all the
> > configurable options, right now eglibc can be compiled with disable all
> > the configurable options.
> >
> > But when I build core-image-minimal in a clear new directory, some
> > packages build failed and they need eglibc supports, such as
>
> core-image-minimal is simply to large of an image to see some of the
> advantages
> of the eglibc configuration.  Realistically the advantages come on single
> application or small (busybox + single application) systems.
>

Then again if you are in that usecase you're probably better off (spacewise)
using static linking

Frans

--0016e645aaca53438204a5493046
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/6/9 Mark Hatle <span dir=3D"ltr">&l=
t;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&=
gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0p=
t 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
On 6/9/11 5:57 AM, Kang Kai wrote:<br>
&gt; Hi Mark,<br>
&gt;<br>
&gt; I am focus on eglibc itself compilation with disabling all the<br>
&gt; configurable options, right now eglibc can be compiled with disable al=
l<br>
&gt; the configurable options.<br>
&gt;<br>
&gt; But when I build core-image-minimal in a clear new directory, some<br>
&gt; packages build failed and they need eglibc supports, such as<br>
<br>
core-image-minimal is simply to large of an image to see some of the advant=
ages<br>
of the eglibc configuration. =A0Realistically the advantages come on single=
<br>
application or small (busybox + single application) systems.<br></blockquot=
e></div><br>Then again if you are in that usecase you&#39;re probably bette=
r off (spacewise) using static linking<br><br>Frans<br>

--0016e645aaca53438204a5493046--
