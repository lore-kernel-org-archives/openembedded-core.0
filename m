Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id C055C60EF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:18:39 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id n7so1491863lam.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6sUiaPMEKfyOZ49DeTP0j+vs5038qv2II9b+iaFEIKY=;
	b=OcVTWza6MdvNubPC941oSzabaQRkYOSjGbjgtygDddpviwWMGxJkxJNxM2gml1XfDz
	qW3TU/zI1If4F6LtBHGFXtEe1YITZ/kM85aurTw3pXij5g392/n9GsVQyICy0JV6kGWY
	XI0ushs/ViIAbL/XLO3W3a+zSDkKX1D92lXq2bFPhyAeBkA459t3eOF4soQEdKTyh4Nn
	bWgz90TF+QArxgW+fvPO5E9mFRG91/6yHRt+9SgmddJLhzwS+z7U3qGDi9axWrWHAQh5
	JWG4mvkWMixLDT8xWFK+L9BUpCa/Hb4zsCXo6UvzeiLkbI0pwz2RCFdrjfbMVE+xlrD3
	n7Yw==
X-Received: by 10.152.7.67 with SMTP id h3mr1894736laa.29.1386947918653; Fri,
	13 Dec 2013 07:18:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.22.169 with HTTP; Fri, 13 Dec 2013 07:18:18 -0800 (PST)
In-Reply-To: <CABcZAN=usCwUpjWFy2G9D2VPUAhPhBFCVRp0UzVpg6=Lks3goQ@mail.gmail.com>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
	<20131213150826.GC3715@jama>
	<CABcZAN=usCwUpjWFy2G9D2VPUAhPhBFCVRp0UzVpg6=Lks3goQ@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 13 Dec 2013 08:18:18 -0700
Message-ID: <CABcZANkxCEf1U+c+yiNN9B2mcijeS+-BkxtnkQ8tt2EbNV=kUQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 15:18:41 -0000
Content-Type: multipart/alternative; boundary=001a11c21fba036e8c04ed6bfa92

--001a11c21fba036e8c04ed6bfa92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 8:12 AM, Chris Larson <kergoth@gmail.com> wrote:

> On Fri, Dec 13, 2013 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>
>> > +do_compile () {
>> > +    for field in ${OS_RELEASE_FIELDS}; do
>> > +        if eval "test -n \"\$$field\""; then
>> > +            eval "printf \"%s=3D%s\n\" \"\$field\" \"\$$field\""
>> > +        fi
>> > +    done >os-release
>> > +}
>> > +do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"
>>
>> Isn't this dependency picked automatically?
>>
>
> No, this is expanded, so this adds the dependency on the variables whose
> names are in the OS_RELEASE_FIELDS variable, not just on OS_RELEASE_FIELD=
S
> itself. Due to the use of eval, bitbake doesn=E2=80=99t know we=E2=80=99r=
e using the
> iterated values as variable names.


To put it perhaps more clearly and succinctly, do_compile[vardeps] +=3D
=E2=80=9COS_RELEASE_FIELDS=E2=80=9D would be unnecessary, do_compile[vardep=
s] +=3D
=E2=80=9C${OS_RELEASE_FIELDS}=E2=80=9D isn=E2=80=99t :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c21fba036e8c04ed6bfa92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Dec 13, 2013 at 8:12 AM, Chris Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><div class=3D"gmail_quote"=
>On Fri, Dec 13, 2013 at 8:08 AM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>&gt; +do_compile () {<br>
&gt; + =C2=A0 =C2=A0for field in ${OS_RELEASE_FIELDS}; do<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if eval &quot;test -n \&quot;\$$field\&qu=
ot;&quot;; then<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;printf \&quot;%s=
=3D%s\n\&quot; \&quot;\$field\&quot; \&quot;\$$field\&quot;&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; + =C2=A0 =C2=A0done &gt;os-release<br>
&gt; +}<br>
&gt; +do_compile[vardeps] +=3D &quot;${OS_RELEASE_FIELDS}&quot;<br>
<br>
</div></div>Isn&#39;t this dependency picked automatically?<br>
<div></div></blockquote></div><br></div>No, this is expanded, so this adds =
the dependency on the variables whose names are in the OS_RELEASE_FIELDS va=
riable, not just on OS_RELEASE_FIELDS itself. Due to the use of eval, bitba=
ke doesn=E2=80=99t know we=E2=80=99re using the iterated values as variable=
 names.</blockquote>

</div><br>To put it perhaps more clearly and succinctly, do_compile[vardeps=
] +=3D =E2=80=9COS_RELEASE_FIELDS=E2=80=9D would be unnecessary, do_compile=
[vardeps] +=3D =E2=80=9C${OS_RELEASE_FIELDS}=E2=80=9D isn=E2=80=99t :)<br>-=
- <br>Christopher Larson<br>clarson at kergoth dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--001a11c21fba036e8c04ed6bfa92--
