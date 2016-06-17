Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAE062132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 21:43:16 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id y82so481099itf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZYCQz/n+PUXwMFwmayouzpqkd0sB9Hv+cagJZeMQcRw=;
	b=YZvTbwqNNaUkayKJ8Qui9vTR8nZOD58jaBs3R5C+J3JNf1ql34izfDWR4S6yhDuMDq
	eCruY7w8oFebb9dg8n0fA5oTxdd6owXW1eDhc4tT9SfnF7teJjBmfI8jsPhiCFz6UHtV
	Jc/FF3C5/sRL7zVuquksrwV096gkm45Ia36ijZey/LA4mRefzZVcPqxQohTxC/exTbyr
	WYudlFg6PyDRzVPMheiM5S9rpfCmAng562o0Sh+yhutBC6cugTAle+CPbYCHtRz9wNmc
	we/jY2l2H09/UXicNPfVNP0PK91Q3/p5XuFJ73Gi0s+uRPmtm1BZyBYgMG0wbmpzZMch
	UfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ZYCQz/n+PUXwMFwmayouzpqkd0sB9Hv+cagJZeMQcRw=;
	b=f0qUuedl3mKh121axz82csTzDSqPl5DCaDUEgzMZfe/lyhtexApxi+NsnWvPWSvMRc
	H8QzCQgx0CbB/+a27dShK9XOSfcPM0RGCg+EgXn9+H1Bi8R//UQyx7tIyFLuDxPOsiEn
	qa3rA/fi2CP38S3S/qyeeRz+IBAf/9Jfw9dkh81gTEY63vva8pIwfIGB1qJOOaYMu4+u
	wUR06H+gZ3HACxZwCoEQgN0xn1DlL/nDg4+9VFDdEUqTpeqXpTvrdObk4SINgm5BIiEA
	gFbKgbd5IF5wxzBHP+Uu90jbqU5gQO7cU2Asa1bRKtU9ck5oHVyWmr30IKYNJucXlkF4
	8M8Q==
X-Gm-Message-State: ALyK8tI+63ye7vtmYfTXcD60cmv4M6qkDWllmeggbWS4fDkV2zNG/QkBjjEF5QMzLKYmofcmjLDGa5kE/4rYpQ==
X-Received: by 10.36.218.68 with SMTP id z65mr992246itg.19.1466199797162; Fri,
	17 Jun 2016 14:43:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Fri, 17 Jun 2016 14:42:57 -0700 (PDT)
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E5718DD13@fmsmsx111.amr.corp.intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E5718DD13@fmsmsx111.amr.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 17 Jun 2016 14:42:57 -0700
X-Google-Sender-Auth: BW3uVBIxV60wskJlpW_-gSXWDoU
Message-ID: <CABcZANkPQBWukZTtzz69JQZHOFRpnXyPV1BvP8Bv-CZqqRtSkA@mail.gmail.com>
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW25
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
X-List-Received-Date: Fri, 17 Jun 2016 21:43:17 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b09b41468ae0535803ec8

--94eb2c0b09b41468ae0535803ec8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 8:31 AM, Jolley, Stephen K <
stephen.k.jolley@intel.com> wrote:

> =C2=B7        There is a multilib issue related to the layout of the host
> libraries leaking into python=E2=80=99s build process which we=E2=80=99re=
 struggling to
> debug


Could I get some details on this? I've seen something like this where cmake
and automake are relying on sys.lib from python3-native/python-native to
determine the sitepackages directory, is that the behavior others are
hitting? So python modules end up in /usr/lib/ rather than /usr/lib64/, for
example?

If that's the issue in question, the issue is the mismatch between the
native sys.lib and target. We already patch automake to fall back to using
our libdir + python version to determine the path, but only if it wasn't
able to use sys.lib to do so. If we change that to always use libdir+python
version, it should fix the automake packages. Then we might need to patch
FindPythonLibs in cmake to do the same. I'm testing the automake change
locally now.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0b09b41468ae0535803ec8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Jun 17, 2016 at 8:31 AM, Jolley, Stephen K <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:stephen.k.jolley@intel.com" target=3D"_blank">stephen.k.jolley@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span st=
yle=3D"font-size:10.0pt;font-family:Symbol;color:black"><span>=C2=B7<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0
</span></span></span><u></u><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Arial&quot;,sans-serif;color:black">There is a multilib issue related to=
 the layout of the host libraries leaking into python=E2=80=99s build proce=
ss which we=E2=80=99re struggling to debug</span></blockquote></div><br>Cou=
ld I get some details on this? I&#39;ve seen something like this where cmak=
e and automake are relying on sys.lib from python3-native/python-native to =
determine the sitepackages directory, is that the behavior others are hitti=
ng? So python modules end up in /usr/lib/ rather than /usr/lib64/, for exam=
ple?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I=
f that&#39;s the issue in question, the issue is the mismatch between the n=
ative sys.lib and target. We already patch automake to fall back to using o=
ur libdir + python version to determine the path, but only if it wasn&#39;t=
 able to use sys.lib to do so. If we change that to always use libdir+pytho=
n version, it should fix the automake packages. Then we might need to patch=
 FindPythonLibs in cmake to do the same. I&#39;m testing the automake chang=
e locally now.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div>
</div></div>

--94eb2c0b09b41468ae0535803ec8--
