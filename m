Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB5060DF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:03:51 +0000 (UTC)
Received: by igl9 with SMTP id 9so92551465igl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3ygXJKXkhjWd+62ZNHZdDU2u4bTLXDATdxYgXrlahtI=;
	b=dc5eG/6pRp2djBgBYGpxg3NYTlqnCgEKZY1fps+dGELi8ltF06QjPbYSJQxyjLVeNU
	kV38N5CzlkLfb/wZUvNLHosMN2s4QTGOZQesx4/GAI1VKO/FIEof04ilWVw88ogbFRmq
	qejSyc86MvvbhrKRg+NO72wq4rFsx2xJ+/nlXmnpNKdtXpm7lafGJ/jI+GPCsrBaE8Hz
	ft8ky5YhzAle5Hk2sjxlW6xqzEhOPCg+dTNvumMAWvOhgFSMXMKZvAT+xuhn1RvbIgZH
	9EBDS8WhtyWsus42oUAzLEXWSEQz/kyWCc+9KfZ1yfUjYix5/Cd9vGj+CoUqrfniSaln
	yz0w==
X-Received: by 10.50.78.138 with SMTP id b10mr767719igx.10.1447812232457; Tue,
	17 Nov 2015 18:03:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Tue, 17 Nov 2015 18:03:32 -0800 (PST)
In-Reply-To: <CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
	<CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 17 Nov 2015 19:03:32 -0700
Message-ID: <CABcZAN=HG8AJCjWHWTwWGs4vswnEL=SRF81fZz5r+iE+iQZ76g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 6/6] psplash: add systemd support
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
X-List-Received-Date: Wed, 18 Nov 2015 02:03:56 -0000
Content-Type: multipart/alternative; boundary=089e01229eb2d13e830524c70d5e

--089e01229eb2d13e830524c70d5e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 2:36 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 13 November 2015 at 23:10, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>>  meta/recipes-core/psplash/files/psplash-quit.service | 11 +++++++++++
>>  .../recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
>>  meta/recipes-core/psplash/psplash_git.bb             | 20
>> +++++++++++++++-----
>>
>
> This causes the selftest to fail:
> | =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | FAIL: test_systemd_failed (oeqa.runtime.systemd.SystemdBasicTests)
> | ----------------------------------------------------------------------
> | Traceback (most recent call last):
> |   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/=
meta/lib/oeqa/utils/decorators.py",
> line 106, in wrapped_f
> |     return func(*args, **kwargs)
> |   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/=
meta/lib/oeqa/utils/decorators.py",
> line 94, in wrapped_f
> |     return f(*args, **kwargs)
> |   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/=
meta/lib/oeqa/runtime/systemd.py",
> line 65, in test_systemd_failed
> |     self.assertTrue(match, msg=3D"Some systemd units failed:\n%s" % out=
put)
> | AssertionError: None is not true : Some systemd units failed:
> |   UNIT                  LOAD   ACTIVE SUB    DESCRIPTION
> | =E2=97=8F bluetooth.service     loaded failed failed Bluetooth service
> | =E2=97=8F psplash-quit.service  loaded failed failed Terminate Psplash =
Boot
> Screen
> | =E2=97=8F psplash-start.service loaded failed failed Starts Psplash Boo=
t screen


Interesting, is psplash configured in our test environment? Either way,
worst case we can drop this commit for now and can revisit it. I'm heading
out of town tomorrow until December 1st, so likely will be limited in what
I can do to address any issues that crop up during that period. Thanks.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01229eb2d13e830524c70d5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 17, 2015 at 2:36 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><di=
v class=3D"gmail_quote">On 13 November 2015 at 23:10, Christopher Larson <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">=
kergoth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div style=3D"o=
verflow:hidden">=C2=A0meta/recipes-core/<span>psplash</span>/files/<span>ps=
plash</span>-quit.service | 11 +++++++++++<br>
=C2=A0.../recipes-core/<span>psplash</span>/files/<span>psplash</span>-star=
t.service | 11 +++++++++++<br>
=C2=A0meta/recipes-core/<span>psplash</span>/<a href=3D"http://psplash_git.=
bb" rel=3D"noreferrer" target=3D"_blank"><span>pspl</span>ash_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +++++++++++++++-----</div=
></blockquote></div><br></span>This causes the selftest to fail:<br>| =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>| FAIL: test_s=
ystemd_failed (oeqa.runtime.systemd.SystemdBasicTests)<br>| ---------------=
-------------------------------------------------------<br>| Traceback (mos=
t recent call last):<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-qa-systemd/build/meta/lib/oeqa/utils/decorators.py&=
quot;, line 106, in wrapped_f<br>| =C2=A0 =C2=A0 return func(*args, **kwarg=
s)<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-qa-systemd/build/meta/lib/oeqa/utils/decorators.py&quot;, line 94, in=
 wrapped_f<br>| =C2=A0 =C2=A0 return f(*args, **kwargs)<br>| =C2=A0 File &q=
uot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build=
/meta/lib/oeqa/runtime/systemd.py&quot;, line 65, in test_systemd_failed<br=
>| =C2=A0 =C2=A0 self.assertTrue(match, msg=3D&quot;Some systemd units fail=
ed:\n%s&quot; % output)<br>| AssertionError: None is not true : Some system=
d units failed:<br>| =C2=A0 UNIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0LOAD =C2=A0 ACTIVE SUB =C2=A0 =C2=A0DESCRIPTION<br>| =
=E2=97=8F bluetooth.service =C2=A0 =C2=A0 loaded failed failed Bluetooth se=
rvice<br>| =E2=97=8F psplash-quit.service =C2=A0loaded failed failed Termin=
ate Psplash Boot Screen<br>| =E2=97=8F psplash-start.service loaded failed =
failed Starts Psplash Boot screen</blockquote></div><br>Interesting, is psp=
lash configured in our test environment? Either way, worst case we can drop=
 this commit for now and can revisit it. I&#39;m heading out of town tomorr=
ow until December 1st, so likely will be limited in what I can do to addres=
s any issues that crop up during that period. Thanks.<br>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmai=
l dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Ts=
lib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--089e01229eb2d13e830524c70d5e--
