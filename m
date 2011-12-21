Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdSA1-0000Zo-6M
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:49:09 +0100
Received: by eeit10 with SMTP id t10so3738708eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=MkBDLgVBmhLClOGzWMWTYHjrIefdRZLDyW2I0LMXnSM=;
	b=fkbv+CqPmgyMsmtWBjFk7QZg6RvT4HTS5kCobZ4BCrt+ip39XIV5KmVzJTiPiy907r
	MEXfFPxeLcJqujWPEyMGoRy3B2H4kJ4eSSKYQt/2DAaK5FODH/nD6HeHmVyas9igt6DM
	TaJuGnzMQNn5Rwq/oxlcXRlS4xcuHkEScQmM4=
MIME-Version: 1.0
Received: by 10.204.133.207 with SMTP id g15mr2424295bkt.17.1324496520475;
	Wed, 21 Dec 2011 11:42:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Wed, 21 Dec 2011 11:42:00 -0800 (PST)
In-Reply-To: <2254819.M8CecAPdr1@helios>
References: <cover.1324454963.git.edwin.zhai@intel.com>
	<bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
	<2254819.M8CecAPdr1@helios>
Date: Wed, 21 Dec 2011 17:42:00 -0200
X-Google-Sender-Auth: bBkn0Ry2mA0UE0kVagRwGqM-grM
Message-ID: <CAP9ODKqMoOUYOS+P__ghJjye5_2T70XV593L1QCqUOsW5T9d4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] minix-session: Add this recipe as the session file for mini X
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
X-List-Received-Date: Wed, 21 Dec 2011 19:49:09 -0000
Content-Type: multipart/alternative; boundary=0015175cd0889bf37404b49f60da

--0015175cd0889bf37404b49f60da
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 21, 2011 at 08:36, Paul Eggleton
<paul.eggleton@linux.intel.com>wrote:

> Hi Edwin,
>
> On Wednesday 21 December 2011 16:18:05 edwin.zhai@intel.com wrote:
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > minix-session runs session files on behalf of file owner, so that no
> > rootless X required.
>
> A bit of a minor nitpick I know, but since "minix" is already the name of a
> well-known operating system I would suggest changing this to
> mini-x-session or
> similar.
>

Agreed; minix is too confusing for this context.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cd0889bf37404b49f60da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 21, 2011 at 08:36, Paul Eggleton <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eg=
gleton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
Hi Edwin,<br>
<div class=3D"im"><br>
On Wednesday 21 December 2011 16:18:05 <a href=3D"mailto:edwin.zhai@intel.c=
om">edwin.zhai@intel.com</a> wrote:<br>
&gt; From: Zhai Edwin &lt;<a href=3D"mailto:edwin.zhai@intel.com">edwin.zha=
i@intel.com</a>&gt;<br>
&gt;<br>
&gt; minix-session runs session files on behalf of file owner, so that no<b=
r>
&gt; rootless X required.<br>
<br>
</div>A bit of a minor nitpick I know, but since &quot;minix&quot; is alrea=
dy the name of a<br>
well-known operating system I would suggest changing this to mini-x-session=
 or<br>
similar.<br></blockquote><div><br></div><div>Agreed; minix is too confusing=
 for this context.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: =
<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyste=
ms.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">=
http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cd0889bf37404b49f60da--
