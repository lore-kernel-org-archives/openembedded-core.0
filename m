Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.1.1620072208509003521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 13:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuYaE/CZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: paulo.zaneti@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id k19so3615543vsg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3gMs0XJyCymgEiBCBu4dIsSd4u02ofzPphDAhDTQ5xw=;
        b=YuYaE/CZGfD2vYlbUPkVXzl7PQwIqJmKeMnYu1RrzAXGAU+oUg2O5LE8wTUARACwfM
         YNZWg9V5BaqkTYOxOvdik9yVr4+9HtKaECBVe2SZfihIhRp6eEDiN3J67KBOPkjoLV3T
         Ek711YYmWOBBg6dCXqwNO+uh5nlYqPm0e55PMSrQ3H4qDGO/tlPSk3qF562o02+9CKZa
         NkHYR+TR2w9wgwGOTYst4NCZJfvtfFLEwCy4rAqULnqJX92VthvFdkPwvBLCIB1XvFU1
         /ea2v1i36aw/uO+g719qr5JQO6+GRFvwKNgIIb2uCVnw2wDwKrHU/k+akYq+MkAKIQKy
         jusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gMs0XJyCymgEiBCBu4dIsSd4u02ofzPphDAhDTQ5xw=;
        b=Wy7fLkxXegNR5fNiM40ejQBLPodUUBj087ATCk+8dcBOGxbkkFHyrW5VIYaQkLC0xD
         gbiSxibmDSTX2Zce8wEfMH+pXYYpcp6RkyOysKbqRY7KpoaadzxQC0vbwRd/sZYssDLH
         aVSziNmvA+nDKCY9Nm/eXFvauncKPcDld9NYxqFgqJdlKq8dTLDRtJkzAX6e3QEU21Z/
         eZpY3Iv03vyR40eLqdE5Ow4BYPQ/RWNbhMDPMIl6EY0KXYuSM9Q2TQGJ37bxcFcntH6b
         7eocAkuHmNsjn+hjXYIhpIhI36+DZgBrl9wvpEQo2h9IIcsyNO8YJaSAP4p9fR6ONeHp
         0KyQ==
X-Gm-Message-State: AOAM532pOG7nXLPO9/KfyI2l6kBPXhYK674d2WOfkWH2MQnN5bQeFhvu
	pWjbirOq2lHbI5Wfne8uLHf8lf68GY4ieBTVCd8=
X-Google-Smtp-Source: ABdhPJyjGtl7UWz+3t9eAMpi5m1e7iUiWMLdVulVrUOpcT3U3YqB5/pdXBEOkUtFCs3FaTW6mYh9k11IcwXDEaXkqMU=
X-Received: by 2002:a05:6102:30ae:: with SMTP id y14mr8659830vsd.30.1620072207437;
 Mon, 03 May 2021 13:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <4145ce915f734aae9f53ab2575521f2d@intel.com> <25102.1618841602267269069@lists.openembedded.org>
 <28e9a1a4251849bcafde43dc01684bd5@XBOX03.axis.com> <CAP9ODKp3n3gx-Op-4MnqkmnV=6TbJcF3hSA+Wc4dKQjH3A6ykQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp3n3gx-Op-4MnqkmnV=6TbJcF3hSA+Wc4dKQjH3A6ykQ@mail.gmail.com>
From: "Paulo Cesar Zaneti" <paulo.zaneti@gmail.com>
Date: Mon, 3 May 2021 17:03:15 -0300
Message-ID: <CAP77v2qZx8P0P8S0NrXFPM-9HGvhUrZP_cJhQZN5PysgYK39FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f52fe05c1727499"

--0000000000006f52fe05c1727499
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I agree to revert until we find out a solution for everyone needs.

Should I send a patch reverting it ?

On Mon, May 3, 2021 at 4:56 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello,
>
> Couldn't the OE-Core:f2d1523b19cb066a4a06609f036822fe4a8b43f0 to be
> reverted in meanwhile?
>
> Em sex., 30 de abr. de 2021 =C3=A0s 17:42, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> escreveu:
>
>> Well, it did break our builds. I now get the following error when
>> building a native recipe that inherits perlnative and tries to run pod2=
man:
>>
>>
>>
>> | /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/pod2man:
>> /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad interpreter:=
 No such
>> file or directory
>>
>>
>>
>> This is because the first two lines of the pod2man script now looks lik=
e
>>
>>
>>
>> #!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl
>>
>>     eval 'exec /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl -=
S $0
>> ${1+"$@"}'
>>
>>
>>
>> instead of the previous:
>>
>>
>>
>> #!/usr/bin/env nativeperl
>>
>>     eval 'exec /usr/bin/env nativeperl -S $0 ${1+"$@"}'
>>
>>
>>
>> I.e., the sed command in perl=E2=80=99s do_install_append_class-native(=
) does not
>> seem to have done anything, which is because there is no
>> =E2=80=9Cperl-native.*/perl" in the path to match (as can be seen above=
), it is
>> just =E2=80=9Cperl=E2=80=9D, which is what the old code was looking for=
.
>>
>>
>>
>> [ In the above examples, I have replaced a longish part of the path wit=
h
>> =E2=80=A6 to protect the innocent. ]
>>
>>
>>
>> //Peter
>>
>>
>>
>> *From:* openembedded-core@lists.openembedded.org <
>> openembedded-core@lists.openembedded.org> *On Behalf Of *Paulo Cesar
>> Zaneti
>> *Sent:* den 19 april 2021 16:13
>> *To:* openembedded-core@lists.openembedded.org
>> *Subject:* Re: [OE-core] [PATCH] perl: fix startperl configuration
>> option for perl-native
>>
>>
>>
>> I just re-send the patch with additional fix for the build failure.
>>
>> I think the basic problem was an inconsistency in the way perl recipe a=
nd
>> cpan.bbclass convert the absolute perl path to env path.
>> Version 2 of the patch tries to use same cpan.bbclass approach on the
>> perl recipe.
>>
>> Before submitting I just ran "bitbake -k world". I hope it doesn't brea=
k
>> the build again.
>>
>>=20
>>
>>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--0000000000006f52fe05c1727499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I agree to revert until we find out a solution f=
or everyone needs.</div><div><br></div><div>Should I send a patch reverting=
 it ?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 3, 2021 at 4:56 PM Otavio Salvador &lt;<a href=
=
=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com=
.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Couldn&#39;t the O=
E-Core:f2d1523b19cb066a4a06609f036822fe4a8b43f0 to be reverted in meanwhile=
?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Em sex., 30 de abr. de 2021 =C3=A0s 17:42, Peter Kjellerstedt &l=
t;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kj=
ellerstedt@axis.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">





<div lang=3D"SV">
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>Well, it did break our builds. I now get the following error when building=
 a native recipe that inherits perlnative and tries to run pod2man:<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">| /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/=
usr/bin/pod2man: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad=
 interpreter: No such file or directory<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>This is because the first two lines of the pod2man script now looks like<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">#!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/p=
erl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /home/pkj/=E2=80=A6=
/recipe-sysroot-native/usr/bin/perl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>instead of the previous:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">#!/usr/bin/env nativeperl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,5=
4,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /usr/bin/env native=
perl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>I.e., the sed command in perl=E2=80=99s do_install_append_class-native() d=
oes not seem to have done anything, which is because there is no =E2=80=9Cp=
erl-native.*/perl&quot; in the path to match
 (as can be seen above), it is just =E2=80=9Cperl=E2=80=9D, which is what =
the old code was looking for.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>[ In the above examples, I have replaced a longish part of the path with =
=E2=80=A6 to protect the innocent. ]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
>//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bor=
der-style:none none none solid;border-width:medium medium medium 1.5pt;padd=
ing:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openemb=
edded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Paulo Cesar Zaneti<br>
<b>Sent:</b> den 19 april 2021 16:13<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix startperl configuration op=
tion for perl-native<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I just re-send the patch with additional fix for th=
e build failure.<br>
<br>
I think the basic problem was an inconsistency in the way perl recipe and =
cpan.bbclass convert the absolute perl path to env path.<br>
Version 2 of the patch tries to use same cpan.bbclass approach on the perl=
 recipe.<br>
<br>
Before submitting I just ran &quot;bitbake -k world&quot;. I hope it doesn=
&#39;t break the build again.
<u></u><u></u></p>
</div>
</div>
</div>

<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Otavio Sa=
lvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossy=
stems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank=
">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div>
</blockquote></div>

--0000000000006f52fe05c1727499--
