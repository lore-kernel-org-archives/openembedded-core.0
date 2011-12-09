Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ71p-0000iK-Fo
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:26:47 +0100
Received: by bkbzt4 with SMTP id zt4so3438428bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=3sqzj51XgoJXQ2QBm5c/qdlgQrVRJQaTJpWJksfrQuQ=;
	b=Ao+6FqGtMzTZ3q/YbH7jx2hNuibQgdZQPnNUClY2b3/GnZy9YzrNQTST+EwDfeq/hr
	cvJD4AxoSkhaMmVhhPFE3RnwowB8g7jYb3qcPoZNv+0YJ16Lv3m5siRowLSsCpZmeWJO
	zGY6OY0x6vT4yJkHFfCvh3kEqkcrTi1cncE70=
MIME-Version: 1.0
Received: by 10.204.150.9 with SMTP id w9mr4782466bkv.65.1323461987487; Fri,
	09 Dec 2011 12:19:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 12:19:47 -0800 (PST)
In-Reply-To: <CAMKF1spbr_wVbi7tLToDF3bPhg28cAGz_JVVWFg59iGHEM5quA@mail.gmail.com>
References: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1spbr_wVbi7tLToDF3bPhg28cAGz_JVVWFg59iGHEM5quA@mail.gmail.com>
Date: Fri, 9 Dec 2011 18:19:47 -0200
X-Google-Sender-Auth: HQOnIQHosGVxW7MW20ggVijcz50
Message-ID: <CAP9ODKozBigWbmZZFX9AESZpms+4cNWKUx20uhZsfCYjURNHZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Fri, 09 Dec 2011 20:26:47 -0000
Content-Type: multipart/alternative; boundary=000e0ce0d9c6a34e6104b3ae81ea

--000e0ce0d9c6a34e6104b3ae81ea
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 18:14, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Dec 9, 2011 at 12:01 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > +# alg-test doesn't build, so disable that and test
> > +# for if_alg.h as this header is only in 2.6.39
> > +do_configure_prepend() {
> > +       sed -i 's:tools/alg-test ::g' Makefile.am
> > +       sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,::g;
> > +               s:AC_MSG_ERROR(User-space algorithm header files are
> required))::g' configure.ac
> > +}
> > +
>
> may be you can cache that in site files instead of this.
>

I'm willing to try to drop this in a next patch but I'd prefer this to get
in before and get connman in a working shape again before focusing on
improvements for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0d9c6a34e6104b3ae81ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 18:14, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Fri, Dec 9, 2011 at 12:01 PM, Otavio Salvador<br>
&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&=
gt; wrote:<br>
&gt; +# alg-test doesn&#39;t build, so disable that and test<br>
&gt; +# for if_alg.h as this header is only in 2.6.39<br>
&gt; +do_configure_prepend() {<br>
&gt; + =A0 =A0 =A0 sed -i &#39;s:tools/alg-test ::g&#39; Makefile.am<br>
&gt; + =A0 =A0 =A0 sed -i &#39;s:AC_CHECK_HEADERS(linux/if_alg.h, dummy=3Dy=
es,::g;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s:AC_MSG_ERROR(User-space algorithm head=
er files are required))::g&#39; <a href=3D"http://configure.ac" target=3D"_=
blank">configure.ac</a><br>
&gt; +}<br>
&gt; +<br>
<br>
</div>may be you can cache that in site files instead of this.<br></blockqu=
ote><div><br></div><div>I&#39;m willing to try to drop this in a next patch=
 but I&#39;d prefer this to get in before and get connman in a working shap=
e again before focusing on improvements for it.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce0d9c6a34e6104b3ae81ea--
