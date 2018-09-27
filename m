Return-Path: <danismostlikely@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 576D37988B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:57:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 203-v6so2254667ljj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JV6mggQvai3Y156OualalQi/NDnqc1AtyDDba3zzKUg=;
	b=usZnTbaiC77ynz6h1H82bJv+rpyhUuImfYRy2yfyoeI+KUlVlftOneeJVdWkFsWgFW
	4Zq08xa9QbKGXJPGrv08mF9r5W7YUo3KRJ7j6WeISBGXgym9ckWrxJyCOMdD5N6TQD90
	9MX/SvD4+XRpiV4YdVbwDbWSjzrKG19m3WKp8oGCt0wF9L8uZcnvZ+5hAPj4TrKdowYX
	hF85+PK/iKxZJLzcGcEsXiQBZYp2HfWl/be7u80Dpe7ET3mBWzxE+1RB6olW+PFz3cZV
	ko8d1m35ak+ssh9gm45XesaaR3W0jsB3jbwjrm/OqQyYVuRO7ztoYoPTPryqd8loqPgg
	bNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JV6mggQvai3Y156OualalQi/NDnqc1AtyDDba3zzKUg=;
	b=AN4HIfPoTKMt3yb6kY9G1++QfGjW8MfVHVIS6BTSzLJ4s+iekIbLwJiYl0M2O6wHvL
	po2pbIZqSp63qiCGaWR2ATJ2ca7ECnVsxUQFBTeYlz8aviXKkHPHwgqun7YbcDGbNDbF
	p94i2QQejB3gRs1mZ5evn6FsQlVxFFtx7IyGUCKdpYj/d6Y056mtFwR5E32y6612FHrV
	mEyKLZxoUXAB62T1DKrsvIlOQWnAmNWU0HhIKi0zcXjgbU4L4lMcHp8LRpLuj/l8GwRS
	xjw2IB2JZvnrMO2LKSrWdfWwOpw9cS3NcAyMuhUBtEAd9lweHUT1+rcl7xRnpQNeh3SA
	hKmw==
X-Gm-Message-State: ABuFfogl2sRwFapSExoQyMa5In/cNAo4Z/68CZXEDIOF7/IqL/Rlrr7I
	6UTkWaMt/jrfioFHkzHWbDpNeiMe86bcDq8IZys=
X-Google-Smtp-Source: ACcGV62Tt1KUsJGfJ0eLaDk5vV9eOhilEtrfAYUEgxYyuLhtVCX+2eJM2UwllyyqQJFC8/+1zhruzzkj2wbq3sumybM=
X-Received: by 2002:a2e:2d0a:: with SMTP id t10-v6mr7616916ljt.8.1538053062817;
	Thu, 27 Sep 2018 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
	<CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
In-Reply-To: <CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 27 Sep 2018 06:57:30 -0600
Message-ID: <CACS+7ZQngcTuxFbyq9Ydb=unRp0raKomB4UbutKNWTHtC2V-cw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Run experience with security flags enabled
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
X-List-Received-Date: Thu, 27 Sep 2018 12:57:42 -0000
Content-Type: multipart/alternative; boundary="000000000000747d420576d9e2bd"

--000000000000747d420576d9e2bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2018, 15:47 Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Wed, Sep 26, 2018 at 2:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
> wrote:
>
>> Hi,
>>
>> from oe-core perspective my images are build on sumo (glibc 2.27). To
>> see what to expect, I enabled security flags (and yes some recipes in
>> my layers needed rework).
>>
>> Now that I have an image, I thought: let's give it a run. Apart of
>> other issues (maybe later) I get on every startup an error message for
>> ldconfig.
>> systemctl ldconfig says:
>>
>> =E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache
>>    Loaded: loaded (/lib/systemd/system/ldconfig.service; static;
>> vendor preset: enabled)
>>    Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:04
>> UTC; 2 days ago
>>      Docs: man:ldconfig(8)
>>   Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3DSE=
GV)
>>  Main PID: 136 (code=3Ddumped, signal=3DSEGV)
>>
>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic
>> Linker Cache...
>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main
>> process exited, code=3Ddumped, status=3D11/SEGV
>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with
>> result 'core-dump'.
>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild
>> Dynamic Linker Cache.
>>
>> Again somebody else seeing similar / remembers a fix?
>>
>
> I see similar issue in sumo as well
> I do use security flags too and was not sure if that was the reason I
> think its a good data point
> Sadly I don=E2=80=99t yet have looked into the issue in detail
>

GCC 7 and glibc don't play well together with static PIE. The real solution
is to use GCC 8, but Ross made a workaround for this issue:

http://git.openembedded.org/openembedded-core/commit/?id=3D5f64946b8740a5d9=
44f48ec430470265703bfe5e


>
>>
>> Help appreciated
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000747d420576d9e2bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, =
Sep 26, 2018, 15:47 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
<br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Sep =
26, 2018 at 2:25 PM Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzeltony@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
from oe-core perspective my images are build on sumo (glibc 2.27). To<br>
see what to expect, I enabled security flags (and yes some recipes in<br>
my layers needed rework).<br>
<br>
Now that I have an image, I thought: let&#39;s give it a run. Apart of<br>
other issues (maybe later) I get on every startup an error message for<br>
ldconfig.<br>
systemctl ldconfig says:<br>
<br>
=E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache<br>
=C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/ldconfig.service; static;<=
br>
vendor preset: enabled)<br>
=C2=A0 =C2=A0Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:=
04<br>
UTC; 2 days ago<br>
=C2=A0 =C2=A0 =C2=A0Docs: man:ldconfig(8)<br>
=C2=A0 Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3D=
SEGV)<br>
=C2=A0Main PID: 136 (code=3Ddumped, signal=3DSEGV)<br>
<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic<br>
Linker Cache...<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main<br>
process exited, code=3Ddumped, status=3D11/SEGV<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with<br>
result &#39;core-dump&#39;.<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild<br>
Dynamic Linker Cache.<br>
<br>
Again somebody else seeing similar / remembers a fix?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I see similar is=
sue in sumo as well=C2=A0</div><div dir=3D"auto">I do use security flags to=
o and was not sure if that was the reason I think its a good data point=C2=
=A0</div><div dir=3D"auto">Sadly I don=E2=80=99t yet have looked into the i=
ssue in detail</div></div></div></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">GCC 7 and glibc don&#39;t play well together wi=
th static PIE. The real solution is to use GCC 8, but Ross made a workaroun=
d for this issue:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a hre=
f=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D5f64946b874=
0a5d944f48ec430470265703bfe5e">http://git.openembedded.org/openembedded-cor=
e/commit/?id=3D5f64946b8740a5d944f48ec430470265703bfe5e</a><br></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto">=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Help appreciated<br>
<br>
Andreas<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000747d420576d9e2bd--
