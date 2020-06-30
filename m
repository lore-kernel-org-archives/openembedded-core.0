Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.18256.1593531842656534722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 08:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhW11Dpa;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id n137so4665351vkf.7
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0oRqoqWeYTz/74wkLi5XsrwJ3afJYbg+Yq+NBK6Jt/o=;
        b=dhW11Dpabr3V67ZZfc9wikEERW4TKqQs+RC6kBQaaQJIzKAVkKvw47JS1zSzUtRNYW
         glkzsIZrSpGMFEM3emlrsBm4sl7I5Tt1XMQ13U6uctspAkznnF2hOHGjLXAAvWHuI47g
         b13pMmbQ5Y/YaX3Wmr+IFFz/chOxWsGLVh3H8Eo9ryQr1ctmb5q5O0mhGBG9hta9HN0v
         EGlpdWWSyolnTxS2QmPw4yyRHjnhwC8jhwTjL+cwMqJJq65XbcZv3X6HGHEJdSgEZF/E
         PHXZkW+MgQmo/sX9XtIwSWZmKY+BzOOrVi2ST2fAtEoN/EIJeUKV+FbsqDWPKCJsaqs2
         qDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0oRqoqWeYTz/74wkLi5XsrwJ3afJYbg+Yq+NBK6Jt/o=;
        b=QYKtLhjLnXyy3KbQyMkf9ghYMZg62e0zT4Fda0pV9QBF43v6vllogo5ymCE3OT/MGY
         pWgjxCEPcQNImIYur0ipX2c6/N2sU96JMYpjA8jZgxkxI6ZM9ZOBrME5dXSsXhigdf90
         qkJnin5rVFbqL4lmj3sDMgljcBcHiiNXbsBJfYOSmqdSWdagoTzW+QKvrv5w5b9EywBD
         1rJ3dKXOvjAMxps2wkTCPr9BIAg77Jo1K38jXFm3cgq7+BV72x/VeqezX9rrEOo5mEFK
         405OxxxNnFl5JZH12D40Iu5gFoob4FBvhbObf5UJYLTHxT9119/IUJ7ifSkPO3NEt81P
         SZhw==
X-Gm-Message-State: AOAM533qBdmOx/g3CTxpAq3DVp+7xW2fXtwJhiCmROThv1ZNxfEcEBcm
	YDICIG72Gb+WH8nnQNKfqnyJOetbERgDBZE+kCM=
X-Google-Smtp-Source: ABdhPJwoCMGthTC+aPwOGNjjHCEYP5Ce4T0WdJL2FzchSScXimkBIDL2TnbAVU6OzGyx3cWZ/I5soqTi2Lowcy0PTvg=
X-Received: by 2002:a1f:a883:: with SMTP id r125mr1887849vke.29.1593531841801;
 Tue, 30 Jun 2020 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com> <CANNYZj--txtppAq4o1bjmRQiZ2Oehaftx4WR-ewx7VmYHRPxmQ@mail.gmail.com>
 <1593529480451.52800@axis.com>
In-Reply-To: <1593529480451.52800@axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2020 17:43:50 +0200
Message-ID: <CANNYZj80rO=41_Gh+WCueVCwHooC5jtwDsxhyZdHD87YqvfqOQ@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <Fredrik.Gustafsson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <Hugo.Cedervall@axis.com>
Content-Type: multipart/alternative; boundary="0000000000005e73f505a94f0bf1"

--0000000000005e73f505a94f0bf1
Content-Type: text/plain; charset="UTF-8"

What I meant is that 15s vs 20s on a small image could have been 5 min vs
5min5s on a bigger image, so I wanted to see that the difference does scale
up with image size.

Can you to provide sdk-ptest numbers for deb and ipk as well?

Alex

On Tue, 30 Jun 2020 at 17:04, Fredrik Gustafsson <
Fredrik.Gustafsson@axis.com> wrote:

> Hi Alexander,
>
> what are you finding strange with the numbers? Too fast or to big of a
> difference? Note that it's only the do_rootfs task that i measured.
>
> I've tried the core-image-sato-sdk-ptest as you suggested. I run the
> following command multiple times:
> bitbake core-image-sato-sdk-ptest -c cleansstate &&
>
> bitbake core-image-sato-sdk-ptest -c clean &&
> time bitbake core-image-sato-sdk-ptest -f -c do_rootfs
>
>
> APK
> ====
> 0,85s user 0,16s system 0% cpu 1:13,66 total
> 0,87s user 0,14s system 0% cpu 1:13,28 total
> 0,89s user 0,11s system 0% cpu 1:13,10 total
>
> RPM
> ===
>
> 0,67s user 0,12s system 0% cpu 2:02,48 total
> 0,68s user 0,11s system 0% cpu 2:03,39 total
> 0,73s user 0,09s system 0% cpu 1:59,87 total
>
> 5 seconds doesn't sound that much but it's 25% speedup. Since building is
> mostly cached but generating rootfs isn't this is a huge time consumption
> for our use case and our image takes around 4 minutes to build. Saving one
> minutes times the many builds we do is a huge win.
>
> (Excuse my late reply, running core-image-sato-sdk-ptest uncovered a few
> bugs in the implementation of apk in OE. So thanks for having me testing
> this image)
>
>
> /Fredrik
>
>
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Thursday, June 25, 2020 12:24 PM
> *To:* Fredrik Gustafsson
> *Cc:* OE-core; tools-cfpbuild-internal; Hugo Cedervall
> *Subject:* Re: [OE-core] Add package managers as a plugin
>
> Apologies, but these metrics do not look particularly convincing - 15s vs
> 20s? Can you try it with an image several gigabytes in size?
> Core-image-sato-sdk-ptest is a good option.
>
> Alex
>
> On Thu, 25 Jun 2020 at 12:14, Fredrik Gustafsson <
> fredrik.gustafsson@axis.com> wrote:
>
>> Poky today has three different package managers, the well-known formats
>> deb
>> and rpm is supported as well as ipkg that is good for embedded devices.
>>
>> When building and having a good cache hit, a significant amount of time is
>> spent in the phase of generating a rootfs, which is really about the
>> performance of the package manager. ipkg is way slower than deb or rpm. To
>> save build time and also get a package manager that is suitanle for use on
>> targets where flash memory is a concern, support for apk is suggested.
>>
>> However, it might or might not be what's wanted for Poky since it
>> increases
>> the test matrix. Therefore this patch series refactors the package
>> management code so that it's possible to add more package managers in
>> other
>> own layer. I will send another patch serie that will add apk.
>>
>> Perfomance metrics below, (note that this includes build times).
>>
>> APK
>> ===
>> bitbake core-image-minimal
>> 15.84s user 2.60s system 0% cpu 1:26:19.21 total
>> 16.01s user 2.58s system 0% cpu 1:26:03.72 total
>> 15.69s user 2.61s system 0% cpu 1:26:45.45 total
>>
>> bitbake core-image-minimal -c cleansstate
>> bitbake core-image-minimal -c clean
>> bitbake core-image-minimal -f -c do_rootfs
>> 0.55s user 0.06s system 4% cpu 14.236 total
>> 0.54s user 0.08s system 4% cpu 15.247 total
>> 0.52s user 0.15s system 4% cpu 15.143 total
>>
>> RPM
>> ===
>> bitbake core-image-minimal
>> 18.57s user 3.09s system 0% cpu 1:31:29.09 total
>> 18.58s user 3.08s system 0% cpu 1:30:53.80 total
>> 18.20s user 3.31s system 0% cpu 1:31:06.69 total
>>
>> bitbake core-image-minimal -c cleansstate
>> bitbake core-image-minimal -c clean
>> bitbake core-image-minimal -c do_rootfs -f
>> 0.58s user 0.10s system 3% cpu 19.470 total
>> 0.57s user 0.09s system 3% cpu 19.480 total
>> 0.60s user 0.07s system 3% cpu 20.381 total
>> 
>>
>

--0000000000005e73f505a94f0bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What I meant is that 15s vs 20s on a small image coul=
d have been 5 min vs 5min5s on a bigger image, so I wanted to see that the =
difference does scale up with image size.</div><div><br></div><div>Can you =
to provide sdk-ptest numbers for deb and ipk as well?<br></div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, 30 Jun 2020 at 17:04, Fredrik Gustafsson &lt;=
<a href=3D"mailto:Fredrik.Gustafsson@axis.com">Fredrik.Gustafsson@axis.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr" style=3D"font-size:12pt;color:rgb(0,0,0);background-color=
:rgb(255,255,255);font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Hi Alexander,<br>
</p>
<p>what are you finding strange with the numbers? Too fast or to big of a =
difference? Note that it&#39;s only the do_rootfs task that i measured.<br>
<br>
I&#39;ve tried the core-image-sato-sdk-ptest as you suggested. I run the f=
ollowing command multiple times:<br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">bitbake core-imag=
e-sato-sdk-ptest=C2=A0-c cleansstate &amp;&amp;</span></p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)"></span><span s=
tyle=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,sans-serif;=
font-size:16px;background-color:rgb(255,255,255)">bitbake
 core-image-sato-sdk-ptest=C2=A0-c clean &amp;&amp;</span><br style=3D"col=
or:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,sans-serif;font-size:1=
6px;background-color:rgb(255,255,255)">
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">time bitbake core=
-image-sato-sdk-ptest=C2=A0-f -c do_rootfs</span><br>
</p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)"><br>
APK<br>
=3D=3D=3D=3D<br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">0,85s user 0,16s =
system 0% cpu 1:13,66 total</span><br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">0,87s user 0,14s =
system 0% cpu 1:13,28 total</span><br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">0,89s user 0,11s =
system 0% cpu 1:13,10 total</span><br>
<br>
RPM<br>
=3D=3D=3D</span></p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)">0,67s user 0,1=
2s system 0% cpu 2:02,48 total<br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">0,68s user 0,11s =
system 0% cpu 2:03,39=C2=A0total</span><br>
<span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:16px;background-color:rgb(255,255,255)">0,73s user 0,09s =
system 0% cpu 1:59,87=C2=A0total<br>
<br>
5 seconds doesn&#39;t sound that much but it&#39;s 25% speedup. Since buil=
ding is mostly cached but generating rootfs isn&#39;t this is a huge time c=
onsumption for our use case and our image takes around 4 minutes to build. =
Saving one minutes times the many builds we do
 is a huge win.<br>
<br>
(Excuse my late reply, running core-image-sato-sdk-ptest uncovered a few b=
ugs in the implementation of apk in OE. So thanks for having me testing thi=
s image)<br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)"><span style=3D=
"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,sans-serif;font-si=
ze:16px;background-color:rgb(255,255,255)"><br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)"><span style=3D=
"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,sans-serif;font-si=
ze:16px;background-color:rgb(255,255,255)">/Fredrik<br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,=
sans-serif;font-size:16px;background-color:rgb(255,255,255)"><span style=3D=
"color:rgb(33,33,33);font-family:Calibri,Arial,Helvetica,sans-serif;font-si=
ze:16px;background-color:rgb(255,255,255)"></span><br>
</span></p>
<div style=3D"color:rgb(33,33,33)">
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_6264142412457880117divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, June 25, 2020 12:24 PM<br>
<b>To:</b> Fredrik Gustafsson<br>
<b>Cc:</b> OE-core; tools-cfpbuild-internal; Hugo Cedervall<br>
<b>Subject:</b> Re: [OE-core] Add package managers as a plugin</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div>Apologies, but these metrics do not look particularly convincing - 15=
s vs 20s? Can you try it with an image several gigabytes in size? Core-imag=
e-sato-sdk-ptest is a good option.<br>
</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Jun 2020 at 12:14, Fredri=
k Gustafsson &lt;<a href=3D"mailto:fredrik.gustafsson@axis.com" target=3D"_=
blank">fredrik.gustafsson@axis.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Poky today has three different package managers, the well-known formats de=
b<br>
and rpm is supported as well as ipkg that is good for embedded devices.<br=
>
<br>
When building and having a good cache hit, a significant amount of time is=
<br>
spent in the phase of generating a rootfs, which is really about the<br>
performance of the package manager. ipkg is way slower than deb or rpm. To=
<br>
save build time and also get a package manager that is suitanle for use on=
<br>
targets where flash memory is a concern, support for apk is suggested.<br>
<br>
However, it might or might not be what&#39;s wanted for Poky since it incr=
eases<br>
the test matrix. Therefore this patch series refactors the package<br>
management code so that it&#39;s possible to add more package managers in =
other<br>
own layer. I will send another patch serie that will add apk.<br>
<br>
Perfomance metrics below, (note that this includes build times).<br>
<br>
APK<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
15.84s user 2.60s system 0% cpu 1:26:19.21 total<br>
16.01s user 2.58s system 0% cpu 1:26:03.72 total<br>
15.69s user 2.61s system 0% cpu 1:26:45.45 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -f -c do_rootfs<br>
0.55s user 0.06s system 4% cpu 14.236 total<br>
0.54s user 0.08s system 4% cpu 15.247 total<br>
0.52s user 0.15s system 4% cpu 15.143 total<br>
<br>
RPM<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
18.57s user 3.09s system 0% cpu 1:31:29.09 total<br>
18.58s user 3.08s system 0% cpu 1:30:53.80 total<br>
18.20s user 3.31s system 0% cpu 1:31:06.69 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -c do_rootfs -f<br>
0.58s user 0.10s system 3% cpu 19.470 total<br>
0.57s user 0.09s system 3% cpu 19.480 total<br>
0.60s user 0.07s system 3% cpu 20.381 total<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000005e73f505a94f0bf1--
