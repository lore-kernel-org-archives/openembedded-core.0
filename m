Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RWUMt-00014I-Oz
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 15:45:39 +0100
Received: by bkbzv15 with SMTP id zv15so3145317bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FMGs01oYD7bhs10byz+nfAeHY28XxJEb9rn5nrQiwH8=;
	b=R7Lz0e7LYbR9fVK+0RM680a0v6Vd4CdCY8n/Mpom/4oZJNPy5snAQLPhlGTDkykQud
	tmI6Dg0D9P7o1v6wtidJNMxaOa6jnZsh+1gB+xgDv816DUkGbeS2bXyYwrSeod0BvDAT
	Sw3R2Pri9hoAWo6uV2yJNbBoSa3auk6KofOsE=
MIME-Version: 1.0
Received: by 10.204.133.207 with SMTP id g15mr10803342bkt.139.1322836735164;
	Fri, 02 Dec 2011 06:38:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Fri, 2 Dec 2011 06:38:55 -0800 (PST)
In-Reply-To: <CACW_hTauUH+MErYe+AEMYNtJZ0rZ8D6ROS7-t8q=+4t23jwrqw@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>
	<1322771625.17484.149.camel@ted>
	<ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
	<CACW_hTauUH+MErYe+AEMYNtJZ0rZ8D6ROS7-t8q=+4t23jwrqw@mail.gmail.com>
Date: Fri, 2 Dec 2011 12:38:55 -0200
X-Google-Sender-Auth: O4d45DKk8yJ5h-3bPZ5Im4J1fI8
Message-ID: <CAP9ODKqrW+QW=0eVXJ64hXaDnMDs7AdHv+50XzcQXLPzSDjFiA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Fri, 02 Dec 2011 14:45:39 -0000
Content-Type: multipart/alternative; boundary=0015175cd088b2030a04b31ced63

--0015175cd088b2030a04b31ced63
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 2, 2011 at 11:34, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Ideally a specific revision of a layer should specify on which revision it
> depends on/was tested with, so people can reproduce that same setup.
>

I've been using combo-layer to this to work here at O.S. Systems and this
has been very easy to handle.

I made an internal repository that has oe-core and the layers I need so
co-workers can get it and trust it will work; the person doing the update
on the layers is expected to do a build before pushing it onto our internal
repository and thus this works very well.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cd088b2030a04b31ced63
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 2, 2011 at 11:34, Frans Meulenbroeks=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:fransmeulenbroeks@gmail.com">frans=
meulenbroeks@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex;">
Ideally a specific revision of a layer should specify on which revision it =
depends on/was tested with, so people can reproduce that same setup.<br></b=
lockquote><div><br></div><div>I&#39;ve been using combo-layer to this to wo=
rk here at O.S. Systems and this has been very easy to handle.</div>
<div><br></div><div>I made an internal repository that has oe-core and the =
layers I need so co-workers can get it and trust it will work; the person d=
oing the update on the layers is expected to do a build before pushing it o=
nto our internal repository and thus this works very well.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cd088b2030a04b31ced63--
