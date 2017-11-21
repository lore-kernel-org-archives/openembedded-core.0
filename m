Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0682F78644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:15:18 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id i38so19056391iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y7hoX9zv3IWjOtgRG5oX7/tNA/QfmWNmTW5M0sjgceY=;
	b=02IVJSK73J6vH2WC7XBd24NYIUMBQrgRelx8SlSB6anN/XbQzsn9EsyNkkzZvQ1Ejq
	YY2Mh+e+1OfMAIiRddMNnXoV3N/vUdcqnM4YbP+vagV+3tcsVxbQkwPV/ZPuPvYu+O+U
	V9jYNySDhbqxGBMDKobWMoQJ1xWH2liHWfgkG/Pcx/KBk4rT8ZKNcX5kpHgxsuw3JXnN
	yJHp+vOFm2SSHa+7JbqBrsIrfOAjSXErULFEXDtnoh8vKMeX3NTQkJSclYUmJDUzcdQ1
	ADYf84bvDnT1aimm4qsYQYDz8MyyBLMeE6Fq7zJsliq6U6p3DIbrYeEbAxLNEtAwLbFK
	yyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y7hoX9zv3IWjOtgRG5oX7/tNA/QfmWNmTW5M0sjgceY=;
	b=QAfVMU45lgmmJrZFo+UOOgXvbM21NrZocDiWhWt4I58kvw9HWrFLmC0PvFm8KywIQo
	kAkMFgaoJrPjmO2OAXoF3VLIdJxC0O6fRmbd70L9mZvZXqg4hBlhU9q9KxoQWO2L0aij
	Bb5FyTWQZ5LjvQ7PLGb0URVD8qSLXlwEZmm6wD9BNvsge3bx/UT+Mk4pC/MGVoHm0OKq
	Hf/uRSRS/6pgwSn8ChYNX08eZG9RAk2v+orFFpjtBvKLUFfdZUfX1gKRWk8635RJ8+b3
	01z4JKONJ73uW8t98gY2zfMJNApMgxbvxCiDBB3FaaQ3swjpNzT3MdLPhE37NcsOCyQt
	uTfw==
X-Gm-Message-State: AJaThX4QCoHlSbdA2bGSjfFn+FYJ9lu1MPbknFotKFG0LsTWRIlw2ciZ
	G1pXjpyL6KettLrrlroPkJwTbQWCXuvIRgVtr0mUzg==
X-Google-Smtp-Source: AGs4zMYCuoP+f0MNTlpSi9EuSGfQ0B9WoA0yVCUg4bX3VXjK/uAVlvXUdN8ZNaTGe5TD7FLXVSrAcl0SdzAjf9gH4Mc=
X-Received: by 10.107.178.145 with SMTP id b139mr17703077iof.52.1511262920045; 
	Tue, 21 Nov 2017 03:15:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 03:14:59 -0800 (PST)
In-Reply-To: <1511262584.862.32.camel@linuxfoundation.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511262584.862.32.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 11:14:59 +0000
Message-ID: <CAJTo0LZkw--E9N3DXHQHFAWJEnjUJe_SiJjzDN3YzeD1+8TXpQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "Xu,
	Chi" <Chi.Xu@windriver.com>, "WOLD, SAUL" <saul.wold@intel.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Tue, 21 Nov 2017 11:15:19 -0000
Content-Type: multipart/alternative; boundary="001a114ca162831801055e7c5184"

--001a114ca162831801055e7c5184
Content-Type: text/plain; charset="UTF-8"

On 21 November 2017 at 11:09, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > > o   Issues with 4.13.10 host kernels booting kvm x86 guests on
> > > Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12
> > > helps)
> >
> > Robert, can you test Fedora 26. It would help to have a defect open
> > with steps to reproduce or
> > something about the typical workflow/ build time/ day of the week/
> > phase of the moon.
>
> FWIW we have noticed that the choice of kernel timers seems to vary in
> the x86_64 boots but not with a pattern that matches the hangs.



Also of note is that last week the cluster was hitting this once in every
nightly run, but after a complete reboot and kernel upgrade we haven't seen
it so far.  So either it's gone with the latest kernels, or it's a slow
accumulation of non-movable memory that eventually breaks kvm (my money is
on the latter).


> > > o   a perf build race (bug 12302)
> >   I'll take a look to:
> >  - see if I can duplicate the bug on a fast build host
> >  - check upstream to see if the bug is known/fixed
> >  - see if I can spot a race in the build rules.
>
> Sounds good, thanks!


It looks and sounds like a classic makefile dependency bug, should be
reproducible on demand with careful explicit target steps.  The perf
makefiles are not exactly easy to hack though...

Ross

--001a114ca162831801055e7c5184
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 November 2017 at 11:09, Richard Purdie <span dir=3D"=
ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div class=3D"HOEnZb"><div class=3D"h5"><span style=3D"color:rgb(34,34,34)=
">&gt; &gt; o=C2=A0=C2=A0 Issues with 4.13.10 host kernels booting kvm x86 =
guests on</span><br></div></div><span class=3D"">
&gt; &gt; Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12<br>
&gt; &gt; helps)<br>
&gt; =C2=A0<br>
&gt; Robert, can you test Fedora 26. It would help to have a defect open<br=
>
&gt; with steps to reproduce or<br>
&gt; something about the typical workflow/ build time/ day of the week/<br>
&gt; phase of the moon.=C2=A0<br>
<br>
</span>FWIW we have noticed that the choice of kernel timers seems to vary =
in<br>
the x86_64 boots but not with a pattern that matches the hangs.</blockquote=
><div><br></div><div><br></div><div>Also of note is that last week the clus=
ter was hitting this once in every nightly run, but after a complete reboot=
 and kernel upgrade we haven&#39;t seen it so far.=C2=A0 So either it&#39;s=
 gone with the latest kernels, or it&#39;s a slow accumulation of non-movab=
le memory that eventually breaks kvm (my money is on the latter).</div><div=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; &gt; =
o=C2=A0=C2=A0 a perf build race (bug 12302)<br>
&gt; =C2=A0=C2=A0I&#39;ll take a look to:<br>
&gt; =C2=A0- see if I can duplicate the bug on a fast build host<br>
&gt; =C2=A0- check upstream to see if the bug is known/fixed<br>
&gt; =C2=A0- see if I can spot a race in the build rules.<br>
<br>
</span>Sounds good, thanks!</blockquote><div><br></div><div>It looks and so=
unds like a classic makefile dependency bug, should be reproducible on dema=
nd with careful explicit target steps.=C2=A0 The perf makefiles are not exa=
ctly easy to hack though...</div><div><br></div><div>Ross</div></div></div>=
</div>

--001a114ca162831801055e7c5184--
