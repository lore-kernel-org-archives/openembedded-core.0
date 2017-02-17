Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 55A86772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:41:53 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id y13so5816703oty.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N386dNYRXt+Y4YdtbHqVokgCzT3cojLQzqX0UO+OEYw=;
	b=nhHq7IVCR7yRJelhIzH4z34AY5lhvu9SaVr+/xv6cki1lhyb7LWi8ObPkaaQDGoct5
	5jdMH/4uLZADlzeWPcT7svzFk8Ndk+akAY3MYJ/kJgY/U79MHoPDhknEdxI0cR4qdd8K
	7Zn/ikdgkr2Qm4flIcRuuZ3Hu47eoQkilbpO2xrqRBUK+xUlxJOBt6F9P+l+/KVbwSKE
	qiTnzZPTajlirnsOsHuSb2N3AHS5jMHfOzwBHbo2ilS6ipu9KIktKroIa0NCL2q819qd
	VUkZP2X5IlzCqLrjYupJPtHa3P5wgc5GxylgYpCFBe8Kw5mkkSuuZKu/XnX1PO8F8yw1
	FRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N386dNYRXt+Y4YdtbHqVokgCzT3cojLQzqX0UO+OEYw=;
	b=bnmQajudT6X6xbjVeKJZdkrRtavbWUXSH0q7aY5jIxbuyY98BmzRhzmlPB7MluDkx6
	h/E2iltdWhgIR1U4Wi36nNNLzWwbCIWkTAtP+snmJLAi8Qf3eX6KgRQNeLzCycntnQBn
	HApZCnXdIj1KpE2jtoA2Oc37nc1o9YuhI/IxFsj4/jRHYtE94RbuWjcOZFLk0ctJhbPG
	W7c5xTvzgpCg7Jja7aH0EIWS+4QPDVo0rdysKYoUnggdw/lkM45v3uz3fmkCOKi2ps8D
	oV5j2sszGYGXXZ8u5o8+t6hrgmv17HgO3pgm4HXrfvGs17E1mw3pAuCIKgfuP8QsL1ip
	WPzw==
X-Gm-Message-State: AMke39kCYhBUDXlh1m7ns3rSM3VKD2+Z3m84+WjYCGd0y2lt1wQJo5H6b5wZlg3rlrHptKHWFC1+8O2gtS7pZA==
X-Received: by 10.157.31.93 with SMTP id x29mr4997745otx.133.1487371314341;
	Fri, 17 Feb 2017 14:41:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Fri, 17 Feb 2017 14:41:33 -0800 (PST)
In-Reply-To: <CABcZANksgFTdb52szMJVWo4EWxDT9ZA6hpnznHAfGH-KB15CnA@mail.gmail.com>
References: <1487366767-28347-1-git-send-email-anibal.limon@linux.intel.com>
	<CABcZANksgFTdb52szMJVWo4EWxDT9ZA6hpnznHAfGH-KB15CnA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 17 Feb 2017 15:41:33 -0700
Message-ID: <CABcZANmXhMdui8xP67uE7LzVibJa+kmWC5CaC7zNA6wV84EVbg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Fri, 17 Feb 2017 22:41:54 -0000
Content-Type: multipart/alternative; boundary=001a113de47ed72ede0548c19e57

--001a113de47ed72ede0548c19e57
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 3:39 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> On Fri, Feb 17, 2017 at 2:26 PM, An=C3=ADbal Lim=C3=B3n <
> anibal.limon@linux.intel.com> wrote:
>
>> +    parser.add_argument('-l', '--layer', metavar=3D'LAYER_DIR',
>> +            help=3D'Layer to test compatibility with Yocto Project',
>> +            action=3D'store', required=3DTrue)
>>
>
> The behavior of this argument is quite unintuitive. First, this path isn=
=E2=80=99t
> actually used as the layer directory, detect_layers searches down from th=
at
> path to *find* layers in that subdirectory, so the argument isn=E2=80=99t=
 what it
> says it is. Second, why are you making an option mandatory rather than ju=
st
> using arguments?
>
> That is, why `layer-compat-layer.py -l layerpath` rather than
> `layer-compat-layer.py layerpath`. If you change the call to
> `parser.add_argument(=E2=80=98layer=E2=80=99, =E2=80=A6)` it=E2=80=99d ch=
ange to the latter behavior.
>

Worth noting that you could, and probably should, also use nargs=3D=E2=80=
=98+=E2=80=99 to let
the user specify multiple layers to check, rather than a single path, if
you go the latter route, and if not, you could change it to an append style
(for the =E2=80=98action=E2=80=99) argument to accomplish the same.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113de47ed72ede0548c19e57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 17, 2017 at 3:39 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ex=
tra"><span class=3D""><div class=3D"gmail_quote">On Fri, Feb 17, 2017 at 2:=
26 PM, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:aniba=
l.limon@linux.intel.com" target=3D"_blank">anibal.limon@linux.intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_189330376=
0433845203:dp" class=3D"m_1893303760433845203a3s m_1893303760433845203aXjCH=
 m_1893303760433845203m15a4df4b55dec0a4">+=C2=A0 =C2=A0 parser.add_argument=
(&#39;-l&#39;, &#39;--layer&#39;, metavar=3D&#39;LAYER_DIR&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Layer to test compat=
ibility with Yocto Project&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&#39;store&#39;, requir=
ed=3DTrue)</div></blockquote></div><br></span>The behavior of this argument=
 is quite unintuitive. First, this path isn=E2=80=99t actually used as the =
layer directory, detect_layers searches down from that path to *find* layer=
s in that subdirectory, so the argument isn=E2=80=99t what it says it is. S=
econd, why are you making an option mandatory rather than just using argume=
nts?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">T=
hat is, why `layer-compat-layer.py -l layerpath` rather than `layer-compat-=
layer.py layerpath`. If you change the call to `parser.add_argument(=E2=80=
=98layer=E2=80=99, =E2=80=A6)` it=E2=80=99d change to the latter behavior.<=
/div></blockquote></div><br>Worth noting that you could, and probably shoul=
d, also use nargs=3D=E2=80=98+=E2=80=99 to let the user specify multiple la=
yers to check, rather than a single path, if you go the latter route, and i=
f not, you could change it to an append style (for the =E2=80=98action=E2=
=80=99) argument to accomplish the same.<br>-- <br><div class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D=
"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div>=
</div></div></div>
</div></div>

--001a113de47ed72ede0548c19e57--
