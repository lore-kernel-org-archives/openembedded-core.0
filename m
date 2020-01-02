Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6B17FC41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:06:10 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id y3so9975995uae.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 10:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8+uW/TWy5t2dIzXOJfAELLin7ZyoJsOJ9Q4afSn5JYg=;
	b=PHWhz8T4xDZa0k2jt42HNBz6Diysmn7ep2e7tOCMcMVm/EIIa+69sgW8EZvPJD1PT4
	2/oJFZhIC+mKZThML/KZzTCwPwuAd+35A+XX97MQk6572ks85v/rHpQNAs/8eWXw5K09
	iVJeiifOasSB4HsceNcwqjfry1FV7pL3GY9U2GehnX9SRXCKGTuNkfOos1wrEH9Lw+bt
	G8PqN+qPg/N4ZTmfYN7LXuT2/gavCzQbEuzKkZPqnyQS1sZtngPKes/MpNxZwu+bIn9l
	yHgg4/R2MlopIoaMVcfx9m1jU0njIvrK73QlR0YO5fgCLkaB4d9CvKa02M86bXPY6Vs6
	c1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8+uW/TWy5t2dIzXOJfAELLin7ZyoJsOJ9Q4afSn5JYg=;
	b=TcqxDzKB9DWqLz7OE52Zbvo/VGWnbsN4Tf6wPCJKraaDCOZcJA+V8N8eLQBhSQ2RoK
	5y8vvwdjYI4vgEFksqFd0OUCpinqhA6OfBHuwez1ssfKEa5bGvhTQJlG/nKX32jKdOja
	/KxJ+/FduoKx6oWIgkgrAiokjBoO7D37tSG3kyEvzi7nPCLsC++LE4D54WTrbj/6R3eh
	mUCLEv7svS/h316CyXi3TkCyvwoFIN62h38dSRNq1Xkwg4I71nxgwXOdGstjix8bhD8V
	CMn0H1JIjKcOVnsKoC7Sge0w8/E5MW5D9g8bMXKD9zeuN2RuZ+3aZnDbN2BTfwWd8t1p
	kkVQ==
X-Gm-Message-State: APjAAAWoHvRHD7vADLUffTDydz+fwqjfXCb6HPdhT8GDzBYXd2m16osB
	ncqHRUoeI+lDCZEtPtDd8NkuwfPf1CFOMFHyFtJCUjDyzqbkDg==
X-Google-Smtp-Source: APXvYqyqaWOjXTflqrHcqUvKi+rmth9QY6NAUYjLCpfP4qYKgOjVdMvjFcp66RJoDZ0NiZT72NYPE8NzBCOyjS/nEiQ=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr45733595uae.89.1577988371327; 
	Thu, 02 Jan 2020 10:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-6-alex.kanavin@gmail.com>
	<81f2806c-4107-2ce5-2c0f-4bdd28438fb1@windriver.com>
In-Reply-To: <81f2806c-4107-2ce5-2c0f-4bdd28438fb1@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Jan 2020 19:06:00 +0100
Message-ID: <CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/14] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Thu, 02 Jan 2020 18:06:10 -0000
Content-Type: multipart/alternative; boundary="0000000000005530a3059b2c0ccd"

--0000000000005530a3059b2c0ccd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Jan 2020 at 11:18, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/11/28 =E4=B8=8A=E5=8D=8812:39, Alexander Kanavin wrote:
> > rpm 4.15 no longer allows it, which makes sense.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Hi Alex,
>
> I tried this patch with rpm 4.15 and it fails to run task populate_sdk
> when multilib is enabled and lib32-perl is installed.
>
> IMAGE_INSTALL_append =3D " lib32-perl "
>

I believe this is due to DUMMYPROVIDES_PACKAGES needing the same multilib
expansion as:

DUMMYPROVIDES +=3D "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in
d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"

So that RREPLACES has all the multilib variants included.

However, there is also a different issue, that looks similar, but actually
pre-dates this patch, and rpm 4.15 update:

if you do
IMAGE_INSTALL_append =3D " perl "

(with multilib enabled), a similar error will happen:

Problem: package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl-module-strict provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl-module-warnings provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl-module-vars provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl-module-config provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl-module-warnings-register provided by
perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with /usr/bin/perl provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with libperl.so.5 provided by perl-5.30.1-r0.core2_32
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
obsoletes perl provided by perl-5.30.1-r0.core2_32
  - cannot install the best candidate for the job
  - conflicting requests

Inspecting
/home/alexander/development/poky/build-multilib/tmp/work/qemux86-poky-linux=
/core-image-minimal/1.0-r0/sdk/image/opt/poky/3.0/sysroots/core2-32-poky-li=
nux/etc/dnf/vars/arch,
I see:

core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86_64

Even though sdk_provides_dummy_target should be up-front, rather than in
the middle (so that it takes priority over other architectures).

I could not figure out a good way to fix this, but I think this issue
should be addressed first, and then we can fix the lib32/64-perl issue.


Alex

--0000000000005530a3059b2c0ccd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 2 Jan 2020 at 11:18, Kang Kai &lt=
;<a href=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2019/11/28 =E4=B8=8A=E5=8D=8812:39, Alexander Kanavin w=
rote:<br>
&gt; rpm 4.15 no longer allows it, which makes sense.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
Hi Alex,<br>
<br>
I tried this patch with rpm 4.15 and it fails to run task populate_sdk <br>
when multilib is enabled and lib32-perl is installed.<br>
<br>
IMAGE_INSTALL_append =3D &quot; lib32-perl &quot;<br></blockquote><div><br>=
</div><div>I believe this is due to DUMMYPROVIDES_PACKAGES needing the same=
 multilib expansion as:<br></div><div><br></div><div>DUMMYPROVIDES +=3D &qu=
ot;${@&#39; &#39;.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar(&#3=
9;DUMMYPROVIDES_PACKAGES&#39;).split()])}&quot;</div><div><br></div><div>So=
 that RREPLACES has all the multilib variants included.<br></div><div><br><=
/div><div>However, there is also a different issue, that looks similar, but=
 actually pre-dates this patch, and rpm 4.15 update:</div><div><br></div><d=
iv>if you do <br></div><div>IMAGE_INSTALL_append =3D &quot; perl &quot;</di=
v><div><br></div><div>(with multilib enabled), a similar error will happen:=
</div><div><br></div><div>Problem: package target-sdk-provides-dummy-1.0-r0=
.sdk_provides_dummy_target conflicts with perl provided by perl-5.30.1-r0.c=
ore2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_d=
ummy_target conflicts with perl-module-strict provided by perl-5.30.1-r0.co=
re2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_du=
mmy_target conflicts with perl-module-warnings provided by perl-5.30.1-r0.c=
ore2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_d=
ummy_target conflicts with perl-module-vars provided by perl-5.30.1-r0.core=
2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dumm=
y_target conflicts with perl-module-config provided by perl-5.30.1-r0.core2=
_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy=
_target conflicts with perl-module-warnings-register provided by perl-5.30.=
1-r0.core2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_prov=
ides_dummy_target conflicts with /usr/bin/perl provided by perl-5.30.1-r0.c=
ore2_32<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_d=
ummy_target conflicts with libperl.so.5 provided by perl-5.30.1-r0.core2_32=
<br>=C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_ta=
rget obsoletes perl provided by perl-5.30.1-r0.core2_32<br>=C2=A0 - cannot =
install the best candidate for the job<br>=C2=A0 - conflicting requests</di=
v><div><br></div><div>Inspecting /home/alexander/development/poky/build-mul=
tilib/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/p=
oky/3.0/sysroots/core2-32-poky-linux/etc/dnf/vars/arch, I see:</div><div><b=
r></div><div>core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86_6=
4</div><div><br></div><div>Even though sdk_provides_dummy_target should be =
up-front, rather than in the middle (so that it takes priority over other a=
rchitectures).</div><div><br></div><div>I could not figure out a good way t=
o fix this, but I think this issue should be addressed first, and then we c=
an fix the lib32/64-perl issue.</div><div><br></div><div><br></div><div>Ale=
x<br></div></div></div>

--0000000000005530a3059b2c0ccd--
