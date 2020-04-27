Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.962.1588005013610062229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 09:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZrwXWTIa;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id y10so17982854uao.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLW7JnSuQTD2RLle1osd9i+tNpC0cULZvrPoec+d1MY=;
        b=ZrwXWTIaQs+nh9rjZd8y1/RapnaLjvYBTikppC0Lqvis2cin2Vh72lItEMcTk4ybsv
         Nz+ag99fqLsCu6zH2gKy3Qs1s2QlvkwlZqZe3LkP3j/p9/XF7rSosJe9HkZL/VkEn+Qr
         3Fd+LFkD9NpzozjiVlpI3ma8ouf5wdiLxUGtOGzevTUpkdK782i+FuBoKb9BKbFR2nj7
         2dZ1o7uxA5iBZtoAscbbBBR2YLDxwHytbqTOaElviqL9CH5RAhKQdlOn4k7CqT777yEv
         MXAXoOBslOXP970oCP84UKHTIvGjCt/Px2J21Bo9HIw6Wfq9z4bDeULMCBBGwAhDAUmK
         AYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLW7JnSuQTD2RLle1osd9i+tNpC0cULZvrPoec+d1MY=;
        b=cPA2UzRXrXOhDNXfJ0ALuBXp5Z5Hd3G/VQKNp7BpstHNAV++BawbyBwq8QRkVfHdzz
         2Uij2zCvtGCxe/sbN4DQEvo7gKPPGmG6Z5koq/tOkZpq35gnLI4gOmnB6lIacafqCqzA
         x5WEUkSCCdSoDnRdJnB8+t4Jw2J4B4thyhqW6HOxrHMwnX1n90zbVKhs95nZ8NwkW7HH
         8P/pSAMzGCWVEVSk1eZAZqF2kY8JgpIRn1usJ1LhCQcciqdkfadE8ImK4FZ+r/hFqra8
         bmsTTcSo9n7WOXouciXMlxp+vvcdbiL3uKujeyRB5wbsjGvA3fYijh+iNClRYgYcUoUt
         /kdA==
X-Gm-Message-State: AGi0PuZsn+b7N37l3OPOQRoeUUC9iCjCbUmZ/sMnT4nCRiz2Yh/qTCgl
	BeiJc1g8HgQFXOWNXySO/AM3WoECiQGQ14N0FDAfFUaW
X-Google-Smtp-Source: APiQypKm5CWZC4vijp8l5dAvD4Ua66y/TmKYX+GUvbldHZ5KogrgkPCNF5qCohT4+eUrBkHbcPFV1GMEMEVDkvaAqIk=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr16956344vsd.35.1588005012539;
 Mon, 27 Apr 2020 09:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org> <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
In-Reply-To: <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 18:30:01 +0200
Message-ID: <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ac8bc905a4483ad1"

--000000000000ac8bc905a4483ad1
Content-Type: text/plain; charset="UTF-8"

You need to look at configurations defined here:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
and replicate them locally. Then you can reproduce the failures that the AB
gets in those configurations.

Alex

On Mon, 27 Apr 2020 at 18:25, Rahul Kumar <rahulk@mvista.com> wrote:

> Hi Richard,
>
> With this patch I am able to build core-image-minimal without any
> Error/Warning in my system.
> Can you please suggest to me, how can i reproduce this issue in my system
> during build?
>
> *Thanks & Regards,*
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com
> <https://plus.google.com/+CodeTwoSoftware>
>
>
> On Mon, Apr 27, 2020 at 8:39 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Fri, 2020-04-24 at 00:09 +0530, Rahul Kumar wrote:
>> > Source: git://sourceware.org/git/bzip2-tests.git
>> > Type: Enhancement
>> > Description:
>> > bzip2 now has a test suite available at
>> > git://sourceware.org/git/bzip2-tests.git.
>> >
>> > This is a collection of "interesting" .bz2 files that can be used to
>> > test bzip2 works correctly. They come from different projects.
>> >
>> > Some files are deliberately bad, and are use to see how bzip2 handles
>> > corrupt files. They are explicitly not intended to decompress
>> > correctly,
>> > but to catch errors in bzip2 trying to deal with deliberately bad
>> > data.
>> > All such files have a name ending in .bz2.bad.
>> >
>> > All non-bad files end in bz2. And should come with a .md5 file for
>> > the original input file. The .md5 file is used to check that bzip2
>> > could correctly decompress the file. The original (non-compressed)
>> > files are deliberately not checked in.
>> >
>> > It will by default test with the command 'bzip2', running under
>> > valgrind (if installed on the system).
>> >
>> > For each .bz2 file found it is decompressed, recompressed and
>> > decompressed again. Once with the default bzip2 settings and
>> > once in --small (-s) mode.
>> >
>> > For each .bz2.bad file decompression is tried twice also. In
>> > default mode and small mode. The bzip2 binary is expected to
>> > return either 1 or 2 as exit status. Any other exit code is
>> > interpreted as failure.
>>
>> I did try running this on the autobuilder. There are a few issues.
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
>> step1b
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816step1b>:
>> ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
>> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample
>> contained in package bzip2-ptest requires /usr/bin/perl, but no providers
>> found in RDEPENDS_bzip2-ptest? [file-rdeps]
>> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
>> Please consider fixing them.
>>
>> also, the new license (GPLv3) causes problems:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> 
>

--000000000000ac8bc905a4483ad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to look at configurations defined here:</div=
><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilde=
r-helper/tree/config.json">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-=
autobuilder-helper/tree/config.json</a></div><div>and replicate them locall=
y. Then you can reproduce the failures that the AB gets in those configurat=
ions.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Apr 2020 at 18:25, =
Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com">rahulk@mvista.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,sans-=
serif;color:rgb(11,83,148)">Hi Richard,<br><br>With this patch I am able to=
 build core-image-minimal without any Error/Warning in my system.<br>Can yo=
u please suggest to me, how can=C2=A0i reproduce this issue in my system du=
ring=C2=A0build?<br><br clear=3D"all"></div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"color:rgb(=
111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 27=
, 2020 at 8:39 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri,=
 2020-04-24 at 00:09 +0530, Rahul Kumar wrote:<br>
&gt; Source: git://<a href=3D"http://sourceware.org/git/bzip2-tests.git" r=
el=3D"noreferrer" target=3D"_blank">sourceware.org/git/bzip2-tests.git</a><=
br>
&gt; Type: Enhancement<br>
&gt; Description:<br>
&gt; bzip2 now has a test suite available at<br>
&gt; git://<a href=3D"http://sourceware.org/git/bzip2-tests.git" rel=3D"no=
referrer" target=3D"_blank">sourceware.org/git/bzip2-tests.git</a>.<br>
&gt; <br>
&gt; This is a collection of &quot;interesting&quot; .bz2 files that can b=
e used to<br>
&gt; test bzip2 works correctly. They come from different projects.<br>
&gt; <br>
&gt; Some files are deliberately bad, and are use to see how bzip2 handles=
<br>
&gt; corrupt files. They are explicitly not intended to decompress<br>
&gt; correctly,<br>
&gt; but to catch errors in bzip2 trying to deal with deliberately bad<br>
&gt; data.<br>
&gt; All such files have a name ending in .bz2.bad.<br>
&gt; <br>
&gt; All non-bad files end in bz2. And should come with a .md5 file for<br=
>
&gt; the original input file. The .md5 file is used to check that bzip2<br=
>
&gt; could correctly decompress the file. The original (non-compressed)<br=
>
&gt; files are deliberately not checked in.<br>
&gt; <br>
&gt; It will by default test with the command &#39;bzip2&#39;, running und=
er<br>
&gt; valgrind (if installed on the system).<br>
&gt; <br>
&gt; For each .bz2 file found it is decompressed, recompressed and<br>
&gt; decompressed again. Once with the default bzip2 settings and<br>
&gt; once in --small (-s) mode.<br>
&gt; <br>
&gt; For each .bz2.bad file decompression is tried twice also. In<br>
&gt; default mode and small mode. The bzip2 binary is expected to<br>
&gt; return either 1 or 2 as exit status. Any other exit code is<br>
&gt; interpreted as failure.<br>
<br>
I did try running this on the autobuilder. There are a few issues.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/62/buil=
ds/1816step1b" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoc=
toproject.org/typhoon/#/builders/62/builds/1816<br>
step1b</a>: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2/=
ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample contained in package=
 bzip2-ptest requires /usr/bin/perl, but no providers found in RDEPENDS_bzi=
p2-ptest? [file-rdeps]<br>
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Pl=
ease consider fixing them.<br>
<br>
also, the new license (GPLv3) causes problems:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/buil=
ds/1814" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/75/builds/1814</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>
<br>
</blockquote></div>

--000000000000ac8bc905a4483ad1--
