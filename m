Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 90BDA7C603
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 15:57:05 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id o2so33862789uae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/sDVCmNS28CGlqaFnvwgRPbQpy8nubLWeYa5nu1+6s0=;
	b=QrtSDlLiAFMq1TZY0lpDI7w4+Kgtm0EtOpSMIJ/Aq/+vWukNYWenxCUTBDyzBeqJAw
	r0SjBvB12aTbqI5PUPOOaFMyd5n5C2WrieK2xBXxvpuV7AWTWpHuWQNXLbH4oIMjSBFX
	+geyWKJWAR4gE7oKJmHWJQeBTyltxs+2XKYNxQMb/HBYQa7QimBsx0VuKvehuNq2fqus
	k+50a/vmQjKTeiJfrDKcgriTUFxa9FtP8SNrncWDC2V/iHVEtaW3CPpigpH/3SBTvEBA
	bUxL/e3+5IbeYRmWzCnMp+kTCy8WMZfVtFSvw/EMA7rdAhns0jp372T+tx5mi9AeP+zr
	kDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/sDVCmNS28CGlqaFnvwgRPbQpy8nubLWeYa5nu1+6s0=;
	b=ob1dhjVnzHx7ZG8D6hX7edqOCNYREnjgWljFybq+HiAqBWrV//dgj78MwjcczaZLrj
	0flO8eX4DE12yvCCR/xYoFde6ON2n+6r01S9H6UkCbcu7f5qHg0brk9OX5j4XD3Jrmvs
	p+qm01zJvicHU8wTNGzcWcDVj84ntbfulgBkfFAk4PxpINdh5trCLXarHVGm/xjqn+kW
	wT1ITcY4kG4rpVhDgPc0wlvd7iOh91SxVMrAu0e2mAHxPCssFqTM8pK1LDen4DG+7kWF
	URR8S7NoJFhW+PyykNnYgNQzoGsLgWQStvLMI1HI+lUdGPyWqFVclHpBhSUfrJHq4vSz
	9CFQ==
X-Gm-Message-State: APjAAAV42di9PGrAm5+gif4NAbLAB/a4QV9K1xJEZWGVki+53U4oHjlE
	Y5COAqn8XeF1XVIDTln0Y6Oe5XgNk9XcR4W/bTI=
X-Google-Smtp-Source: APXvYqwq3kknfg9RHIb+MAmFk7yIGPpQxR54xyLq93oYmCRusy5kacJ6ljuF7VAlMhMwYlA9buvvc1pR4I5uPVX56gA=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr2777933ual.100.1565107026524; 
	Tue, 06 Aug 2019 08:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
	<b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
	<CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
	<CANNYZj_4QNNfHr+9rke06rGDrfh-0C9PwqfnAYrT6urf5k62wA@mail.gmail.com>
	<837f692b83714ef0ed412288121e817e7790dae3.camel@linuxfoundation.org>
	<CANNYZj8WgVxSqgih-P=5kgT-+fg1dGwSEqmWkKbn4z22qfE+Qw@mail.gmail.com>
In-Reply-To: <CANNYZj8WgVxSqgih-P=5kgT-+fg1dGwSEqmWkKbn4z22qfE+Qw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 17:56:55 +0200
Message-ID: <CANNYZj_o30FVJfwfLr5=uzFMB8NsArq9Mx5W5EMcmGe67N060Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 15:57:05 -0000
Content-Type: multipart/alternative; boundary="00000000000059fe7e058f74e025"

--00000000000059fe7e058f74e025
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 16:30, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 6 Aug 2019 at 16:16, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> I partly agree with this. There is:
>>
>> insane.bbclass:do_package_qa[rdeptask] = "do_packagedata"
>>
>> which does help the situation by forcing package_qa after all the
>> runtime dependencies.
>>
>> I suspect the real problem is that it can also see RDEPENDS for things
>> it doesn't rdepend upon...
>>
>> You might want package_prepare_pkgdata() from package_pkgdata called
>> for package_qa's context on a separate directory, then to use that as
>> the pkgdata to resolve against?
>>
>> Note that package_prepare_pkgdata() called for do_package is different
>> than package_prepare_pkgdata() called for do_package_qa as the tasks
>> have different dependencies...
>>
>
> I am actually inclined to remove the recursive resolver in insane.bbclass.
> It gives a QA pass to a situation when there is a bash script in A, and the
> bash runtime dependency is satisfied indirectly through a chain of
> arbitrary length: A -> bash-completion -> bash. It becomes hard to reason
> where the dependencies come from; I think any runtime dependencies should
> be explicitly listed. We may need to fix up a few recipes, but the outcome
> is a better definition of runtime dependencies.
>

I made a patch for this:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=77bb080eb15de21901c15072898303f2b5275093

Now building oe-core world, to see what kind of fallout it causes.

Alex

--00000000000059fe7e058f74e025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 16:30, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2=
019 at 16:16, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">I partly agree with this. There is:<br>
<br>
insane.bbclass:do_package_qa[rdeptask] =3D &quot;do_packagedata&quot;<br>
<br>
which does help the situation by forcing package_qa after all the<br>
runtime dependencies.<br>
<br>
I suspect the real problem is that it can also see RDEPENDS for things<br>
it doesn&#39;t rdepend upon...<br>
<br>
You might want package_prepare_pkgdata() from package_pkgdata called<br>
for package_qa&#39;s context on a separate directory, then to use that as<b=
r>
the pkgdata to resolve against?<br>
<br>
Note that package_prepare_pkgdata() called for do_package is different<br>
than package_prepare_pkgdata() called for do_package_qa as the tasks<br>
have different dependencies...<br></blockquote><div><br></div><div>I am act=
ually inclined to remove the recursive resolver in insane.bbclass. It gives=
 a QA pass to a situation when there is a bash script in A, and the bash ru=
ntime dependency is satisfied indirectly through a chain of arbitrary lengt=
h: A -&gt; bash-completion -&gt; bash. It becomes hard to reason where the =
dependencies come from; I think any runtime dependencies should be explicit=
ly listed. We may need to fix up a few recipes, but the outcome is a better=
 definition of runtime dependencies.<br></div></div></div></blockquote><div=
>=C2=A0</div><div>I made a patch for this:</div><div><a href=3D"http://git.=
yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version=
-updates&amp;id=3D77bb080eb15de21901c15072898303f2b5275093">http://git.yoct=
oproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-upd=
ates&amp;id=3D77bb080eb15de21901c15072898303f2b5275093</a></div><div><br></=
div><div>Now building oe-core world, to see what kind of fallout it causes.=
</div><div><br></div><div>Alex<br></div></div></div>

--00000000000059fe7e058f74e025--
