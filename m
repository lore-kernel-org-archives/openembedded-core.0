Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9844.1603895498021782689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 07:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kU3U7mlj;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id dn5so5340466edb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=H2SH+TcVLGqw+jrC06hWVwrBZxod5SyCONl6SebewKA=;
        b=kU3U7mljfdBFWEkXXmTuyX/1gfZ+IHemJSMKn+fm9lD5lfXZjjUJYzcMaAWP3Y0its
         AaNcCSLF40ySPa6eG9x1V/sjq7SppCqS/FhNeygmfTNrHeB11sz3yfWreNMbKSCKiQ8B
         zIsrNRTnMJMOtNLVieknMWYytE1Oz2XG5bsTzrIaEH2Z+3r3AOBIZGUy7tgF8kUJ7mbZ
         1d+V1ccYUazngb39EZ6Rj4bEKh3TgS8IA3Ovg2A97c35bnETqoQg220Oi4TJ/C693HWE
         Syx1UIQ6sGHhnvNqEJ/J3XodQZJP2kNgLjh2I9AVcvHVa0c162LOiCMtq2+9lLy16ZES
         79Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=H2SH+TcVLGqw+jrC06hWVwrBZxod5SyCONl6SebewKA=;
        b=qcgH5E4jgdTMhT0704NikIKN2OhuO1RdKIKEUOVbjcrKEadkMJtZ05wGb5k3dF5lM1
         sm5HRizZv4iXycukdd8uC1Usp0aRjvQHjPsIWNHnkydgkRbYMr+vSK3RofokqYq1SV2O
         zLRqQGu9z67Bz8dk3Ceo8nhObBg+/nccR3Brv0CAYyxFZz4mEjFvpB6dRw7P8iKenOdI
         qU6OzEv/OSqD24lTEuCiejUy2Qbk3zuYs3K+4wPHOmNZRPwxmD50sxYP3RyQJ8QYdsoy
         X3miUBNycCQl2NLwRUYhJHspPv+YCR+1fg9peaKvRZZeSSYJDbf4lab6vgYcb5YazDFY
         DAig==
X-Gm-Message-State: AOAM5326SoQkUI5RYzbS+mlvzx6fBAVHmC70FKDbx5rfv50y+glWm+oi
	ke4b4Q9JWkT/svY4CkNv76ak/mziSXuLoWnLbUc=
X-Google-Smtp-Source: ABdhPJx8Yw+ye3Wr9V1tc2V241vswqLIg6x1Xtl52RdWsLbx0NfewfKuP+6vogz7WBfYYf891aBMxXOO+yv0NyNuqvQ=
X-Received: by 2002:a05:6402:1457:: with SMTP id d23mr7802962edx.311.1603895496498;
 Wed, 28 Oct 2020 07:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603760941.git.steve@sakoman.com> <20201027092433.mtsr6bucqhzitixf@jama>
 <CAOSpxdYOG8USSc3s4gwMpAbPHff+pXbzLOR_qVf71inXg5A7=A@mail.gmail.com> <CA+chaQfvFbARW_qpspY7pLiV8Y6ZkU7_Q=OOvC+iJBp+Dbv+rg@mail.gmail.com>
In-Reply-To: <CA+chaQfvFbARW_qpspY7pLiV8Y6ZkU7_Q=OOvC+iJBp+Dbv+rg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 28 Oct 2020 15:31:25 +0100
Message-ID: <CA+chaQc0Yzwh2ruRWAe1Y9UQbm8YjWp-Etb9ntLDKvpmnqyD4Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/14] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005362ba05b2bc054a"

--0000000000005362ba05b2bc054a
Content-Type: text/plain; charset="UTF-8"

The script just finished, I've uploaded the results here:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca

There is a lot of changes compared to master, but mostly because I didn't
have ARM_INSTRUCTION_SET set to thumb in this run.

That helped to reveal one issue in
meta/conf/machine/include/tune-arm9tdmi.inc
which most likely exists in master as well (wasn't detected before just
because ARM_INSTRUCTION_SET).
https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-arm9tdmi.arm9tdmi?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca

And the meta/conf/machine/include/tune-supersparc.inc is failing like it
did in master before removal in:
https://git.openembedded.org/openembedded-core/commit/?id=861519337b6e5e986c3c4b8ba253e8339caf0805
which you probably intentionally didn't backport to dunfell.
https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-supersparc?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca

I'll trigger it once more with thumb enabled to better show what's the
difference from master.

Cheers,

On Tue, Oct 27, 2020 at 4:34 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi Steve,
>
> it's from this branch:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
>
> I've already started it on top of dunfell with these fixes backported,
> will report back when it's finished (will take at least rest of today to
> finish).
>
> Cheers,
>
> On Tue, Oct 27, 2020 at 3:03 PM Steve Sakoman <steve@sakoman.com> wrote:
>
>> Hi Martin,
>>
>> On Mon, Oct 26, 2020 at 11:24 PM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>> > Did you run tune/test.sh script with these on dunfell or do you want me
>> to?
>>
>> No, I didn't.  I'm not familiar with that script.  Can you point me in
>> the right direction?
>>
>> > It looks OK, but would be good to confirm that it fixes all issues
>> > currently in dunfell.
>>
>> Agreed!
>>
>> Steve
>>
>

--0000000000005362ba05b2bc054a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The script just finished, I&#39;ve uploaded the results he=
re:<div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/c=
ommit/?h=3Djansa/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c2fe31037917fd999=
bf4142dca">https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Djansa/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c2fe31037917fd999bf4142dc=
a</a><br></div><div><br></div><div>There is a lot of changes compared to ma=
ster, but mostly because I didn&#39;t have ARM_INSTRUCTION_SET set to thumb=
 in this run.</div><div><br></div><div>That helped to reveal one issue in</=
div><div>meta/conf/machine/include/tune-arm9tdmi.inc<br></div><div>which mo=
st likely exists in master as well (wasn&#39;t detected before just because=
 ARM_INSTRUCTION_SET).</div><div><a href=3D"https://git.openembedded.org/op=
enembedded-core-contrib/diff/scripts/tune/log.fake-arm9tdmi.arm9tdmi?h=3Dja=
nsa/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c2fe31037917fd999bf4142dca">ht=
tps://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.=
fake-arm9tdmi.arm9tdmi?h=3Djansa/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c=
2fe31037917fd999bf4142dca</a><br></div><div><br></div><div>And the=C2=A0met=
a/conf/machine/include/tune-supersparc.inc is failing like it did in master=
 before removal in:</div><div><a href=3D"https://git.openembedded.org/opene=
mbedded-core/commit/?id=3D861519337b6e5e986c3c4b8ba253e8339caf0805">https:/=
/git.openembedded.org/openembedded-core/commit/?id=3D861519337b6e5e986c3c4b=
8ba253e8339caf0805</a><br></div><div>which you probably intentionally didn&=
#39;t backport to dunfell.</div><div><a href=3D"https://git.openembedded.or=
g/openembedded-core-contrib/diff/scripts/tune/log.fake-supersparc?h=3Djansa=
/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c2fe31037917fd999bf4142dca">https=
://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fak=
e-supersparc?h=3Djansa/tune-test-dunfell&amp;id=3Dc87f58e4235fc5c2fe3103791=
7fd999bf4142dca</a><br></div><div><br></div><div>I&#39;ll trigger it once m=
ore with thumb enabled to better show what&#39;s the difference from master=
.</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2020 at 4:34 PM Mar=
tin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hi Steve,<div><br></div><div>it&#39;s from this branch:=
</div><div><a href=3D"https://git.openembedded.org/openembedded-core-contri=
b/log/?h=3Djansa/tune-test" target=3D"_blank">https://git.openembedded.org/=
openembedded-core-contrib/log/?h=3Djansa/tune-test</a><br></div><div><br></=
div><div>I&#39;ve already started it on top of dunfell with these fixes bac=
kported, will report back when it&#39;s finished (will take at least rest o=
f today to finish).</div><div><br></div><div>Cheers,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2=
020 at 3:03 PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Martin,<br>
<br>
On Mon, Oct 26, 2020 at 11:24 PM Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
<br>
&gt; Did you run tune/test.sh script with these on dunfell or do you want m=
e to?<br>
<br>
No, I didn&#39;t.=C2=A0 I&#39;m not familiar with that script.=C2=A0 Can yo=
u point me in<br>
the right direction?<br>
<br>
&gt; It looks OK, but would be good to confirm that it fixes all issues<br>
&gt; currently in dunfell.<br>
<br>
Agreed!<br>
<br>
Steve<br>
</blockquote></div>
</blockquote></div>

--0000000000005362ba05b2bc054a--
