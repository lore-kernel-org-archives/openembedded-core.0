Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1C76012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:20:53 +0000 (UTC)
Received: by lffu14 with SMTP id u14so126276311lff.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CuOp1N8nyLFmqHGwLHIKdx/AshUf8nZcMM9t4B933sQ=;
	b=dufmYdrb0tL4bfk9qoKjPZABvQ7JgVt1jBJXXvXi8UgWtfkxfoUHvcJZaK+omtv0x/
	o2/lOb1TQnUsMa2tVT3ZuFAfhGNnl6ec7jNCDb9RYqLw3ZEBgc43oofoIvh7ZvXat9wH
	IbQkxjiQbEGHQ1+X4IBQNdqVmKyQHPiJVbFsM/MTculhvxfh8i+8P9mXN18E0WH117Dg
	CKuLgGNVDnVDqaId8++KW864ce0fadK2qVfK+4vUbI6vJYijLyf3psqxBLZATjpbpAEt
	6LYCP7tjxSZfC63tgMLTuVEDWPS57+RbpQ74Jcx/E23i0B8hUqVqNdgA+XBU3evqYPJR
	nY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=CuOp1N8nyLFmqHGwLHIKdx/AshUf8nZcMM9t4B933sQ=;
	b=csXSTBK5Sv24Lvqr7PdOwwRSFFWjM7aQLw4hxBAwEqDOs4U+pU9YGDcHB5Gg/w5aS3
	I2lfCxPf1XJ7JBuxMZ+tkK6PQc3wd9wxefdvDB3JaV1N9kcGyYGGAqeLwel2Pha2C7xB
	6GfBA7FgvjPOWPVjRWJfBjpAHPOUhuovTFhtVJ1lHax6calcXW5CtJh6fSXQGXa0Yyot
	fUS5wiuKtIlV85Y5jINA0cu8x4FS50Tlimgq7D0EZBnLZFqV51d/XPzFC4FifmVzv1gI
	4uZQdmaTowYwsOfP6dZA/PjFbHUe6Bn9NVP+gx20FbXHAhOAHux+VKx8ZpCdQWn6CXs6
	MYWw==
X-Gm-Message-State: ALoCoQm2ucnErgeU7GVQu8ygqgtQNlCKxUUqNK912f7SXdSXuyCINw3ghqtMkMQsuHeIBUwVrjPq
MIME-Version: 1.0
X-Received: by 10.25.19.100 with SMTP id j97mr19635199lfi.114.1448623253561;
	Fri, 27 Nov 2015 03:20:53 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Fri, 27 Nov 2015 03:20:53 -0800 (PST)
In-Reply-To: <CAD3vsf6QVv9EEHOYZHrvnpixf4X5zaLV3OvrLn-64Ja75vtk3w@mail.gmail.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
	<CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
	<CAD3vsf6RJs5ZgsgqvRU1qWvf1Zk3F8hgY5PYq2dMimQzEr_eqw@mail.gmail.com>
	<CAP9ODKocGGNJ2bUscbF5906SnrusHS8abWuVVQHBLUP6nMgyxw@mail.gmail.com>
	<CAD3vsf6QVv9EEHOYZHrvnpixf4X5zaLV3OvrLn-64Ja75vtk3w@mail.gmail.com>
Date: Fri, 27 Nov 2015 16:50:53 +0530
Message-ID: <CAD3vsf4gmexEBu1JxPY8oiA0Gj3+6aUOzud0uOtHRQh_aYfKFw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Fri, 27 Nov 2015 11:20:54 -0000
Content-Type: multipart/alternative; boundary=001a11406508713e03052583e26f

--001a11406508713e03052583e26f
Content-Type: text/plain; charset=UTF-8

>
>
>> >>> WARNING: Could not copy license file
>> >>>
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
>> >>> to
>> >>>
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
>> >>> [Errno 1] Operation not permitted:
>> >>>
>> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'
>> >
>> > The above warning comes up during do_populate_lic task, and this task
>> > is not being executed in pseudo environment. So changing ownership of
>> > license files to root user (explicitly via "0") fails, as normal user
>> > doesn't have permissions to do so.
>> >
>> > In this case, use of os.getuid() and os.getgid() behaves correctly, by
>> > giving normal user id and solving this warning. So this is one
>> > advantage of using os.getuid() and os.getgid() over explicit "0".
>>
>> The real fix would be put this to run under pseudo, it seems.
>>
>>
> Running populate_lic under pseudo will solve this warning. I will send v3,
> if other members are fine with this solution.
>
> Update:

Running do_populate_lic task under pseudo is going solve "[Errno 1]
Operation not permitted:" warnings for target packages, but native packages
are going to have this warnings, as native packages
tasks are not executed under pseudo.

Example:
-- snip --
WARNING: Could not copy license file
/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/zlib-1.2.8/zlib.h
to
/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/zlib.h:
[Errno 1] Operation not permitted:
'/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/zlib.h'
WARNING: Could not copy license file
/opt/work_jagadeesh/poky-jethro-14.0.0/meta/files/common-licenses/Zlib to
/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/generic_Zlib:
[Errno 1] Operation not permitted:
'/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/generic_Zlib'
-- CUT --

Regards,
Jagadeesh


>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
>
>

--001a11406508713e03052583e26f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><span><br>
&gt;&gt;&gt; WARNING: Could not copy license file<br>
&gt;&gt;&gt; /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/g=
mp-6.0.0/COPYING.LESSERv3<br>
&gt;&gt;&gt; to<br>
&gt;&gt;&gt; /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/l=
icense-destdir/gmp/COPYING.LESSERv3:<br>
&gt;&gt;&gt; [Errno 1] Operation not permitted:<br>
&gt;&gt;&gt; &#39;/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0=
-r0/license-destdir/gmp/COPYING.LESSERv3&#39;<br>
&gt;<br>
&gt; The above warning comes up during do_populate_lic task, and this task<=
br>
&gt; is not being executed in pseudo environment. So changing ownership of<=
br>
&gt; license files to root user (explicitly via &quot;0&quot;) fails, as no=
rmal user<br>
&gt; doesn&#39;t have permissions to do so.<br>
&gt;<br>
&gt; In this case, use of os.getuid() and os.getgid() behaves correctly, by=
<br>
&gt; giving normal user id and solving this warning. So this is one<br>
&gt; advantage of using os.getuid() and os.getgid() over explicit &quot;0&q=
uot;.<br>
<br>
</span>The real fix would be put this to run under pseudo, it seems.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div><br></div=
></span><div>Running populate_lic under pseudo will solve this warning. I w=
ill send v3, if other members are fine with this solution.</div><div><br></=
div></div></div></div></blockquote><div>Update:</div><div><br></div><div>Ru=
nning do_populate_lic task under pseudo is going solve &quot;[Errno 1] Oper=
ation not permitted:&quot; warnings for target packages, but native package=
s are going to have this warnings, as native packages=C2=A0</div><div>tasks=
 are not executed under pseudo.</div><div><br></div><div>Example:</div><div=
>-- snip --</div><div>WARNING: Could not copy license file /opt/work_jagade=
esh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/zli=
b-1.2.8/zlib.h to /opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86=
_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/zlib.h: [Errno 1=
] Operation not permitted: &#39;/opt/work_jagadeesh/poky-jethro-14.0.0/buil=
d/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/license-destdir/zlib-native/zl=
ib.h&#39;</div><div>WARNING: Could not copy license file /opt/work_jagadees=
h/poky-jethro-14.0.0/meta/files/common-licenses/Zlib to /opt/work_jagadeesh=
/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-native/1.2.8-r0/licens=
e-destdir/zlib-native/generic_Zlib: [Errno 1] Operation not permitted: &#39=
;/opt/work_jagadeesh/poky-jethro-14.0.0/build/tmp/work/x86_64-linux/zlib-na=
tive/1.2.8-r0/license-destdir/zlib-native/generic_Zlib&#39;</div><div>-- CU=
T --</div><div><br></div><div>Regards,</div><div>Jagadeesh</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><div></div><span class=3D""><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span><font c=
olor=3D"#888888"><br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile:=
 +1 (347) 903-9750<br>
</font></span></blockquote></span></div><br></div></div>
</blockquote></div><br></div></div>

--001a11406508713e03052583e26f--
