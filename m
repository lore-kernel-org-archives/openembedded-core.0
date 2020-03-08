Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id 562F4605A3
	for <openembedded-core@openembedded.org>;
	Sun,  8 Mar 2020 13:08:49 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id q17so2334914uao.12
	for <openembedded-core@openembedded.org>;
	Sun, 08 Mar 2020 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hnsk8Zju3vg9/nzR4jNQPt+bAMKpaTrtpfqF6BxAck8=;
	b=X5HTc5/+xWXRfbvRyNnPvjU7QBQ1g6R7uOxySFvoP0EAp0JDSPApieunN7+jLC1MBt
	PkmfIxgFboRVZrDTreqTPUop2vwImJ3Q3otGj8Jbr/HyP2cmXrn+JZht6U8c1kOwhCQh
	HIVkjYxtujsBKQP4FMmld3EQOV5tY9rqlkRS9Oe7QSvJYHflzO8fzwlzZxQmAX+OMcqy
	rVpU7ii8qjKizASoElqXEJ6TXxGgc7C4p2X9JclAY8ZTjyS/HaQI1ZHFqba1UI05Is7v
	Ltpgd7Dh2dMo4OkFoQmQtwNcMjvK7Uf/7WFBCQD2gxeEK6IF/carcIqnWc/jbV8CTqqa
	/rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hnsk8Zju3vg9/nzR4jNQPt+bAMKpaTrtpfqF6BxAck8=;
	b=j+1sWjh0kKJtAbe0H+soMw6gg+6aH2m5yBBKD8rlqmJhoffuB4u8C3Q7PveUCod54M
	XdsKQ6AeiOq6ea/RVZwpWnpBARRUliNeyFEsWxB3dbo4HVTds2jEZc1dQ5zL8gbfikG2
	hDVxx3tcCx+ov4tcIDEH4kph/BbaD/tiTtKop+fjHapSDda/Ic5U0DwfeatFBqrsFdPq
	DYK8IDxImczsgQ9upSMDwwdWlwu0swgzaWUekgcWcOQBLR3Yr3lBHPeMA4bNwiJxHQDv
	WO4M6+Pe1ubCyaTvRqZTJbGl0T/oxBNFUFbWSDV7ss7/PHM589CrSRDScvDbmO1j/9i+
	0vGg==
X-Gm-Message-State: ANhLgQ22Um+lSWUjD/Th/r3VidH6FePB/y6+UAyKvlkBi68Tza9zyABU
	n0ohITI0sH3IERBZgnivx9EgZOMsMaRnSLxvq7w=
X-Google-Smtp-Source: ADFU+vseIZGIKR9fCyWC5+0K6odAtq0A7rpose5p66l4SKr0YVR31qP+79O4ckt8vKZI0ljxi2uARbvaNpQmjJQ4S/s=
X-Received: by 2002:ab0:a90:: with SMTP id d16mr2374650uak.22.1583672930110;
	Sun, 08 Mar 2020 06:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
	<babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
In-Reply-To: <babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 8 Mar 2020 14:08:38 +0100
Message-ID: <CANNYZj9ryAAC37rCRvxiT10LKpg1uo27H8GPW_o_qrh3X9Qrtw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: M3 build status
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
X-List-Received-Date: Sun, 08 Mar 2020 13:08:49 -0000
Content-Type: multipart/alternative; boundary="00000000000070911605a0579610"

--00000000000070911605a0579610
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Mar 2020 at 09:15, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This is now closer. Alex fixed the libmodule-build-perl and gettext
> reproducibility issues (thanks!), I tracked down a glibc issue and
> procps one I saw locally. On a fresh autobuilder run we saw:
>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/packages/diff-html/
> and
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/packages/diff-html/
>
> which I believe is the remaining blocking issue on coreutils-ptest.
>

Not quite. The coreutils-ptest itself seems to persistently fail here:

AssertionError: Failed ptests:
{'coreutils': ['tests/tail-2/assert.sh']}

so I'd like to have that fixed before it goes in. We have a 100% ptest pass
rate now (except for random timing fluctuations), which I don't want to see
regressed :)

Alex

--00000000000070911605a0579610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 8 Mar 2020 at 09:15, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This is now closer. Alex fix=
ed the libmodule-build-perl and gettext<br>
reproducibility issues (thanks!), I tracked down a glibc issue and<br>
procps one I saw locally. On a fresh autobuilder run we saw:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2020=
0307-mk0v6ljq/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/=
packages/diff-html/</a><br>
and<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2020=
0307-5pvgdd3a/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/=
packages/diff-html/</a><br>
<br>
which I believe is the remaining blocking issue on coreutils-ptest.<br></bl=
ockquote><div><br></div><div>Not quite. The coreutils-ptest itself seems to=
 persistently fail here:</div><div></div><div><br></div><div>AssertionError=
: Failed ptests:<br>{&#39;coreutils&#39;: [&#39;tests/tail-2/assert.sh&#39;=
]}</div><div><br></div><div>so I&#39;d like to have that fixed before it go=
es in. We have a 100% ptest pass rate now (except for random timing fluctua=
tions), which I don&#39;t want to see regressed :)<br></div><div>=C2=A0</di=
v><div>Alex<br></div></div></div>

--00000000000070911605a0579610--
