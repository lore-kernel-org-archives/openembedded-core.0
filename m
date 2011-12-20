Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rczy3-000322-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 14:42:56 +0100
Received: by eeit10 with SMTP id t10so2582263eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 05:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=zhkZdQhQpRZquq3w3Z4tzm75Cg4YsA7R/7p9JMdjJBw=;
	b=pCMnuEfhHRgSOgliEYtATsanpm/EfpCoQaG67lW2asuupDL+W39Hx1oNO5NQQFGggx
	nEBZCE9sHzgBmSq6D2Q9SWkTeChc74jtMR2i1MuEGbZHGUQpBJFBDH30opEmzEoXgHHO
	hbSIaNWl27fpI8fFwYQyH2Q9+EzNjfiZZXBRc=
MIME-Version: 1.0
Received: by 10.205.131.13 with SMTP id ho13mr550309bkc.41.1324388151765; Tue,
	20 Dec 2011 05:35:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Tue, 20 Dec 2011 05:35:51 -0800 (PST)
In-Reply-To: <4EEF8073.2040205@linux.intel.com>
References: <4EEBC476.20108@linux.intel.com> <4EEF8073.2040205@linux.intel.com>
Date: Tue, 20 Dec 2011 11:35:51 -0200
X-Google-Sender-Auth: nublHfa0P9ACudFpSl_i_1RuhAA
Message-ID: <CAP9ODKoS9HK089TEFRwrddk5gnd5rwArZdWvRysSt2GH47N3gQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: UDEV-145??
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
X-List-Received-Date: Tue, 20 Dec 2011 13:42:56 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd64654aa4c04b4862529

--000e0cdfd64654aa4c04b4862529
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 19, 2011 at 16:20, Joshua Lock <josh@linux.intel.com> wrote:

> On 16/12/11 14:21, Saul Wold wrote:
> >
> > Does anyone know why we might be keeping this older version around?  I
> > know that in the past there were kernel <-> udev issues. Are most usages
> > now using current kernels and udev?
>
> I was wondering the same thing. I have a WIP patch series to drop the
> old version and the old inc file.
>
> Further I'd like to try and get meta-oe using at least most of the
> oe-core udev, I've not looked at the differences there yet.
>

I read this e-mail after I started working on this. My current WIP patchset
is at:

https://github.com/OSSystems/oe-core/compare/ae4118a1f78f113c3d687c3aa6a86007cf977cae...master

I am going to finish this getting 175 on oe-core but those patches seems
good for merging to me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd64654aa4c04b4862529
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Dec 19, 2011 at 16:20, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 16/12/11 14:21, Saul Wold wrote:<br>
&gt;<br>
&gt; Does anyone know why we might be keeping this older version around? =
=A0I<br>
&gt; know that in the past there were kernel &lt;-&gt; udev issues. Are mos=
t usages<br>
&gt; now using current kernels and udev?<br>
<br>
</div>I was wondering the same thing. I have a WIP patch series to drop the=
<br>
old version and the old inc file.<br>
<br>
Further I&#39;d like to try and get meta-oe using at least most of the<br>
oe-core udev, I&#39;ve not looked at the differences there yet.<br></blockq=
uote><div><br></div><div>I read this e-mail after I started working on this=
. My current WIP patchset is at:</div><div><br></div><div><a href=3D"https:=
//github.com/OSSystems/oe-core/compare/ae4118a1f78f113c3d687c3aa6a86007cf97=
7cae...master">https://github.com/OSSystems/oe-core/compare/ae4118a1f78f113=
c3d687c3aa6a86007cf977cae...master</a></div>
<div><br></div><div>I am going to finish this getting 175 on oe-core but th=
ose patches seems good for merging to me.</div><div><br></div></div>-- <br>=
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd64654aa4c04b4862529--
