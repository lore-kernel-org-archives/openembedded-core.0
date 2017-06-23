Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0476E78082
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 12:53:24 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 16so34639648qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8yls07+BpTb/zr3eoRS8HY/tGMg+dXKBcqp1jo252vY=;
	b=NuRED6FMDwFmEXb0hx0oPqsJcDOYuVZHtIm50+TfG4Lvf2OhfXD+kGMblCzBjYbbp2
	u2R7e3nmE62i5Pb6vp+nrSHjaMUCilnD2NKCYQ+jKzRevJPbUIXAp97tFC0Bxt7qJN9g
	WJy5gDz2TULDeNjM42okD6x7o9lWb89dCFIXRDNltOQ3bjrWuX4k6sK+J1DshxizixNg
	Op0SB4iLi2QryE3D3EmRdmuw76kltuLuRBP53jL91tsOlWCmKeipNRoJLRvHUlb1Z8rJ
	p809zL47XhVMhU46nZgeQmkvE4Vr/KkNyjs+53XqdyYYEUOlY3iL5ar+Tyq/b1ew838P
	byZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8yls07+BpTb/zr3eoRS8HY/tGMg+dXKBcqp1jo252vY=;
	b=dQWHrdYZM58mewLpGDBxib/C5uFG7brD/PncVKTfqPAi1S5IeeSDIt5Axs7YJh4UWR
	zu+KTwOTEI7aALqZBlG6k2E9cB1mHd61sLd7z9wJbFl3Og9zEfjST4mhMgnfJFDx4uYj
	ES8B/Ki0zQ/kJWnyDqSn/FX4/dwAR+oHbfiNKMGQBHr1J4unVzygJm9uQd5kk5qyUdAa
	874smjhiQOB+hckOqkHQQrzLB22pYYm8dQhp8BC3kaxQt0x8UoR3cxAgqlzkHhNYbsih
	EYND9vmuk2ow45Dzw6pTI1dqeEmN+MrQ/BKoC3C9XHLOCZoTBkKb8vopBli0p/TeDFwm
	UuYg==
X-Gm-Message-State: AKS2vOxz476q3FIkmps3ydzDkbcd/379vVX3BTkYY68wpE+/Z8V/HGNs
	8r4z3LQYqCwtPLTkWJ11CxOB/OgaKb3d
X-Received: by 10.55.31.162 with SMTP id n34mr8427719qkh.46.1498222406150;
	Fri, 23 Jun 2017 05:53:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 23 Jun 2017 05:53:05 -0700 (PDT)
In-Reply-To: <20170623125705.08cf0025@loki02>
References: <20170622104209.260f4563@loki02>
	<CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
	<20170623125705.08cf0025@loki02>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jun 2017 13:53:05 +0100
Message-ID: <CAJTo0LYhB1seMV_QyDf_PWkGF0fkubZb3WHpV2dcTfeU=ysckA@mail.gmail.com>
To: Adam Trhon <adam.trhon@tbs-biometrics.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: how to load cmake args from git?
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
X-List-Received-Date: Fri, 23 Jun 2017 12:53:25 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f85061d10552a016d4"

--001a1147e5f85061d10552a016d4
Content-Type: text/plain; charset="UTF-8"

On 23 June 2017 at 11:57, Adam Trhon <adam.trhon@tbs-biometrics.com> wrote:

> According to documentation, this is expanded during recipe parsing. At
> that time ${S}/oe_arguments.txt does not yet exits (it exists only after
> do_unpack). I tried it and the build failed with python Exception:
> FileNotFound.
>

Yes, good point. In m defence it was late. :)


> I tried
>
> python do_setup_extra_oecmake() {
>     d.appendVar("EXTRA_OECMAKE", " " + open(d.expand("${S}/oe_
> arguments.txt")).read())
>     print("adding "+d.expand("${S}/oe_arguments.txt"))
> }
>
> addtask do_setup_extra_oecmake after do_unpack before do_configure
>
> but it did not work as well. The "adding.... " line is printed
> correctly in log.do_setup_extra_oecmake, the file exists, but the
> arguments in it are not used (I checked run.do_configure).
>

Have a look at log.do_configure and verify what options are being passed.
I'm also assuming that you're using the cmake class here.

Ross

--001a1147e5f85061d10552a016d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 June 2017 at 11:57, Adam Trhon <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:adam.trhon@tbs-biometrics.com" target=3D"_blank">adam.trhon@tbs-biometric=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4=
e9" class=3D"a3s aXjCH m15cd499b0cbb16eb">According to documentation, this =
is expanded during recipe parsing. At<br>
that time ${S}/oe_arguments.txt does not yet exits (it exists only after<br=
>
do_unpack). I tried it and the build failed with python Exception:<br>
FileNotFound.<br></div></blockquote><div><br></div><div>Yes, good point. In=
 m defence it was late. :)</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":4e9" class=3D"a3s aXjCH m15cd499b0cbb16eb">
I tried<br>
<br>
python do_setup_extra_oecmake() {<br>
=C2=A0 =C2=A0 d.appendVar(&quot;EXTRA_OECMAKE&quot;, &quot; &quot; + open(d=
.expand(&quot;${S}/oe_<wbr>arguments.txt&quot;)).read())<br>
=C2=A0 =C2=A0 print(&quot;adding &quot;+d.expand(&quot;${S}/oe_arguments.<w=
br>txt&quot;))<br>
}<br>
<br>
addtask do_setup_extra_oecmake after do_unpack before do_configure<br>
<br>
but it did not work as well. The &quot;adding.... &quot; line is printed<br=
>
correctly in log.do_setup_extra_oecmake, the file exists, but the<br>
arguments in it are not used (I checked run.do_configure).<br></div></block=
quote></div><br>Have a look at log.do_configure and verify what options are=
 being passed.=C2=A0 I&#39;m also assuming that you&#39;re using the cmake =
class here.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1147e5f85061d10552a016d4--
