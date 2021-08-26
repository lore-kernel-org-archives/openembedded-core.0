Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web08.29125.1629978677164721411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 04:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eA1B2Yjp;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id u138so760006vku.7
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekPqjkwPmOOVG4EVoQiMA3b1lLreycaM3iulu/PuI24=;
        b=eA1B2YjpCffGhPOFDCNAcVESTdgfJm/t+JngsJGjV6BCDt5l6E0GFAeYGJSCf/0Ywk
         wp0j9LLdaeMV8JfNZM/z98sZEMsSKoz7tDZWiWcYLbwFFo9N/QMBawqPN1Vv9iMVvPOO
         9cll6O9bL2iU5tdKZFs05ljlRa+Pb+y4YAQBW79/6QoAnbJvBLwrTofnDYQiMiMKxFJI
         jGjgGMPc/WUPUA15Ee2nvpH/z/vQyjcdc3kF0Z+9+AjlbF14+W5NfJPcN/Mwsa6aQTd3
         PIeLpi1U1DNYyvGOZHZnoqPxLZ8mP+u5jN8J8pHT1LW03G4dG6PnEr86bJcZITiWbiuD
         hFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekPqjkwPmOOVG4EVoQiMA3b1lLreycaM3iulu/PuI24=;
        b=TVBqfY5ovA90pcYFDPBb/SEctko9xVYi3u1H/Sw8xgMlz+BoN+9aKGfixOfsjwSKLD
         3udboYioQtTLfYNlBz+nQ/C12a4AV2W5iOmomlpoL6bft8g3AQPCuSv3xcolr4BgwOzS
         zou0qdk6JySV/AShrRnuZQINr08g2EDhPqjbjHIMBfxjczVNPs+oL+iBjbKJFiC0fM32
         wewzHPs8eOeXaHOaHoZ/dKZ9VaNAc86GseXNsBckSl7WL45wjd+R/4QN8pXsyfa/CCoH
         y/oSEbUJ3RXa3iunVz9Tzw4xmW55EW+P8qspkY3K6KVmBQaiNfMgialp4AiFa1kvrLEI
         A5uw==
X-Gm-Message-State: AOAM531twmNKvqoPRX/pQbhteNTCJa2n2ATEz5kSkFsiMKqAl4eyTezz
	ZcpAaR8EUTtgNZuvAZyI/png5Dfh0lVnJO1nxoM=
X-Google-Smtp-Source: ABdhPJwY/WjKju8LW6OPOzviJsAIn1890k59QTccRZZKyFCE3IeOqbiK0+bnj2oKC7sKtY/Pd76Kxz4GhAc9ffX4mmw=
X-Received: by 2002:a1f:b615:: with SMTP id g21mr1592845vkf.16.1629978676262;
 Thu, 26 Aug 2021 04:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
 <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
 <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
 <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net> <20210825175143.Horde.LbItpKT-Y6zl0vjVCim0eFh@crashcourse.ca>
 <CANNYZj9risHPrhCMDEb7bpe8xsC_k08istpzp5T+EgZQensUng@mail.gmail.com> <e3912bb5-68ac-9c84-d196-3a2bd436382@crashcourse.ca>
In-Reply-To: <e3912bb5-68ac-9c84-d196-3a2bd436382@crashcourse.ca>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 26 Aug 2021 13:51:04 +0200
Message-ID: <CANNYZj8ZPNqxyKbggtHAQFfrcGEkwz_jgLfOgU4mtcTpE4Ptgw@mail.gmail.com>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Phil Blundell <pb@pbcl.net>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd7a1c05ca74fbc4"

--000000000000fd7a1c05ca74fbc4
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Aug 2021 at 11:23, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   so, just to confirm the previous tidbits of information (thank you
> for your patience), here's my current understanding so i can submit
> updated docs:
>
> * pkg_postinst:${PN} is run at image creation time and *only* at image
>   creation time; it is no longer deferred to boot time under any
>   circumstances(?)
>

If a package is installed on directly target using a package management
system,
this will run there. Also, if the snippet does contain an explicit call to
the defer to first boot
hook as a part of its logic, then that will happen, and the same code will
run again on first boot.


> * pkg_postinst_ontarget:${PN} is run at boot time and *only* at boot
>   time
>

First boot, or package installation on target.


> * because of the above, there is no value to the numerous legacy
> checks of:
>
>   if [ -z "$D" ]
>   if [ -n "$D" ]
>
>   or any of its variations (even though, in a lot of cases, they don't
> hurt)
>

There might be use cases for doing explicit manual logic where you want
full control over
a) checking what environment you're in
b) doing first boot deferral.
In that case, you want to use $D and the hook directly. But most are legacy
scriptlets that need converting for readability.



> * from within pkg_postinst:${PN}, you can still defer some work to
>   boot time with "postinst_intercept delay_to_first_boot", although
>   isn't this precisely what pkg_postinst_ontarget:${PN} is for, so is
>   this postinst_intercept construct still useful?
>

_ontarget is basically a wrapper for the delay to first boot hook. It might
be useful
for manual control, as explained above.


> * PACKAGE_WRITE_DEPS is still necessary to identify non-standard
> native tools you might need for any pkg_postinst:${PN} processing
>

Yes.

Alex

--000000000000fd7a1c05ca74fbc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 26 Aug 2021 at 11:23, Robert P. J. Day &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 so, just to confirm the=
 previous tidbits of information (thank you<br>
for your patience), here&#39;s my current understanding so i can submit<br>
updated docs:<br>
<br>
* pkg_postinst:${PN} is run at image creation time and *only* at image<br>
=C2=A0 creation time; it is no longer deferred to boot time under any<br>
=C2=A0 circumstances(?)<br></blockquote><div><br></div><div>If a package is=
 installed on directly target using a package management system,</div><div>=
this will run there. Also, if the snippet does contain an explicit call to =
the defer to first boot</div><div>hook as a part of its logic, then that wi=
ll happen, and the same code will run again on first boot.<br></div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
* pkg_postinst_ontarget:${PN} is run at boot time and *only* at boot<br>
=C2=A0 time<br></blockquote><div><br></div><div>First boot, or package inst=
allation on target.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
* because of the above, there is no value to the numerous legacy<br>
checks of:<br>
<br>
=C2=A0 if [ -z &quot;$D&quot; ]<br>
=C2=A0 if [ -n &quot;$D&quot; ]<br>
<br>
=C2=A0 or any of its variations (even though, in a lot of cases, they don&#=
39;t<br>
hurt)<br></blockquote><div><br></div><div>There might be use cases for doin=
g explicit manual logic where you want</div><div>full control over <br></di=
v><div>a) checking what environment you&#39;re in</div><div>b) doing first =
boot deferral.</div><div>In that case, you want to use $D and the hook dire=
ctly. But most are legacy</div><div>scriptlets that need converting for rea=
dability.<br></div><div><br></div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
* from within pkg_postinst:${PN}, you can still defer some work to<br>
=C2=A0 boot time with &quot;postinst_intercept delay_to_first_boot&quot;, a=
lthough<br>
=C2=A0 isn&#39;t this precisely what pkg_postinst_ontarget:${PN} is for, so=
 is<br>
=C2=A0 this postinst_intercept construct still useful?<br></blockquote><div=
><br></div><div>_ontarget is basically a wrapper for the delay to first boo=
t hook. It might be useful</div><div>for manual control, as explained above=
.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
* PACKAGE_WRITE_DEPS is still necessary to identify non-standard<br>
native tools you might need for any pkg_postinst:${PN} processing<br></bloc=
kquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">Yes.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>Alex<br></div></div>

--000000000000fd7a1c05ca74fbc4--
