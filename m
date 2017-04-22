Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0000160248
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Apr 2017 04:39:14 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y33so14224949qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 21:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P5G22fo6C5qcOjvnqVeIc6OaN/yUkfOzTuT6xJGVHp8=;
	b=BPupUDlyAw9HRWt1GxW2A3cX7gijVZNH0Ieij4VxG1jj24kDuZ+TrE7mEnpoV68F7s
	mGYl9l/Z9/T5JTT/znvGlS2kx41GHukKI/COGjmc0g4u3Opb7NGHLDArG6NzGd+24FPF
	12VKIvoCYuhxOZCF36+doHQ0R6YkJct82Q9yOuNd+vc9xagaBpBmAUJuBuYmWZFJMJ4C
	ie1VIyOGVmARPuNb9E90AaVDwnactJW2mxX69e8eIRgUK6LCOmwX9rxrUhSvieBSeaaf
	HFvg3r+ZFJARjvr2hVeYVR7buzOaLAtdBUbjNOyLXc3eZWzh+wMvdjiL9DwoEzwTxqJD
	CWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P5G22fo6C5qcOjvnqVeIc6OaN/yUkfOzTuT6xJGVHp8=;
	b=Gb8vJ+ZDz9UeD5d1Fm00yPRypvETymf2fXYsBjJsgeXYl1c0rw9y3eOmH2rxTJ6Ep4
	dgJtVsCHlyoN2x3yQYfDeVps55yXSfVLn+H2YC/B+wBDyXgn+rc2eBQROjAot/9LgtrK
	31K6nGINDNKvMmd2lgcAiqoJvVWWg+WA/SQJTEjRwGpULdjtXrRh0CKngbKVnO97nRTM
	gTOcL3y2xCWSPE3B3DJOCaSBOWJojtffO9cAmRSdqJDZprNwXFwlNJz87I68sJc2Yu0d
	WYDUHx1wlXgYOOj5i7NUxoJjogH73fhyFQSgBVWjw9jFGnJtiL19805bNHDB+Kui7Ldc
	YZyg==
X-Gm-Message-State: AN3rC/72JBh/hYC0/lXCvkcfpYXIIe0PlsvNK53QmUTzfgYRoX1dfrv0
	rwOokycCHHfS9RzSnswcDIqhALLM8w==
X-Received: by 10.237.47.194 with SMTP id m60mr18512335qtd.9.1492835955780;
	Fri, 21 Apr 2017 21:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 21:39:15 -0700 (PDT)
In-Reply-To: <CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 22 Apr 2017 00:39:15 -0400
Message-ID: <CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Sat, 22 Apr 2017 04:39:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c12555cda3131054db9f481

--94eb2c12555cda3131054db9f481
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>>
>>
>> On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <akuster808@gmail.com>
>> wrote:
>>
>>>
>>>
>>> On 04/21/2017 01:36 AM, Martin Jansa wrote:
>>>
>>> Anyone else seeing this as well?
>>>
>>>
>>> yes
>>>
>>
>> If you see it, can you take a look at the linux source dir and see if th=
e
>> directories are
>> present ?
>>
>> I've been doing a tight loop on builds all day, and  haven't seen this
>> yet.
>>
>> Nothing has changed with the build process in months, so something else
>> underneath
>> is now causing this race/issue.
>>
>>
> I finally managed to make this happen.
>
> Thanks for the report .. I can now spin a fix.
>

I'm no longer able to trigger the error, and I sent the patch to the list.

Hopefully this never comes back .. but if anyone does see it after applying
that patch, let me know.

Cheers,

Bruce


>
> Cheers,
>
> Bruce
>
>
>> Bruce
>>
>>
>>>
>>> - armin
>>>
>>> I've updated to oe-core commit:
>>>
>>> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
>>>
>>> from some revision maybe 20-40 commits older and now I'm seeing:
>>>
>>> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_vali=
date_branches: Function failed: do_validate_branches (log file is located a=
t linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_vali=
date_branches.5385)
>>> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad=
2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
>>> Log data follows:
>>> | DEBUG: Executing shell function do_validate_branches
>>> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
>>> | mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=
=E2=84=A2: File exists
>>> |
>>> | [ERROR] Can't find patch dir at ./patches/standard/base
>>> | usage: kgit s2q
>>> | WARNING: exit code 1 from a shell command.
>>> | ERROR: Function failed: do_validate_branches (log file is located at =
linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valida=
te_branches.5385)
>>> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: =
task do_validate_branches: Failed
>>> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_v=
alidate_branches) failed with exit code '1'
>>>
>>>
>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c12555cda3131054db9f481
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 3:47 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Fri, Apr 21, 2017 at 1:50 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Fri, Apr 21, 2017 at 11:55 AM, akuster808 <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <p><br>
    </p>
    <br>
    <div class=3D"m_625186880526551813m_-2255057749165370883m_1550954388652=
444592m_-3190757637650521301moz-cite-prefix">On 04/21/2017 01:36 AM, Martin=
 Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seeing this as we=
ll?</pre>
      </div>
    </blockquote>
    <br></span>
    yes<br></div></blockquote><div><br></div></span><div>If you see it, can=
 you take a look at the linux source dir and see if the directories are</di=
v><div>present ?</div><div><br></div><div>I&#39;ve been doing a tight loop =
on builds all day, and =C2=A0haven&#39;t seen this yet.</div><div><br></div=
><div>Nothing has changed with the build process in months, so something el=
se underneath</div><div>is now causing this race/issue.</div><span class=3D=
"m_625186880526551813m_-2255057749165370883HOEnZb"><font color=3D"#888888">=
<div><br></div></font></span></div></div></div></blockquote><div><br></div>=
</span><div>I finally managed to make this happen.</div><div><br></div><div=
>Thanks for the report .. I can now spin a fix.</div></div></div></div></bl=
ockquote><div><br></div><div>I&#39;m no longer able to trigger the error, a=
nd I sent the patch to the list.</div><div><br></div><div>Hopefully this ne=
ver comes back .. but if anyone does see it after applying that patch, let =
me know.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>Cheers,<=
/div><div><br></div><div>Bruce</div><div><div class=3D"m_625186880526551813=
h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"m_6251868805=
26551813m_-2255057749165370883HOEnZb"><font color=3D"#888888"><div></div><d=
iv>Bruce</div><div>=C2=A0</div></font></span><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <br>
    - armin<span><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px">I&#39;ve updated to oe-core c=
ommit:</pre>
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><font colo=
r=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wrap">c6cd5865b=
6914521a841ae0c9f4e2b<wbr>cda99beff2
</span></font></pre>
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><font colo=
r=3D"#333333"><span style=3D"font-size:14px;white-space:pre-wrap">from some=
 revision maybe 20-40 commits older and now I&#39;m seeing:</span></font></=
pre>
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px"></pre>
        <pre class=3D"m_625186880526551813m_-2255057749165370883m_155095438=
8652444592m_-3190757637650521301gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: linux-yocto-1_4.10.9+g=
itAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function fail=
ed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+gitAU=
TOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_validate_branches.538<=
wbr>5)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOIN<wbr>C+a=
d2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_validate_branches.538<wbr>5
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base
| mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
|=20
| [ERROR] Can&#39;t find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at linu=
x-yocto/1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0/tem<wbr>p/log.do_=
validate_branches.538<wbr>5)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOIN<wbr>C+ad2e885015_fe0fb8da3d-r0:=
 task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/l<wbr>inux/linux-yocto_4.10.bb:do_=
va<wbr>lidate_branches) failed with exit code &#39;1&#39;</pre>
      </div>
      <br>
      <fieldset class=3D"m_625186880526551813m_-2255057749165370883m_155095=
4388652444592m_-3190757637650521301mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </span></div>

<br></span><span>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></span></blockquote></div><span><br><br clear=3D"all"><div><br></div>--=
 <br><div class=3D"m_625186880526551813m_-2255057749165370883m_155095438865=
2444592gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt=
 not follow the NULL pointer, for chaos and madness await thee at its end&q=
uot;</div>
</span></div></div>
</blockquote></div></div></div><div><div class=3D"m_625186880526551813h5"><=
br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_6251868805265518=
13m_-2255057749165370883gmail_signature" data-smartmail=3D"gmail_signature"=
>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end&quot;</div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_625186880526551813gmail_signature" data-smartmail=3D"gmail_signature"=
>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end&quot;</div>
</div></div>

--94eb2c12555cda3131054db9f481--
