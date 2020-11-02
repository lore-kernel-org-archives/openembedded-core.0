Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.2038.1604338605768943973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 09:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=taRKY3rW;
 spf=pass (domain: google.com, ip: 209.85.167.50, mailfrom: foremans@google.com)
Received: by mail-lf1-f50.google.com with SMTP id j30so18505842lfp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QIuC4X36gJxgn+HlAhMNYoYjTde1y7Lgv1e3RA9GacE=;
        b=taRKY3rWpFynx5SW1uYrjvxriZcVqp4A878j0rvSy9k71bgvyUdf20VpbEfVNvCOYp
         /DNzenduF8iGzt+4XJo7DyBu9+qC1Y6B6pCpgualmV6Pb3OgMAHmIyl91ODgWUTJcz5C
         NfIvEfWzkqJ/wInBG0n1PSkjQB6SeLu3XN6qX9hHeSbQMjGMMRL38O7aErMalFb1xz7q
         WMKvs1/IxJStAPjoVJt2gl1WIeelqwPL4lEc4LxjS3/hS6zUUK/3vbKBWNyzb69qmo2f
         Q1+XyMU0mmYbSxRZRtVrYHQTP0a54FkAsc8trY4bHKMn+GUhvOJGHwwAxFjB0LBJDBlu
         21tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIuC4X36gJxgn+HlAhMNYoYjTde1y7Lgv1e3RA9GacE=;
        b=Zw8SdzNjNg4rpUzlSnpYQgbjm07kdcMmYN7Uf0Vd3Fyf/frZfXonyfK9Sx5zX572oJ
         znyjWt+OV8hVbK0sZDn2JrSBtiVkiA9ABVEeiG0ZsifRoUgxncHEMgTjR8Gm5KaPTAUe
         K1KqAKKPnUYo2tLFjKVHfdH/7zvVi456BHWZFeUQO6SDvL1EkYfWjXJ9B7cYPVfAHj8Z
         psO71NZva/exwHNT2gknGv+2lLyEu9W88cQA16pLzPHjT7qlDlsYDgTXo1eVtBHBQmH8
         Qs6CVCR4ByZASVsUWKk+CJvHpAAVFbzA9/tWRTjY/9r+NznBYWVRHPjQELmv1F4zmtk8
         w1uw==
X-Gm-Message-State: AOAM530q207i+8AJv7NWjjSiQ92N+6hrnz4g43PgyMnGcxUS00yzagtD
	XseuESLgF/40AtjW/Kg01h1IPYvp1RGh8bHhRfwR6Q==
X-Google-Smtp-Source: ABdhPJw/inok0dFE/MEcXS2LWjlEBu3G148bOATKRCiIxNhNvWy+KnuP8LbekuMo5vkacRBqRc6fQ3nOqlJdMW38mvQ=
X-Received: by 2002:a19:87:: with SMTP id 129mr5736705lfa.164.1604338603850;
 Mon, 02 Nov 2020 09:36:43 -0800 (PST)
MIME-Version: 1.0
References: <CAAOsEjUKH61YhBDiS7xzhT6kYYeW2Qbr_4GF2ZsM18z4xRGS-Q@mail.gmail.com>
 <CANNYZj8TBSHhTguu0g2zkpX7k9LObs6Xzw4C0PUCzEY18gLHeQ@mail.gmail.com>
In-Reply-To: <CANNYZj8TBSHhTguu0g2zkpX7k9LObs6Xzw4C0PUCzEY18gLHeQ@mail.gmail.com>
From: "Steve Foreman" <foremans@google.com>
Date: Mon, 2 Nov 2020 09:36:32 -0800
Message-ID: <CAAOsEjUoW-gOttYRdn-ko5s48RyG_-Byxb9Qjw3Y1RXNaZmNMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix a build error about missing '_sysconfigdata'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Josh Lehan <krellan@google.com>
Content-Type: multipart/alternative; boundary="00000000000095580505b32330d8"

--00000000000095580505b32330d8
Content-Type: text/plain; charset="UTF-8"

I'm not sure how to reproduce it without using our internal configs, so I
don't have specific useful instructions to reproduce it, unfortunately.

The basic steps are simply:

1. Download fresh repo
2. Source setup script & bitbake obmc-phosphor-image as usual
3. Once the build is complete, devtool modify phosphor-ipmi-host

The error is generated during the devtool modify step

I have not tried these steps with other meta/configs, so it might not
reproduce on all of them.

On Thu, Oct 29, 2020 at 9:10 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Unfortunately, this doesn't fix the actual issue: why is the build
> environment leaking? A few patches similar to this one have been shot down
> before.
>
> If you can provide steps to reproduce, I can try to take a look.
>
> Alex
>
> On Thu, 29 Oct 2020 at 16:35, Steve Foreman via lists.openembedded.org
> <foremans=google.com@lists.openembedded.org> wrote:
>
>> This error is generated because of internal build environment is leaking
>> and pulling in host libraries:
>>
>> Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>>
>> In this case, xmlprc.server is pulling in pydoc which ultimately hits
>> the error.
>>
>> Signed-off-by: Steve Foreman <foremans@google.com>
>> ---
>>  poky/bitbake/lib/prserv/serv.py | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/poky/bitbake/lib/prserv/serv.py
>> b/poky/bitbake/lib/prserv/serv.py
>> index 25dcf8a0e..f462f3dcc 100644
>> --- a/poky/bitbake/lib/prserv/serv.py
>> +++ b/poky/bitbake/lib/prserv/serv.py
>> @@ -4,6 +4,11 @@
>>
>>  import os,sys,logging
>>  import signal, time
>> +
>> +# Otherwise this fails when called from recipes which e.g. inherit
>> python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
>> +# No module named '_sysconfigdata'
>> +if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
>> +    del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
>>  from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
>>  import threading
>>  import queue
>> --
>> 2.29.1.341.ge80a0c044ae-goog
>>
>> 
>>
>>

--00000000000095580505b32330d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure how to reproduce it without using our int=
ernal configs, so I don&#39;t have specific useful instructions to reproduc=
e it, unfortunately.<div><br></div><div>The basic steps are simply:</div><d=
iv><br></div><div>1. Download fresh repo</div><div>2. Source setup script &=
amp; bitbake obmc-phosphor-image as usual=C2=A0</div><div>3. Once the build=
 is complete, devtool modify phosphor-ipmi-host</div><div><br></div><div>Th=
e=C2=A0error is generated during the devtool modify step</div><div><br></di=
v><div>I have not tried these steps with other meta/configs, so it might no=
t reproduce on all of them.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2020 at 9:10 AM Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div>Unfortunately, this doesn&#39;t fix the actual issue=
: why is the build environment leaking? A few patches similar to this one h=
ave been shot down before.</div><div><br></div><div>If you can provide step=
s to reproduce, I can try to take a look.<br></div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, 29 Oct 2020 at 16:35, Steve Foreman via <a href=3D"http:/=
/lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;f=
oremans=3D<a href=3D"mailto:google.com@lists.openembedded.org" target=3D"_b=
lank">google.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">This error is gener=
ated because of internal build environment is leaking<br style=3D"font-fami=
ly:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">and pullin=
g in host libraries:<br style=3D"font-family:Roboto,&quot;Helvetica Neue&qu=
ot;,Helvetica,Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;Helve=
tica Neue&quot;,Helvetica,Arial,sans-serif">Exception: ModuleNotFoundError:=
 No module named &#39;_sysconfigdata&#39;<br style=3D"font-family:Roboto,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-fami=
ly:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">In this ca=
se, xmlprc.server is pulling in pydoc which ultimately hits<br style=3D"fon=
t-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">the =
error.<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot=
;,Helvetica,Arial,sans-serif">Signed-off-by: Steve Foreman &lt;<a href=3D"m=
ailto:foremans@google.com" style=3D"font-family:Roboto,&quot;Helvetica Neue=
&quot;,Helvetica,Arial,sans-serif" target=3D"_blank">foremans@google.com</a=
>&gt;<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,A=
rial,sans-serif">---<br style=3D"font-family:Roboto,&quot;Helvetica Neue&qu=
ot;,Helvetica,Arial,sans-serif">=C2=A0poky/bitbake/lib/prserv/serv.py | 5 +=
++++<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Ar=
ial,sans-serif">=C2=A01 file changed, 5 insertions(+)<br style=3D"font-fami=
ly:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if">diff --git a/poky/bitbake/lib/prserv/serv.py b/poky/bitbake/lib/prserv/=
serv.py<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica=
,Arial,sans-serif">index 25dcf8a0e..f462f3dcc 100644<br style=3D"font-famil=
y:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">--- a/poky/=
bitbake/lib/prserv/serv.py<br style=3D"font-family:Roboto,&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif">+++ b/poky/bitbake/lib/prserv/serv.py=
<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif">@@ -4,6 +4,11 @@<br style=3D"font-family:Roboto,&quot;Helvetica=
 Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-family:Roboto,&qu=
ot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import os,sys,log=
ging<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Ar=
ial,sans-serif">=C2=A0import signal, time<br style=3D"font-family:Roboto,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+<br style=3D"font-fam=
ily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+# Otherw=
ise this fails when called from recipes which e.g. inherit python3native (w=
hich sets _PYTHON_SYSCONFIGDATA_NAME) with:<br style=3D"font-family:Roboto,=
&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+# No module named &=
#39;_sysconfigdata&#39;<br style=3D"font-family:Roboto,&quot;Helvetica Neue=
&quot;,Helvetica,Arial,sans-serif">+if &#39;_PYTHON_SYSCONFIGDATA_NAME&#39;=
 in os.environ:<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,H=
elvetica,Arial,sans-serif">+=C2=A0 =C2=A0 del os.environ[&#39;_PYTHON_SYSCO=
NFIGDATA_NAME&#39;]<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif">=C2=A0from xmlrpc.server import SimpleXMLRPC=
Server, SimpleXMLRPCRequestHandler<br style=3D"font-family:Roboto,&quot;Hel=
vetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import threading<br sty=
le=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-se=
rif">=C2=A0import queue<font style=3D"font-family:Roboto,&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif" color=3D"#888888"><br>--<br>2.29.1.341=
.ge80a0c044ae-goog</font><br></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000095580505b32330d8--
