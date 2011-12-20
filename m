Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd0lN-0005In-8n
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 15:33:53 +0100
Received: by eaal1 with SMTP id l1so5807398eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=JKSzRjQZE4+Ff/VUxFitFOrOTRWcCGWRe9ZlgyifeJo=;
	b=fmjhVhlYKp5jP7nA7istM3orIY1MYvI4Q5CO2/4v2OKX803KHGECUA9Z6OvAVOrcM8
	nMMq/zjp3lkQ2+LDQGP/HMywI7AXNyeIT9A0yRv8Oxv16AL0wIdHMm8hFS2kckntw+zq
	xfVFfu6ex64cNfCrn8Lkl3EkBv4V3auYR83s0=
MIME-Version: 1.0
Received: by 10.205.127.17 with SMTP id gy17mr608112bkc.113.1324391209208;
	Tue, 20 Dec 2011 06:26:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Tue, 20 Dec 2011 06:26:49 -0800 (PST)
In-Reply-To: <A77B2F65-71EC-46E5-B396-C5A6FA0CEA7C@dominion.thruhere.net>
References: <4EEBC476.20108@linux.intel.com> <4EEF8073.2040205@linux.intel.com>
	<CAP9ODKoS9HK089TEFRwrddk5gnd5rwArZdWvRysSt2GH47N3gQ@mail.gmail.com>
	<A77B2F65-71EC-46E5-B396-C5A6FA0CEA7C@dominion.thruhere.net>
Date: Tue, 20 Dec 2011 12:26:49 -0200
X-Google-Sender-Auth: YiptPJfLWulA6r0iwUwnWqX3rEM
Message-ID: <CAP9ODKrE6HkWkhQRHdWxrn7UmH8d3AbT=mxoFAA2iC92Zg1SdQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Dec 2011 14:33:53 -0000
Content-Type: multipart/alternative; boundary=000e0cdfd982918ae604b486db01

--000e0cdfd982918ae604b486db01
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 20, 2011 at 11:48, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 20 dec. 2011, om 14:35 heeft Otavio Salvador het volgende geschreven:
> ...
>
> I read this e-mail after I started working on this. My current WIP
> patchset is at:
> >
> >
> https://github.com/OSSystems/oe-core/compare/ae4118a1f78f113c3d687c3aa6a86007cf977cae...master
> >
> > I am going to finish this getting 175 on oe-core but those patches seems
> good for merging to me.
>
> Keep in mind that udev 175 looks a lot different than earlier versions,
> e.g. no udev-acl anymore, locations have moved, etc. So the custom OE
> initscripts will need a fair amount of changes for people still using
> sysvinit.
>

I will on 173 first, in this case.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfd982918ae604b486db01
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Dec 20, 2011 at 11:48, Koen Kooi <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.=
thruhere.net</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

Op 20 dec. 2011, om 14:35 heeft Otavio Salvador het volgende geschreven:<di=
v class=3D"im">...=A0</div></blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"im">
&gt; I read this e-mail after I started working on this. My current WIP pat=
chset is at:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/OSSystems/oe-core/compare/ae4118a1f78f11=
3c3d687c3aa6a86007cf977cae...master" target=3D"_blank">https://github.com/O=
SSystems/oe-core/compare/ae4118a1f78f113c3d687c3aa6a86007cf977cae...master<=
/a><br>

&gt;<br>
&gt; I am going to finish this getting 175 on oe-core but those patches see=
ms good for merging to me.<br>
<br>
</div>Keep in mind that udev 175 looks a lot different than earlier version=
s, e.g. no udev-acl anymore, locations have moved, etc. So the custom OE in=
itscripts will need a fair amount of changes for people still using sysvini=
t.<br>
</blockquote><div><br></div><div>I will on 173 first, in this case.=A0</div=
></div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavi=
o@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a hre=
f=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.co=
m.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfd982918ae604b486db01--
