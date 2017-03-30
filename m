Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id A17AC77D5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:51:00 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id o67so40161537oib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xa/Fcy6jeawUqCk4HKQGnFXNUP/aBkzepRBDz1FKcy4=;
	b=EieYsZXi6tsLbizZ6YrL1TGq6lRfJ/FQWcs0nAcH1Hx2cRV2vbOh/xqxwBD3wVrHG2
	vki2R5DxWXWESdjgiuIBA486LnVLwBQR5Q8HZZN6tW+GkPDFy9z24rx3iwwqVF92u8ge
	qH7cDasssoXCLQXCjEe49uewOUOEOu2WGw7DvpP7BPo0nksh7fKazKT/+hCBjcssJkG4
	D1CR7/1umaP86qMmiLBDcEmr5eOX7mrW1T5uGEIqhMiW/F7CsU4EHpiDioSp9z2+MOdA
	3ISRDBDtzupiFd5J/bZ1uL1Ygtg22DazF853K1RqJ2lQiaeRq2KElvHKSxn4QgK/5/cl
	Nyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xa/Fcy6jeawUqCk4HKQGnFXNUP/aBkzepRBDz1FKcy4=;
	b=fxVsfMfi5uCoa8nQxf42j+snRR01/dykB5ZRMyViqffNVO7qdpJ+jHo2tWQRkn9som
	166fxW3ZgJvEffzUdkqDQFnAHbjbwR1jDb+J5wnpP8mgiH08uTFiueFAj8BihliYvzzh
	XW1DYLMe3t7lnvucaYbA3t8RKYsqXU+/wawgQZpf3bn2ZpPd+5G8QiJeeyK8Y5UI83gM
	Xf7zSc+cApL5+5+Z++Mf7gyT8+p823cDvU0u5pFWlPC6t3tI/biDAVVOGopTSwXAAxcF
	kHOoTgZdtsx04vJ5fLsGCgFy3nAB3jG4/qoEmTRZokijxi7i56VtlWbPOeLmgqkmOwvU
	nBpQ==
X-Gm-Message-State: AFeK/H2gtlhfmJmw9GtgLjY7BL2CxDvsjONGYJai1TBOBLj5iYhLsPmq1ysnChvWVSeFe7nSsIpbV7LZ4Tj/Wg==
X-Received: by 10.157.48.8 with SMTP id d8mr881199otc.15.1490899861502; Thu,
	30 Mar 2017 11:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.32.161 with HTTP; Thu, 30 Mar 2017 11:50:41 -0700 (PDT)
In-Reply-To: <b3461cd0-8336-3c15-5a5b-193fb68ed3ad@cisco.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
	<a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
	<CAJTo0La9kxbzE4drCC5YP-2sZb+6WeBqwH1jw8yGgzaYLi+EWw@mail.gmail.com>
	<b3461cd0-8336-3c15-5a5b-193fb68ed3ad@cisco.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 30 Mar 2017 11:50:41 -0700
Message-ID: <CABcZAN=5Xohyw3HJ4wtUxV3-j2rTA=tMcQka0NfqWqUZUAOanQ@mail.gmail.com>
To: Serhii Popovych <spopovyc@cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Thu, 30 Mar 2017 18:51:01 -0000
Content-Type: multipart/alternative; boundary=001a113e1740a40132054bf72cd7

--001a113e1740a40132054bf72cd7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 11:30 AM, Serhii Popovych <spopovyc@cisco.com>
wrote:

> >
> > On 29 March 2017 at 13:51, Serhii Popovych <spopovyc@cisco.com
> > <mailto:spopovyc@cisco.com>> wrote:
> >
> >     That's great. What the subject of this change in openembedded-core?
> >     I wish to test it.
> >
> >     Because with current *master* I see problem is still here.
> >
> >
> > "    sysroot-relativelinks: also consider links to dirs on the host"
> > oe-core c5b522378fff13962a5187d9d09979866f805cb5, now in master.
>
> Tested, works for SDK, but does not work for buildtools-tarball
> (e.g. bitbake buildtools-tarball).


Ah, that makes sense, sysroot-relativelinks being run is handled by
image.bbclass at this time, which wouldn=E2=80=99t be inherited for that re=
cipe.
Perhaps add this to the recipe:

    POPULATE_SDK_POST_TARGET_COMMAND +=3D =E2=80=9Crootfs_sysroot_relativel=
inks;"
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113e1740a40132054bf72cd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 30, 2017 at 11:30 AM, Serhii Popovych <span dir=3D"ltr">&lt;<a =
href=3D"mailto:spopovyc@cisco.com" target=3D"_blank">spopovyc@cisco.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">&gt;<br>
&gt; On 29 March 2017 at 13:51, Serhii Popovych &lt;<a href=3D"mailto:spopo=
vyc@cisco.com">spopovyc@cisco.com</a><br>
</span><span class=3D"gmail-">&gt; &lt;mailto:<a href=3D"mailto:spopovyc@ci=
sco.com">spopovyc@cisco.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s great. What the subject of this change i=
n openembedded-core?<br>
&gt;=C2=A0 =C2=A0 =C2=A0I wish to test it.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Because with current *master* I see problem is stil=
l here.<br>
&gt;<br>
&gt;<br>
&gt; &quot;=C2=A0 =C2=A0 sysroot-relativelinks: also consider links to dirs=
 on the host&quot;<br>
&gt; oe-core c5b522378fff13962a5187d9d09979<wbr>866f805cb5, now in master.<=
br>
<br>
</span>Tested, works for SDK, but does not work for buildtools-tarball<br>
(e.g. bitbake buildtools-tarball).</blockquote></div><br>Ah, that makes sen=
se, sysroot-relativelinks being run is handled by image.bbclass at this tim=
e, which wouldn=E2=80=99t be inherited for that recipe. Perhaps add this to=
 the recipe:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra"><span style=3D"font-size:12.800000190734863px">=C2=A0 =C2=A0 POPULAT=
E_SDK_POST_TARGET_</span><wbr style=3D"font-size:12.800000190734863px"><spa=
n style=3D"font-size:12.800000190734863px">COMMAND +=3D =E2=80=9Crootfs_sys=
root_relativelinks;&quot;</span><br>-- <br><div class=3D"gmail_signature"><=
div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmai=
l dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software=
 Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a113e1740a40132054bf72cd7--
