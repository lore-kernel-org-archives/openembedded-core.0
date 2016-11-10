Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9B68719F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 20:05:32 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id x190so308701582qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dsf58Jbyrmo4EDtK0pPMmNpdr+sXXu0T7e4QRequo9s=;
	b=w+55Mx+q7A7Plb4ijLnhn4/a+4YueVjLmvNwmTkWZTlzQk6/wy9Iay16mVq8rtgMJn
	MT4jeRUoe0qSOyhaiTbbn/q6x0sNLy58mplDUOPmmdkWAwYcDmftdEr2M8DHCXYhOMkW
	I2RkyFNfDWsRThEbAvWLk9n/PJjfp7KM/dvdzKmhiXjexSGm4Euw1AdLGyHrqBF9hW6q
	yWtEH+MsI+o50PXKWgBwlzcW7qq0Ch3WhnVMe9iZOiQVeEgtqhF5FxxqoAYIzzSxpVUg
	oZCmn7R22GmKQN/HZFCzFxfECwOiyvBdKK5UaBLzJFzjskig17o1o60QybiVodyIwjOy
	/32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dsf58Jbyrmo4EDtK0pPMmNpdr+sXXu0T7e4QRequo9s=;
	b=d3ysF7uXYjmVm6Z3EkwucLeSi5AXHC5h8XuuwSouxS1hAfZ8ZNSeUFuDVWmbyyMBhY
	bss3lOMQwMek8j6odiqn690oGUjeG3piJtzRbqCRIUPhkLVbzw+1jyNgZ1XTurRg/Lll
	uKNEY0EXfmLe5wdnb4mGP5HwGVAyCeEtcYv/hI142d8ukzRqwLPW1atEJqF3GxnUI9pa
	fvLdsXvho2yN+J7R9Ah4ZH5bc7bIiilV4luPu+eEoK7kuNa5XeeV3nHO51Fj44IxORw1
	cHgU6OEfkP8cNb8yXwx8trNRnEz7PTCAmNbtTQr1n4Bx+oF7IjaepXYZvgeZcLF8FQd7
	2qwQ==
X-Gm-Message-State: ABUngvfx5RBwLd9g5h+wEfHKa2f5R8zQIBSnFuoYmIhUqNMRLE8czNrN8zrRdX6zKh8Z/ylBdGv1M09jcYyJdY4p
X-Received: by 10.55.5.145 with SMTP id 139mr7709940qkf.77.1478808333269; Thu,
	10 Nov 2016 12:05:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 10 Nov 2016 12:05:12 -0800 (PST)
In-Reply-To: <cdfe7f669ad98f3d36c074e847e9ecd29eeab86b.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<cdfe7f669ad98f3d36c074e847e9ecd29eeab86b.1478779674.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Nov 2016 20:05:12 +0000
Message-ID: <CAJTo0LbnJydYvd8a7e_AXM-h3v7pHB0S_EQUsZyBFu=mS7_L1g@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 06/10] oe-selftest: fix handling of test cases without ID in --list-tests-by
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
X-List-Received-Date: Thu, 10 Nov 2016 20:05:33 -0000
Content-Type: multipart/alternative; boundary=001a114c8f846556f10540f7e550

--001a114c8f846556f10540f7e550
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

> -    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
> for tc in get_testsuite_by(criteria, keyword) ])
> -
> -    print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name',
> 'class', 'module'))
> +    def tc_key(t):
> +        if t[0] is None:
> +            return  (0,) + t[1:]
> +        return t
> +    # tcid may be None if no ID was assigned, in which case sorted() will
> throw
> +    # a TypeError as Python 3 does not allow comparison (<,<=,>=,>) of
> +    # heterogeneous types, handle this by using a custom key generator
> +    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
> \
> +                  for tc in get_testsuite_by(criteria, keyword) ],
> key=tc_key)
>

Wouldn't a shorter (but untested!) form alternative be just?

-    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
for tc in get_testsuite_by(criteria, keyword) ])
+    ts = sorted([ (tc.tcid or 0, tc.tctag, tc.tcname, tc.tcclass,
tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])

Ross

--001a114c8f846556f10540f7e550
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 12:18, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzecki@rn=
dity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:37c"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m1584e36ab07531d6">-=C2=A0 =C2=A0 ts =
=3D sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc=
 in get_testsuite_by(criteria, keyword) ])<br>
-<br>
-=C2=A0 =C2=A0 print(&#39;%-4s\t%-20s\t%-60s\t%-<wbr>25s\t%-20s&#39; % (&#3=
9;id&#39;, &#39;tag&#39;, &#39;name&#39;, &#39;class&#39;, &#39;module&#39;=
))<br>
+=C2=A0 =C2=A0 def tc_key(t):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if t[0] is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=C2=A0 (0,) + t[1:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return t<br>
+=C2=A0 =C2=A0 # tcid may be None if no ID was assigned, in which case sort=
ed() will throw<br>
+=C2=A0 =C2=A0 # a TypeError as Python 3 does not allow comparison (&lt;,&l=
t;=3D,&gt;=3D,&gt;) of<br>
+=C2=A0 =C2=A0 # heterogeneous types, handle this by using a custom key gen=
erator<br>
+=C2=A0 =C2=A0 ts =3D sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, t=
c.tcmodule) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tc in g=
et_testsuite_by(criteria, keyword) ], key=3Dtc_key)</div></blockquote></div=
><br>Wouldn&#39;t a shorter (but untested!) form alternative be just?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><span style=
=3D"font-size:12.800000190734863px">-=C2=A0 =C2=A0 ts =3D sorted([ (tc.tcid=
, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(=
criteria, keyword) ])</span><br style=3D"font-size:12.800000190734863px"></=
div><div class=3D"gmail_extra"><span style=3D"font-size:12.800000190734863p=
x">+ =C2=A0 =C2=A0ts =3D sorted([ (tc.tcid or 0, tc.tctag, tc.tcname, tc.tc=
class, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])</span>=
<br style=3D"font-size:12.800000190734863px"></div><div class=3D"gmail_extr=
a"><span style=3D"font-size:12.800000190734863px"><br></span></div><div cla=
ss=3D"gmail_extra"><span style=3D"font-size:12.800000190734863px">Ross</spa=
n></div></div>

--001a114c8f846556f10540f7e550--
