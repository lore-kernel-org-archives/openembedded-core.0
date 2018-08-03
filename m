Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4690471B57
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 03:24:48 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b15-v6so4728268qtp.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 20:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=956Th05mf3s34diIikVOi58uzMLK54bKF7M3IBuG9PM=;
	b=g4EUIh4xPg3ZY73MIAgphAUA+WOC/Y+mum1p47zholbLVwJLqre+jhrL2kYle+/rPh
	NY72FvTHWngMiYdIwomXe3z2q9SpdKEijH+4j2bsolNZPHmcbj8UqtODSJXPOP2vHohn
	/Ms4cvJ0s7lIDGImkGSxlYcYtPEQl77cF4CU8rUmQhGaX8pUeqbF8GPGK4mNzSUqCxfs
	dllRZjvaizvPPQbNXiJTSHB9/s/4ByPrGVj6Nmjq+zO8pxPpHFSDloFFy2G4UnGkPG+c
	Yh4sT8yLiB+iKpa+BySlgmdgMXHlmUZZaVS2eT5LUABBVimdyBluPRrzNAU5O5Tc6Wtu
	OoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=956Th05mf3s34diIikVOi58uzMLK54bKF7M3IBuG9PM=;
	b=hCcnaIOqry7jpZ2krfR78qAR3Ea8Mbe6i2dD+BDEL2TZL/Mt45nTTRKMwQEdyDmCtW
	GE2t4hy0qHnz58om+rx3/9uBHRMz9va/U4pZvAEC9Fu6qUtEG0FpgoONHeBWgEemuIEV
	QWNdPdBEMV8Jpzv7mF9P6NijFt07WzUgd36OxfEyHE10CwZ2FtuGPfR/Pczk2F/cMQvX
	eo3I/Z2ivB1iAxjc0LZXr363Rp8trdOC8h9MevpazPxCY/T0fOj2iRuQH+NCevdPAOTp
	rr28AI1vGPWcJQetQTk0hpW37hAEMrZ909iQS7o/Z8cnhwMs6tLaFlobqxf+aFuwpt7p
	IIkg==
X-Gm-Message-State: AOUpUlEJ7VQZCXB7oyF59duWWILsislevx140ZttXLEHNHHqIUgogSXd
	1KDSi8O3Pi5qv/X578qwP0QxU2q3IkQsGbq/okk=
X-Google-Smtp-Source: AAOMgpfVmTfXlYyqcyoH94ey4GMMVikVP3YXQEV4Jrli8aqRCfYrOWHSF+Lc+vJN1Ek6mjwpX/IPu6bQk1Wl8dqQEu4=
X-Received: by 2002:a0c:8441:: with SMTP id l59-v6mr1986403qva.5.1533266688908;
	Thu, 02 Aug 2018 20:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180731170541.13620-1-ross.burton@intel.com>
	<20180731170541.13620-2-ross.burton@intel.com>
	<CAMKF1sog84TTX8f9kmzx9o3e8LciAMp6SxVh+MwE4OX=NYm_SQ@mail.gmail.com>
	<CAJTo0LaKWwanR0zKSh2NtpE15yp6qfF7rtXdNFSJ7HfNqR1huA@mail.gmail.com>
In-Reply-To: <CAJTo0LaKWwanR0zKSh2NtpE15yp6qfF7rtXdNFSJ7HfNqR1huA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 20:24:37 -0700
Message-ID: <CAMKF1srzjb+eaSKrQDLRuQPJE3iR+0izdghxiT1nz7_cOSg+Rw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python[3]native: allow use of both native Python 2 and 3
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
X-List-Received-Date: Fri, 03 Aug 2018 03:24:48 -0000
Content-Type: multipart/alternative; boundary="00000000000056a1e005727f7807"

--00000000000056a1e005727f7807
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 3:50 PM Burton, Ross <ross.burton@intel.com> wrote:

> The last to be inherited behaviour?  That's the same as the current
> behaviour, apart from after my change both pythons are available via
> PATH.
>
> The only change is that inheriting the second class doesn't wipe out
> the first class.


Ok may be then this variable should be made overridable so a recipe can
select it to be one of two otherwise the default remains as you said

>
>
> Ross
>
> On 2 August 2018 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> > On Tue, Jul 31, 2018 at 10:06 AM Ross Burton <ross.burton@intel.com>
> wrote:
> >>
> >> Instead of both classes using ${PYTHON_PN} (which is set by python-dir
> and
> >> python3-dir), hardcode the right values so that it is possible to
> inherit
> >> both
> >> pythonnative and python3native at the same time.
> >>
> >> If both are inherited then both native Pythons are available, but the
> last
> >> to be
> >> inherited will be the one to set PYTHON.
> >
> >
> > Not particularly thrilled about this usage it seems error prone
> >>
> >>
> >>
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>  meta/classes/python3native.bbclass | 6 +++---
> >>  meta/classes/pythonnative.bbclass  | 6 +++---
> >>  2 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/python3native.bbclass
> >> b/meta/classes/python3native.bbclass
> >> index 89665efee8b..da12a714703 100644
> >> --- a/meta/classes/python3native.bbclass
> >> +++ b/meta/classes/python3native.bbclass
> >> @@ -1,8 +1,8 @@
> >>  inherit python3-dir
> >>
> >> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> >> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
> >> -DEPENDS_append = " ${PYTHON_PN}-native "
> >> +PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
> >> +EXTRANATIVEPATH += "python3-native"
> >> +DEPENDS_append = " python3-native "
> >>
> >>  # python-config and other scripts are using distutils modules
> >>  # which we patch to access these variables
> >> diff --git a/meta/classes/pythonnative.bbclass
> >> b/meta/classes/pythonnative.bbclass
> >> index 4cc8b2769c2..ae6600cd155 100644
> >> --- a/meta/classes/pythonnative.bbclass
> >> +++ b/meta/classes/pythonnative.bbclass
> >> @@ -1,11 +1,11 @@
> >>
> >>  inherit python-dir
> >>
> >> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> >> +PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> >>  # PYTHON_EXECUTABLE is used by cmake
> >>  PYTHON_EXECUTABLE="${PYTHON}"
> >> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
> >> -DEPENDS_append = " ${PYTHON_PN}-native "
> >> +EXTRANATIVEPATH += "python-native"
> >> +DEPENDS_append = " python-native "
> >>
> >>  # python-config and other scripts are using distutils modules
> >>  # which we patch to access these variables
> >> --
> >> 2.11.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000056a1e005727f7807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu,=
 Aug 2, 2018 at 3:50 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@inte=
l.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">The last to be inherited behaviour?=C2=A0 That&#39;s the same as t=
he current<br>
behaviour, apart from after my change both pythons are available via<br>
PATH.<br>
<br>
The only change is that inheriting the second class doesn&#39;t wipe out<br=
>
the first class.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
Ok may be then this variable should be made overridable so a recipe can sel=
ect it to be one of two otherwise the default remains as you said=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
Ross<br>
<br>
On 2 August 2018 at 22:05, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 31, 2018 at 10:06 AM Ross Burton &lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; Instead of both classes using ${PYTHON_PN} (which is set by python=
-dir and<br>
&gt;&gt; python3-dir), hardcode the right values so that it is possible to =
inherit<br>
&gt;&gt; both<br>
&gt;&gt; pythonnative and python3native at the same time.<br>
&gt;&gt;<br>
&gt;&gt; If both are inherited then both native Pythons are available, but =
the last<br>
&gt;&gt; to be<br>
&gt;&gt; inherited will be the one to set PYTHON.<br>
&gt;<br>
&gt;<br>
&gt; Not particularly thrilled about this usage it seems error prone<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel=
.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/python3native.bbclass | 6 +++---<br>
&gt;&gt;=C2=A0 meta/classes/pythonnative.bbclass=C2=A0 | 6 +++---<br>
&gt;&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/python3native.bbclass<br>
&gt;&gt; b/meta/classes/python3native.bbclass<br>
&gt;&gt; index 89665efee8b..da12a714703 100644<br>
&gt;&gt; --- a/meta/classes/python3native.bbclass<br>
&gt;&gt; +++ b/meta/classes/python3native.bbclass<br>
&gt;&gt; @@ -1,8 +1,8 @@<br>
&gt;&gt;=C2=A0 inherit python3-dir<br>
&gt;&gt;<br>
&gt;&gt; -PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYT=
HON_PN}&quot;<br>
&gt;&gt; -EXTRANATIVEPATH +=3D &quot;${PYTHON_PN}-native&quot;<br>
&gt;&gt; -DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
&gt;&gt; +PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python3-native/python3&qu=
ot;<br>
&gt;&gt; +EXTRANATIVEPATH +=3D &quot;python3-native&quot;<br>
&gt;&gt; +DEPENDS_append =3D &quot; python3-native &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # python-config and other scripts are using distutils module=
s<br>
&gt;&gt;=C2=A0 # which we patch to access these variables<br>
&gt;&gt; diff --git a/meta/classes/pythonnative.bbclass<br>
&gt;&gt; b/meta/classes/pythonnative.bbclass<br>
&gt;&gt; index 4cc8b2769c2..ae6600cd155 100644<br>
&gt;&gt; --- a/meta/classes/pythonnative.bbclass<br>
&gt;&gt; +++ b/meta/classes/pythonnative.bbclass<br>
&gt;&gt; @@ -1,11 +1,11 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit python-dir<br>
&gt;&gt;<br>
&gt;&gt; -PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYT=
HON_PN}&quot;<br>
&gt;&gt; +PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python-native/python&quot=
;<br>
&gt;&gt;=C2=A0 # PYTHON_EXECUTABLE is used by cmake<br>
&gt;&gt;=C2=A0 PYTHON_EXECUTABLE=3D&quot;${PYTHON}&quot;<br>
&gt;&gt; -EXTRANATIVEPATH +=3D &quot;${PYTHON_PN}-native&quot;<br>
&gt;&gt; -DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
&gt;&gt; +EXTRANATIVEPATH +=3D &quot;python-native&quot;<br>
&gt;&gt; +DEPENDS_append =3D &quot; python-native &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # python-config and other scripts are using distutils module=
s<br>
&gt;&gt;=C2=A0 # which we patch to access these variables<br>
&gt;&gt; --<br>
&gt;&gt; 2.11.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000056a1e005727f7807--
