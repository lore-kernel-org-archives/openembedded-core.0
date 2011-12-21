Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdDOV-0003lO-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 05:03:09 +0100
Received: by eaal1 with SMTP id l1so6381514eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 19:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=m6b9uxs/BVVBugRZU1lHy8vzMNcPFSTqSMgeCTStVPo=;
	b=s43s5QvqZMS7deZlnO40nHxumQm0jEXK/xxO5koHhF22NAhRKgf6m3kMqZeIG2F2DH
	GSl6BHsV4sI6O//4Xkq2WTtAh98fUOJp8D/iR5iWT31D4RquUxR9fXymU1VhffyjLkEJ
	wmXgB+XbQNlJkrF2Ys0k0Af2lZ8hd69cAx62U=
MIME-Version: 1.0
Received: by 10.205.138.136 with SMTP id is8mr1626182bkc.35.1324439761170;
	Tue, 20 Dec 2011 19:56:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Tue, 20 Dec 2011 19:56:01 -0800 (PST)
In-Reply-To: <4EF15524.4030509@linux.intel.com>
References: <cover.1324121806.git.otavio@ossystems.com.br>
	<20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
	<4EF150A1.60404@linux.intel.com>
	<CAP9ODKrTMaJugUXTTQYWS0N_S-13jDXCvJ9aP4HL0hjhZYdZgg@mail.gmail.com>
	<4EF15524.4030509@linux.intel.com>
Date: Wed, 21 Dec 2011 01:56:01 -0200
X-Google-Sender-Auth: 0G-obB7S7KKI2dla5amshFzEMSk
Message-ID: <CAP9ODKojn_NiXfiYyb-hWSSit01OVzcF-rt54JVCxbqtxMuCeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] connman: disable 'alg-test' building
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
X-List-Received-Date: Wed, 21 Dec 2011 04:03:09 -0000
Content-Type: multipart/alternative; boundary=000e0ce0b2b47db12704b492292c

--000e0ce0b2b47db12704b492292c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 21, 2011 at 01:40, Darren Hart <dvhart@linux.intel.com> wrote:
>
> On 12/20/2011 07:28 PM, Otavio Salvador wrote:
> > On Wed, Dec 21, 2011 at 01:21, Darren Hart <dvhart@linux.intel.com
> > <mailto:dvhart@linux.intel.com>> wrote:
> >
> >     (I understand this is poky related and not oe-core, but as the
> context
> >     for this patch is here, I opted to continue the discussion here.)
> >
> >
> > It seems you haven't applied the patch as it shows the message that the
> > patch clearly remove.
>
> I did have the commit in my source tree, but something didn't trigger as
> a cleanall and rebuild of connman succeeded. The tree was a clean
> master, perhaps my sstate had a previous PR=r6 from our earlier testing
> or something like that. Strange.


Ufa! EYOUOUGHTGETCOFFEE :P

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0b2b47db12704b492292c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 21, 2011 at 01:40, Darren Hart <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.int=
el.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
On 12/20/2011 07:28 PM, Otavio Salvador wrote:<br>
&gt; On Wed, Dec 21, 2011 at 01:21, Darren Hart &lt;<a href=3D"mailto:dvhar=
t@linux.intel.com">dvhart@linux.intel.com</a><br>
</div><div class=3D"im">&gt; &lt;mailto:<a href=3D"mailto:dvhart@linux.inte=
l.com">dvhart@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 (I understand this is poky related and not oe-core, but as the=
 context<br>
&gt; =A0 =A0 for this patch is here, I opted to continue the discussion her=
e.)<br>
&gt;<br>
&gt;<br>
&gt; It seems you haven&#39;t applied the patch as it shows the message tha=
t the<br>
&gt; patch clearly remove.<br>
<br>
</div>I did have the commit in my source tree, but something didn&#39;t tri=
gger as<br>
a cleanall and rebuild of connman succeeded. The tree was a clean<br>
master, perhaps my sstate had a previous PR=3Dr6 from our earlier testing<b=
r>
or something like that. Strange.</blockquote><div><br></div><div>Ufa! EYOUO=
UGHTGETCOFFEE :P</div><div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: =
<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyste=
ms.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">=
http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce0b2b47db12704b492292c--
