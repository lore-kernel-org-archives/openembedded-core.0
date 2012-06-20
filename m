Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <boot2linux@gmail.com>) id 1ShGLM-0006En-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 10:32:52 +0200
Received: by ggnp4 with SMTP id p4so5018140ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9CHIHuwH1JPV+sRMchRbaE/JdRpOiNMGLDuGzZkjE+k=;
	b=sw/VJBAJ+T6dpWlx8u8NfkalCB1QihYEwaCa+XzP+P1kUb9VySWOP+/q9+uqkexAXf
	/3u89skpuYpMdaKUbStFFpmye39Q5KLRd4xqrNheZPTegYdQYaH8chX1QrIXh52yE6fe
	UUsczuC5zsgpMK1Nx65CPsjZIhXbGj91UEjjFLeBXeOFfWrnSooa6e12uX6spGFilTCw
	Gk5nwCBLeIPV0tgtdzfPk72o4InNjzQWWLizZoeiUJ+IMuh8KKAGuc1kODx7TtQcudnq
	cLtfDa4pnorwKx4HZU5NaPUkMyL7u0nSkjSwdPw4L725p6d9+7btenCaiIaSZbULZaeZ
	V0rA==
MIME-Version: 1.0
Received: by 10.50.156.133 with SMTP id we5mr3601822igb.62.1340180526881; Wed,
	20 Jun 2012 01:22:06 -0700 (PDT)
Received: by 10.64.44.206 with HTTP; Wed, 20 Jun 2012 01:22:06 -0700 (PDT)
In-Reply-To: <CAMKF1sq1zLSDH2twH9toheN6nHwzuLFZ=+KZBDWsutckY+F4Qw@mail.gmail.com>
References: <CAJy-8bt3YwS1L3Oj=vonPY2Yzar2oGW0PWRbLx18EbHUigszAw@mail.gmail.com>
	<CAMKF1sq1zLSDH2twH9toheN6nHwzuLFZ=+KZBDWsutckY+F4Qw@mail.gmail.com>
Date: Wed, 20 Jun 2012 16:22:06 +0800
Message-ID: <CAJy-8bsbQaDq_fNZKSD+aSMsTGcLyTTUtYg5kWcKYx6q0+SzvQ@mail.gmail.com>
From: Michael Zhu <boot2linux@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to use external tool chain to build opebembedded-core ?
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
X-List-Received-Date: Wed, 20 Jun 2012 08:32:52 -0000
Content-Type: multipart/alternative; boundary=e89a8f2350093d5c5d04c2e3180c

--e89a8f2350093d5c5d04c2e3180c
Content-Type: text/plain; charset=ISO-8859-1

Dear Khem Raj ,
I will try. Thank you very much!


On Wed, Jun 20, 2012 at 1:37 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jun 19, 2012 at 7:41 PM, Michael Zhu <boot2linux@gmail.com> wrote:
> > Dears,
> > how to use prebuilt external tool chain to build  openembedded-core ?
> > thanks!
>
> Look at meta/conf/distro/include/tcmode-external-sourcery.inc
>
> thats how code sourcery toolchains are hooked in. and you do set
> TCMODE = "external-sourcery" in your local.conf
>
> and it will use csl toolchains, linaro has something similar look at
> linaro layer
> look at
>
> git://git.linaro.org/people/kwerner/meta-linaro.git
>
> it calls the TCMODE = "external-linaro"
>
> you can set your own following these as examples.
>
> > B.R.
> > Michael
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

--e89a8f2350093d5c5d04c2e3180c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Khem Raj ,<br>I will try. Thank you very much!<br><br><br><div class=
=3D"gmail_quote">On Wed, Jun 20, 2012 at 1:37 PM, Khem Raj <span dir=3D"ltr=
">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Jun 19, 2012 at 7:=
41 PM, Michael Zhu &lt;<a href=3D"mailto:boot2linux@gmail.com">boot2linux@g=
mail.com</a>&gt; wrote:<br>

&gt; Dears,<br>
&gt; how to use prebuilt external tool chain to build=A0 openembedded-core =
?<br>
&gt; thanks!<br>
<br>
</div>Look at meta/conf/distro/include/tcmode-external-sourcery.inc<br>
<br>
thats how code sourcery toolchains are hooked in. and you do set<br>
TCMODE =3D &quot;external-sourcery&quot; in your local.conf<br>
<br>
and it will use csl toolchains, linaro has something similar look at<br>
linaro layer<br>
look at<br>
<br>
git://<a href=3D"http://git.linaro.org/people/kwerner/meta-linaro.git" targ=
et=3D"_blank">git.linaro.org/people/kwerner/meta-linaro.git</a><br>
<br>
it calls the TCMODE =3D &quot;external-linaro&quot;<br>
<br>
you can set your own following these as examples.<br>
<br>
&gt; B.R.<br>
&gt; Michael<br>
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
</blockquote></div><br>

--e89a8f2350093d5c5d04c2e3180c--
