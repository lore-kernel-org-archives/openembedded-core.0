Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ty28W-00041C-Qz
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 16:21:18 +0100
Received: by mail-ie0-f169.google.com with SMTP id c14so13814346ieb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XFAaccx1B4p+XRvk36VZFweo1QkSlvNH9BTPRwTiml0=;
	b=EflX83r1G+7vyPvJ0CAIKOuNMKeC4mkup1W+WkWrA4awBut0/xFlRVQzy4rLDVlWXD
	c+vaTXk4MPp8JO6EKjv8BISCYdH+/OkdXKEzhZ9F/LTGlaaImPKtlqGkHBCvOUTT4+WW
	NAQPiR/y3fMppjAO3q7sjj/BoOM8vgr4MbE0mpuZsJvqR1kIvNy4RoMnBicghMjanVXa
	hm4BCEDHi4nAGNpnmHMNAh+d4yyLNY1R+tl8z6ud5vI/BbSeO4DyIyMnN/yrgEtEBURX
	4AxxhVf2H684PrL8XBqYrUvkREOtQE4hwFsYIbZP049Q8+qyUKFwinJ5CqI5LBZ4U9SD
	R5+A==
MIME-Version: 1.0
X-Received: by 10.42.54.5 with SMTP id p5mr1165126icg.49.1358953539465; Wed,
	23 Jan 2013 07:05:39 -0800 (PST)
Received: by 10.64.18.169 with HTTP; Wed, 23 Jan 2013 07:05:39 -0800 (PST)
In-Reply-To: <CAJTo0LaEfVfd3NKHDSZapk2+Gm2yo6-aHzAPTt=CwThO1pGMWQ@mail.gmail.com>
References: <1358909100-21633-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LaEfVfd3NKHDSZapk2+Gm2yo6-aHzAPTt=CwThO1pGMWQ@mail.gmail.com>
Date: Wed, 23 Jan 2013 07:05:39 -0800
Message-ID: <CAMKF1sr3Hei6xfO+V67aArMzsnhTOswcRPx6E5Tjr9J5eMnNTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix build on ppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 15:21:18 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fd72dfc729d04d3f606ec

--90e6ba3fd72dfc729d04d3f606ec
Content-Type: text/plain; charset=UTF-8

On Wednesday, January 23, 2013, Burton, Ross wrote:

> On 23 January 2013 02:45, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> > ppc discovers an interesting issue in linking systemd where a library is
> > missing in link cmdline and linker barfs
> >
> > ./.libs/libsystemd-core.a(libsystemd_core_la-manager.o): In function
> > `manager_check_finished':
> > /builddir/build/BUILD/systemd-196/src/core/manager.c:2092: undefined
> > reference to `sd_notifyf'
> > collect2: error: ld returned 1 exit status
> >
> > For more info see
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=888255
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
>
> Signed-off-by: Ross Burton <ross.burton@intel.com <javascript:;>>
>
> (note that in oe-core you don't need explicit PR bumps anymore)


Yes I know :)

>
> Ross
>

--90e6ba3fd72dfc729d04d3f606ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, January 23, 2013, Burton, Ross  wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 23 January 2013 02:45, Khem Raj &lt;<a href=3D"javas=
cript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)=
">raj.khem@gmail.com</a>&gt; wrote:<br>

&gt; ppc discovers an interesting issue in linking systemd where a library =
is<br>
&gt; missing in link cmdline and linker barfs<br>
&gt;<br>
&gt; ./.libs/libsystemd-core.a(libsystemd_core_la-manager.o): In function<b=
r>
&gt; `manager_check_finished&#39;:<br>
&gt; /builddir/build/BUILD/systemd-196/src/core/manager.c:2092: undefined<b=
r>
&gt; reference to `sd_notifyf&#39;<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt;<br>
&gt; For more info see<br>
&gt;<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D888255" targe=
t=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D888255</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&g=
t;<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"javascript:;" onclick=3D"_e(event=
, &#39;cvml&#39;, &#39;ross.burton@intel.com&#39;)">ross.burton@intel.com</=
a>&gt;<br>
<br>
(note that in oe-core you don&#39;t need explicit PR bumps anymore)</blockq=
uote><div><br></div><div>Yes I know :)=C2=A0<span></span>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">

<br>
Ross<br>
</blockquote>

--90e6ba3fd72dfc729d04d3f606ec--
