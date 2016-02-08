Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA57B73257
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 00:07:34 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g62so95700898wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Feb 2016 16:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=G29Zmj0DMCCVN7/e9bJ3hAcZ66I46D71c55Qb3d3gi8=;
	b=ZESIZW7Hxkwb07V/qj2y+Ub1Dm48zV3tmvussmlw82iax6uGYYbGUotIRnW3D7JC8r
	cySD1mPmAjp5au5aXRqKWH9NQkVIgOeI/hflaymThBBAAfjDtWnCMy1MHN1H4CF4I9Yx
	n6/jtTkJnt0gqaAfNTPFjftCYbqJSpZAEuXsH0Gy5EGojf2opsLIUr0ZPXTxRDiol2OW
	mTzMDyukQcuFaXgoBJcK2rhIDmocUw73R3d1RtUyoJvFJ8AqtvfiKCIpMf4iLAbR/FoE
	4ArccOfcYmjrssgLQoubYSuHT/rktjcP0jt69zEeSPp63VV5JzPZ5f3wP5RSrNHnkikP
	AcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=G29Zmj0DMCCVN7/e9bJ3hAcZ66I46D71c55Qb3d3gi8=;
	b=jK6zAD6d1QEutMyxDOD//YegX4HJ9Mh2nCvuje6QmREwT0IiUE50kwM+nIlHQrF35v
	rckF++cQhbDxCrHpBfiovEuUgm0BNCfOcXM7nN80c0NEHSD5PcTfnQp8VvDNxvM4+lHv
	11YgZYW2Z1sIkQEdd9RG19Ga8AstyE5IEGMYWaU/ovLKZQXJEM1skW9lLQr+AAlse17Z
	qw5C9ar/8A45iOM3WFDOCADIQep3qATgjbSl6LjzkgmQlYKc8+Itz6/oMZW3NJs9qB6q
	p00YjGMnIWjeY9Q/0Oj1d0NDs3TJl6EhNO6Iq/jIZtbBck1DPOIJ969cCOmSu2W84RZq
	IjcQ==
X-Gm-Message-State: AG10YOTUftccv7qu0MJcz8nJ8p6xB+EzTuP18jn+alA2Irbp2zKu9niA6RlCRBzVvVf3az9ptMfcub9dSTZqAw==
MIME-Version: 1.0
X-Received: by 10.194.5.36 with SMTP id p4mr25085335wjp.167.1454890055202;
	Sun, 07 Feb 2016 16:07:35 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Sun, 7 Feb 2016 16:07:35 -0800 (PST)
In-Reply-To: <20160207220741.GA12339@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
	<20160206204110.GA21969@mcrowe.com>
	<20160207220741.GA12339@mcrowe.com>
Date: Mon, 8 Feb 2016 01:07:35 +0100
Message-ID: <CA+chaQeGfQQ5r=Z+MEzuv1rX93ZLgrVDWzbwx6fXrkaftZ-w-g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 00:07:36 -0000
Content-Type: multipart/alternative; boundary=047d7b5d9c3bed7b35052b36fc90

--047d7b5d9c3bed7b35052b36fc90
Content-Type: text/plain; charset=UTF-8

> I also saw similar failures with vsftpd and vpnc which you didn't see for
some reason. I have patches ready for those too.

Most likely one of their dependencies failed, so it didn't try to compile
them yet (until I apply your patches for oe-core).

> This recipe fails to compile for me too but it doesn't seem to be related
to EXTRA_OEMAKE.

There are many issues not caused by EXTRA_OEMAKE, see previous bitbake
world report (which didn't have your EXTRA_OEMAKE change).
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116994.html


On Sun, Feb 7, 2016 at 11:07 PM, Mike Crowe <mac@mcrowe.com> wrote:

> Further to my previous response, I've tried another build with qemuarm this
> time and more layers enabled.
>
> > On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/
> libebml_1.3.0.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/vlan/
> vlan_1.9.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-protocols/pptp-linux/
> pptp-linux_1.7.2.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/pimd/
> pimd_2.1.8.bb,
>
> These recipes all appear to require EXTRA_OEMAKE = "-e MAKEFLAGS=". I have
> patches ready to post.
>
> I also saw similar failures with vsftpd and vpnc which you didn't see for
> some reason. I have patches ready for those too.
>
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/
> klibc_2.0.4.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/soci/
> soci_3.2.2.bb,
> > >
> virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/
> libwmf_0.2.8.4.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/
> cunit_2.1-3.bb,
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/
> znc_git.bb,
>
> These recipes all compiled successfully for me with EXTRA_OEMAKE = "".
> Perhaps they are non-deterministic or they failed for you for other
> reasons?
>
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/
> libtinyxml2_git.bb,
>
> This recipe doesn't appear to call oe_runmake. It failed to compile for me
> even after explicitly setting EXTRA_OEMAKE back to "-e MAKEFLAGS=".
>
> > >
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb,
>
> This recipe fails to compile for me too but it doesn't seem to be related
> to EXTRA_OEMAKE. I think it can't find the kernel headers it needs which
> may be due to an error in my configuration.
>
> > >
> /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/
> invensense_git.bb,
>
> I haven't yet tried meta-android.
>
> Thanks.
>
> Mike.
>

--047d7b5d9c3bed7b35052b36fc90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">I also saw simi=
lar failures with vsftpd and vpnc which you didn&#39;t see for</span><br st=
yle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">some reason. I ha=
ve patches ready for those too.</span><div><span style=3D"font-size:12.8px"=
><br></span></div><div><span style=3D"font-size:12.8px">Most likely one of =
their dependencies failed, so it didn&#39;t try to compile them yet (until =
I apply your patches for oe-core).</span></div><div><span style=3D"font-siz=
e:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">&gt;=C2=A0=
</span><span style=3D"font-size:12.8px">This recipe fails to compile for me=
 too but it doesn&#39;t seem to be related</span></div><span style=3D"font-=
size:12.8px">to EXTRA_OEMAKE.</span><div><span style=3D"font-size:12.8px"><=
br></span></div><div><span style=3D"font-size:12.8px">There are many issues=
 not caused by EXTRA_OEMAKE, see previous bitbake world report (which didn&=
#39;t have your EXTRA_OEMAKE change).</span></div><div><span style=3D"font-=
size:12.8px"><a href=3D"http://lists.openembedded.org/pipermail/openembedde=
d-core/2016-February/116994.html">http://lists.openembedded.org/pipermail/o=
penembedded-core/2016-February/116994.html</a></span><br><div><span style=
=3D"font-size:12.8px"><br></span></div></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Sun, Feb 7, 2016 at 11:07 PM, Mike Cro=
we <span dir=3D"ltr">&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_blank=
">mac@mcrowe.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fu=
rther to my previous response, I&#39;ve tried another build with qemuarm th=
is<br>
time and more layers enabled.<br>
<span class=3D""><br>
&gt; On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:<br=
>
</span>&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-mul=
timedia/recipes-mkv/libebml/<a href=3D"http://libebml_1.3.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libebml_1.3.0.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-connectivity/vlan/<a href=3D"http://vlan_1.9.bb" rel=3D"noreferrer=
" target=3D"_blank">vlan_1.9.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-protocols/pptp-linux/<a href=3D"http://pptp-linux_1.7.2.bb" rel=3D=
"noreferrer" target=3D"_blank">pptp-linux_1.7.2.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-support/pimd/<a href=3D"http://pimd_2.1.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pimd_2.1.8.bb</a>,<br>
<br>
These recipes all appear to require EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&=
quot;. I have<br>
patches ready to post.<br>
<br>
I also saw similar failures with vsftpd and vpnc which you didn&#39;t see f=
or<br>
some reason. I have patches ready for those too.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/=
recipes-devtools/klibc/<a href=3D"http://klibc_2.0.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">klibc_2.0.4.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-support/soci/<a href=3D"http://soci_3.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">soci_3.2.2.bb</a>,<br>
&gt; &gt; virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/=
meta-oe/recipes-extended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb" rel=3D=
"noreferrer" target=3D"_blank">libwmf_0.2.8.4.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-devtools/cunit/<a href=3D"http://cunit_2.1-3.bb" rel=3D"noreferrer" target=
=3D"_blank">cunit_2.1-3.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-irc/znc/<a href=3D"http://znc_git.bb" rel=3D"noreferrer" target=3D=
"_blank">znc_git.bb</a>,<br>
<br>
These recipes all compiled successfully for me with EXTRA_OEMAKE =3D &quot;=
&quot;.<br>
Perhaps they are non-deterministic or they failed for you for other reasons=
?<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-support/libtinyxml2/<a href=3D"http://libtinyxml2_git.bb" rel=3D"noreferre=
r" target=3D"_blank">libtinyxml2_git.bb</a>,<br>
<br>
This recipe doesn&#39;t appear to call oe_runmake. It failed to compile for=
 me<br>
even after explicitly setting EXTRA_OEMAKE back to &quot;-e MAKEFLAGS=3D&qu=
ot;.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+<a href=3D"http://svn502=
.bb" rel=3D"noreferrer" target=3D"_blank">svn502.bb</a>,<br>
<br>
This recipe fails to compile for me too but it doesn&#39;t seem to be relat=
ed<br>
to EXTRA_OEMAKE. I think it can&#39;t find the kernel headers it needs whic=
h<br>
may be due to an error in my configuration.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/reci=
pes-support/invensense/<a href=3D"http://invensense_git.bb" rel=3D"noreferr=
er" target=3D"_blank">invensense_git.bb</a>,<br>
<br>
I haven&#39;t yet tried meta-android.<br>
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mike.<br>
</font></span></blockquote></div><br></div>

--047d7b5d9c3bed7b35052b36fc90--
