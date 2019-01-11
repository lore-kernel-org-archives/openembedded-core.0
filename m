Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0F07C15C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 13:15:14 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id h193so2830933ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bZGpoGwPJFXFvHhbg5LXMkvKixlRk7uSgLaiBSHYBoY=;
	b=FEOjJQedntIj7MIIXhU6AgwGDCkVs/6C0jeiFZFqoj/r7T1hRQm4bx+KbZDKDc8bDh
	bFY4NV3XO6Kv28V0RB2l9ty9iTnGpHCTQon+EEmoYwjwhl1pIeUKuUyq/CXVVxckcDwl
	2vOcsXoho9Q39OB/QAF5Sz1DWRn4QDfFBRjGNXAkAw9qTXXHlW0UrZ/jkql+sNlRESnZ
	+zuoXkP3mZ3RqWFOgctF3Vo35wzJuNGAoTUrRJzeGR49nnlVIYpnAA+/zsDXrCArEyK5
	Xc9hYhkDTZ7P6xLkY4CxqGYKNeNjcRFHLsyRqUsfJGvHKALjKNQPBzNaUE0LWy8qGpLA
	U8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bZGpoGwPJFXFvHhbg5LXMkvKixlRk7uSgLaiBSHYBoY=;
	b=NFF80c+J2XwlKhsa40Hh69czTW5kR8BRTG1YibnQlRS8Rrj7r2ZoJvH6EToi7KPdyu
	NZW4sPoc2JVz4ARcF0H8aBrO1gQzDurKyXnn/m6IeaE3VwwyHtPeEMyMzzhYIRh/ikbE
	b0agcEAktUjiLFKMV9lB+c3i4BYwtzkkEJbOg8Eg16NWp/erEZdXzVIithJXHKRKb1eb
	OwT1SOpgyFmHdnY6Uh4HwWij0mpQZtJ9MLORYqjAv+tVLNSc+Ra1kEXc4F0jRXJH3nMq
	76zcqSCHAEcoX9uFbwKFmzJ8nnpbieJNvU7kCNg8ZypvYCiKIhvv6qjlMXJ/Fb3xqW+/
	UoGg==
X-Gm-Message-State: AJcUukcWihOUUWkRS1M+o1SEq0LQYWWJdryRW1FLwPX0Qb+2KmzJ1zWp
	Epfzl/6ZlpJPvrLMxGQWFkJHPvwZuAIYDo6ngePbZg==
X-Google-Smtp-Source: ALg8bN5Nh5og85nVxd9mGbITvaBKGUSs6J1lFd+oxK+af0zQyX8ZtxYlSDyk7gYJ4QPaPiat3mU7G0yDTEz4B0biHPA=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr1020078itj.62.1547212515126;
	Fri, 11 Jan 2019 05:15:15 -0800 (PST)
MIME-Version: 1.0
References: <20190104024910.674-1-kai.kang@windriver.com>
	<69a099eb-d6ee-5464-ad35-a267895b2e58@windriver.com>
In-Reply-To: <69a099eb-d6ee-5464-ad35-a267895b2e58@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2019 13:15:03 +0000
Message-ID: <CAJTo0LbeKM_CFGsbq1-SJdaBpWGz10B_jy+8t4i97x0LeAeesg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: update test case test_qemu
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
X-List-Received-Date: Fri, 11 Jan 2019 13:15:14 -0000
Content-Type: multipart/alternative; boundary="0000000000005b4485057f2e7c2b"

--0000000000005b4485057f2e7c2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm wondering what the point of checking the output of mount is.  If we're
just checking that the image booted then the grep is sufficient right?

Ross

On Fri, 11 Jan 2019 at 09:22, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/1/4 =E4=B8=8A=E5=8D=8810:49, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > It checks output of mount in wic test case test_qemu. But the outputs a=
re
> > different between sysvinit and systemd. Add assertion for systemd.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> > index 36ee5e5a14..a6bc566166 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -627,7 +627,10 @@ class Wic2(WicTestCase):
> >           with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
> >               cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
> >               status, output =3D qemu.run_serial(cmd)
> > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
> > +            if 'sysvinit' in get_bb_var('DISTRO_FEATURES'):
> > +                self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
> > +            else:
> > +                self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
> >               cmd =3D "grep UUID=3D /etc/fstab"
> >               status, output =3D qemu.run_serial(cmd)
> >               self.assertEqual(1, status, 'Failed to run command "%s":
> %s' % (cmd, output))
>
>
> Ping
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005b4485057f2e7c2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m wondering what the point of checking the output of=
 mount is.=C2=A0 If we&#39;re just checking that the image booted then the =
grep is sufficient right?<div><br></div><div>Ross</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Fri, 11 Jan 2019 at 09:22, Kang Kai &l=
t;<a href=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex">On 2019/1/4 =E4=B8=8A=E5=8D=8810:49, <a hr=
ef=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.c=
om</a> wrote:<br>
&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; It checks output of mount in wic test case test_qemu. But the outputs =
are<br>
&gt; different between sysvinit and systemd. Add assertion for systemd.<br>
&gt;<br>
&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" =
target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selft=
est/cases/wic.py<br>
&gt; index 36ee5e5a14..a6bc566166 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; @@ -627,7 +627,10 @@ class Wic2(WicTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&#39;wic-image-mi=
nimal&#39;, ssh=3DFalse) as qemu:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;mo=
unt |grep &#39;^/dev/&#39; | cut -f1,3 -d &#39; &#39; | sort&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =
=3D qemu.run_serial(cmd)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, &#=
39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt&#39=
;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;sysvinit&#39; in ge=
t_bb_var(&#39;DISTRO_FEATURES&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEq=
ual(output, &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev=
/sda4 /mnt&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEq=
ual(output, &#39;/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev=
/sda4 /mnt&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;gr=
ep UUID=3D /etc/fstab&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =
=3D qemu.run_serial(cmd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual=
(1, status, &#39;Failed to run command &quot;%s&quot;: %s&#39; % (cmd, outp=
ut))<br>
<br>
<br>
Ping<br>
<br>
-- <br>
Kai Kang<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005b4485057f2e7c2b--
