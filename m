Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.852.1588016373804910449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 12:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaquJ9xn;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id n207so5201835vkf.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 12:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loy1thNTbsHCdhWzKsThEbdsRjj0Rw4OGu4DXfwbBBY=;
        b=jaquJ9xn5VuriIb8O8FiHUqs1ml5TiFOp7AArWyB8B2PZenoY/f356jdJKks8NL2IT
         dvUXDs/9GQtzjYGYXyCzdxBq4Tt5rKpwxVj9Kc7px+li2PQ4bUX318uU4UXzO42re0iJ
         7Sai8twU/07vBJhyVjISI0ABGiwusWkXV2KOEpD9JDFDTqPckIrv0m/OFG13kiToRzRP
         I71tvOExyDVF1Y4Rbv610YYMdgAB+dNDX/kHUGGaepGTVxOI/lGUupYhbbWJvlrb55fG
         esrIi2LSzK+3ZP4iocapkrattCdvgeEQ4WnFWZqS9r3hOcOeCRCXsGMOFqeEklgq/1LN
         z3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loy1thNTbsHCdhWzKsThEbdsRjj0Rw4OGu4DXfwbBBY=;
        b=EQVhlySUDWp2VuHyiIOP5hqu3/8WRW8X7m5EeeTJT8cAjYzaf9OjBVAxcomYxhze1p
         tVMWNXVywjRumURhTodZzhYQC+MHVWQ8NoW126Oq00Eu+dJBioPL1T94txtzpODbXP8t
         aulRIgub+hVGjycjmlqLF7zr6HzrBjsv97zePJGxyeedWcYSRURjJRuqkI4uTbpHxS3X
         8jvrN6eGTNcXaymqpUKJ5mxYdpqJr3P0WmFltVY3W8OFI9l2ouuQXIZ2Hj96PP6reYcb
         GKzMl06IMVPZT4wQhNvv0LiTB9n3mxieOhwFo0fyvJBEfSZVH0Mx1jd8HJlPzdrlcXzW
         nDOQ==
X-Gm-Message-State: AGi0Pub/O5jlNL0g1i7T96B+TGl+ngSZYdB8YoEDy1WhOOmyts7ZgRXv
	xgMQT8AYrOo1LxnPXOVwlq8Cowv3cS+7oVBlIqA=
X-Google-Smtp-Source: APiQypLtrVrFVQvXmzBaxJL+JlqhDP91wEiaDqXZsLUqLwdJqkwgy3Q/408WbV1Rp61EkbirZOKJY6eVY12h6oYsFxM=
X-Received: by 2002:a1f:908c:: with SMTP id s134mr17723336vkd.1.1588016372867;
 Mon, 27 Apr 2020 12:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org> <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
In-Reply-To: <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 21:39:21 +0200
Message-ID: <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cd6a6705a44adf3d"

--000000000000cd6a6705a44adf3d
Content-Type: text/plain; charset="UTF-8"

You need to first see from the failure page which configuration is failing,
for example non-gpl3 is one such.

Then you find that configuration in config.json. The below should hopefully
be self-explanatory in how you should set up the build?

        "non-gpl3" : {
            "NEEDREPOS" : ["poky", "meta-gplv2"],
            "MACHINE" : "qemux86",
            "BBTARGETS" : "core-image-minimal core-image-full-cmdline",
            "extravars" : [
                "INCOMPATIBLE_LICENSE = '*GPLv3'",
                "WARN_QA_remove = 'incompatible-license'"
            ],
            "EXTRACMDS" : [
                "../../yocto-autobuilder-helper/scripts/check-gplv3"
            ]
        },


Alex


On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com> wrote:

> Hi Richard/Alexander,
>
> I am not able to understand how I can use the below file.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
>
> did you mean to say that i have to set MACRO in local.conf based on this
> file.
>
> *Thanks & Regards,*
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com
> <https://plus.google.com/+CodeTwoSoftware>
>
>
> On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
>> > You need to look at configurations defined here:
>> >
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
>> > and replicate them locally. Then you can reproduce the failures that
>> > the AB gets in those configurations.
>>
>> That start of the failing logs on the autobuilder also list out the
>> configuration options for that build.
>>
>> Cheers,
>>
>> Richard
>>
>>

--000000000000cd6a6705a44adf3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to first see from the failure page which con=
figuration is failing, for example non-gpl3 is one such.</div><div><br></di=
v><div>Then you find that configuration in config.json. The below should ho=
pefully be self-explanatory in how you should set up the build?<br></div><d=
iv><br></div><div><pre><code>        &quot;non-gpl3&quot; : {
            &quot;NEEDREPOS&quot; : [&quot;poky&quot;, &quot;meta-gplv2&quo=
t;],
            &quot;MACHINE&quot; : &quot;qemux86&quot;,
            &quot;BBTARGETS&quot; : &quot;core-image-minimal core-image-ful=
l-cmdline&quot;,
            &quot;extravars&quot; : [
                &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#39;&quot;,
                &quot;WARN_QA_remove =3D &#39;incompatible-license&#39;&quo=
t;
            ],
            &quot;EXTRACMDS&quot; : [
                &quot;../../yocto-autobuilder-helper/scripts/check-gplv3&qu=
ot;
            ]
        },<br><br></code></pre><pre><code><br></code></pre><pre><code><span=
 style=3D"font-family:arial,sans-serif">Alex</span><br></code></pre></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, 27 Apr 2020 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvist=
a.com">rahulk@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:rgb(11,83,148)">Hi Richard/Alexand=
er,<br><br>I am not able to understand how I can use the below file.<br><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/=
tree/config.json" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.c=
gi/yocto-autobuilder-helper/tree/config.json</a><br><br>did you mean to say=
 that i have to set MACRO in local.conf based on this file.<br clear=3D"all=
"></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f;color:rgb(11,83,148)"><br></div><div><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"color:rgb(111,168,220)=
">	=09
  =09
 =20
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b>=
</span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"col=
or:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><sp=
an style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"c=
olor:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an></span></div><div><span style=3D"color:rgb(11,83,148)">Software Engineer=
,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,8=
3,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"colo=
r:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mailt=
o:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span><=
span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener" =
target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:1=
0pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 27,=
 2020 at 11:46 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:<br>
&gt; You need to look at configurations defined here:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder=
-helper/tree/config.json" rel=3D"noreferrer" target=3D"_blank">http://git.y=
octoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json</a>=
<br>
&gt; and replicate them locally. Then you can reproduce the failures that<b=
r>
&gt; the AB gets in those configurations.<br>
<br>
That start of the failing logs on the autobuilder also list out the<br>
configuration options for that build.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000cd6a6705a44adf3d--
