Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 67BA575870
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 01:47:24 +0000 (UTC)
Received: by qget71 with SMTP id t71so165305239qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=J+FOf4Zb8i+3PGbRLNQEVuH81OD0OnYovEmcJ+iLPgY=;
	b=chl7lTiwb/ksN6dtxdn5Cgs3YHGqAF0YSIqMcsEXhalR/I6ChKy2FkN5A9StRDKE5q
	/eFwb213rs1vBj7S+NnloWq4IO6nQIZRhk4cUM6bB+F+zJEldBWib23QPO90kw++khFQ
	Zva8cjUEGtyLKmLmqtbsGt4VXg3/XTYqW0LVGGQJehElhQWh2xVozZk3CCbJqpga6+bc
	3bzJjHhwZywpjzeaUozCFIRfB0x98JFkN1Lcps0ZZhl3donr9TVTNyzsyx81qx3R5rq8
	sAvEqEGhzkeQjUcmEtYmemqQimK7mbYnx4Jb/B3d2s8VlwkNAZcXOPAgciZFNP9ql8fJ
	5yjg==
X-Received: by 10.55.31.40 with SMTP id f40mr27854473qkf.18.1436838444587;
	Mon, 13 Jul 2015 18:47:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 13 Jul 2015 18:47:05 -0700 (PDT)
In-Reply-To: <55A46390.2090904@windriver.com>
References: <1436767810-20932-1-git-send-email-xiao.zhang@windriver.com>
	<CABcZANnrGkZLwZC+9qoqQJtCMcxd6z4pcSS5d2=WsnFicqpOaQ@mail.gmail.com>
	<55A46390.2090904@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jul 2015 18:47:05 -0700
X-Google-Sender-Auth: cCEHt5SNUfJG5pAsIY6lLkWXko8
Message-ID: <CABcZANnYq6cpB8JV-Rx2QoK1AnveSUjc6JN5aerVNPN+w5yprg@mail.gmail.com>
To: zhangxiao <xiao.zhang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] logrotate: move binary logrotate back to /usr/sbin
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
X-List-Received-Date: Tue, 14 Jul 2015 01:47:25 -0000
Content-Type: multipart/alternative; boundary=001a114780b816e18b051acc056f

--001a114780b816e18b051acc056f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 6:19 PM, zhangxiao <xiao.zhang@windriver.com> wrote=
:

> On 2015=E5=B9=B407=E6=9C=8813=E6=97=A5 22:28, Christopher Larson wrote:
>
>>
>> On Sun, Jul 12, 2015 at 11:10 PM, Zhang Xiao <xiao.zhang@windriver.com
>> <mailto:xiao.zhang@windriver.com>> wrote:
>>
>>     Upstream-Status: pending
>>
>>     Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com
>>     <mailto:xiao.zhang@windriver.com>>
>>
>>
>> There=E2=80=99s no info on why this is being done, only what=E2=80=99s b=
eing done, in
>> this commit message.
>>
>
> Binary logrotate should be installed in /usr/sbin and int fact, at the ve=
ry
> beginning, it was there. While with commit a46d3646a3e1781be44:
> ...
> logrotate: obey our flags
>
> Needed to quiet GNU_HASH warnings, and some minor fixes.
> ...
>
> Part of its modification as below:
> ...
> -    oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${mandir}
> +    oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${mandir}
> BINDIR=3D${bindir}
> ...
> moves it to /usr/bin. It is not correct, so move it back to
> /usr/sbin with ${sbindir}.
>

That=E2=80=99s entirely reasonable, but at least some reference to that nee=
ds to be
in the commit message, not just email discussion :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114780b816e18b051acc056f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 13, 2015 at 6:19 PM, zhangxiao <span dir=3D"ltr">&lt;<a href=3D=
"mailto:xiao.zhang@windriver.com" target=3D"_blank">xiao.zhang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On 2015=E5=
=B9=B407=E6=9C=8813=E6=97=A5 22:28, Christopher Larson wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span>
<br>
On Sun, Jul 12, 2015 at 11:10 PM, Zhang Xiao &lt;<a href=3D"mailto:xiao.zha=
ng@windriver.com" target=3D"_blank">xiao.zhang@windriver.com</a><br></span>=
<span>
&lt;mailto:<a href=3D"mailto:xiao.zhang@windriver.com" target=3D"_blank">xi=
ao.zhang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Upstream-Status: pending<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@wi=
ndriver.com" target=3D"_blank">xiao.zhang@windriver.com</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:xiao.zhang@windriver.com" target=
=3D"_blank">xiao.zhang@windriver.com</a>&gt;&gt;<span><br>
<br>
<br>
There=E2=80=99s no info on why this is being done, only what=E2=80=99s bein=
g done, in<br>
this commit message.<br>
</span></blockquote>
<br>
Binary logrotate should be installed in /usr/sbin and int fact, at the very=
<br>
beginning, it was there. While with commit a46d3646a3e1781be44:<br>
...<br>
logrotate: obey our flags<br>
<br>
Needed to quiet GNU_HASH warnings, and some minor fixes.<br>
...<br>
<br>
Part of its modification as below:<br>
...<span><br>
-=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${m=
andir}<br></span>
+=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${m=
andir} BINDIR=3D${bindir}<br>
...<br>
moves it to /usr/bin. It is not correct, so move it back to<br>
/usr/sbin with ${sbindir}.<br></blockquote></div><br>That=E2=80=99s entirel=
y reasonable, but at least some reference to that needs to be in the commit=
 message, not just email discussion :)<br>-- <br><div>Christopher Larson<br=
>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<=
br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114780b816e18b051acc056f--
