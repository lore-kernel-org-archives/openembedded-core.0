Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.4353.1604170587033388608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 11:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NRtUc4gl;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id k12so2739556uad.11
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17ut99qCZtPJ+Y8IAX06BWhcxIMW1DU4DJFRAynxayA=;
        b=NRtUc4gl8h1fENo6/4cQM4hKAbHsyTBr4M30woEEPznCpYssB4g376WFILWnLDbz68
         af+h0yUysOki6Tdc7wS/dxHruO7SrAOZz5t9BgubhsZD1o+EqelGV2Y66B+a38MuSldL
         3duhSyNwOLtyvJzhL/qzOONanhANJKKEpn7UCtR8RRqgV+l9+F7/bAFtAOiL5xchziTB
         wNJLjfpooG3MMI9/ubuVDiJ7TfL8EMcOrS/FdudAnxj1a3BcZpUldYNaOmzJXBjWViQz
         h6bpRREEceqP65iIZVg8dBYOl2F0E7pHO0GvPz8Qf0KpuiCCdVhylAfCLjsc4NVsbRH6
         5Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17ut99qCZtPJ+Y8IAX06BWhcxIMW1DU4DJFRAynxayA=;
        b=rdl5ZE/mSFVfqMlsV9eXn/z3WQiWth+mL7p6U0iUbkOZQTxID9j29dDyDILbaY4SN+
         r7vaQKwYZzUBrrS+hfngle/NEMsZ7ZKRJiqi6QsRW0RSAZ/9eW0cvio3bBStINmU5Q5X
         9x7PEXWmaPi16tfQrXc8ZUhoSMj6u3aAb0F4cLvN5YzICUkuQy2iTVV8xYjgd8jeb8WI
         teqph+2wz7qhYp5Ta43kYk52qkx2hlUxWSJCerQo3RQRaYjUjBVsSpRw//eF+GUtQpa9
         cvrRv08Ylkj/HjhS3HZuJr5oZdgJKdGJqQ3HWUkwlPq68CDtSOZZw9Vsx+e9IogGNHRF
         s1nQ==
X-Gm-Message-State: AOAM5332ju2UuXsC1j0u+jZF3OFqflEE6ejPQYvIzOFOfzGOmkCounVl
	TuxepnAFkP4ccj1YV5nEH48Rrf/Svn/o9THsOt0=
X-Google-Smtp-Source: ABdhPJzfJ0Ddxn36AmP7r+8Czc5N56EgzfWZnzvWV7KaJ0ve5/6zUWvP+V+PM2RAW/djGLV04kJ2Nbl2jRgoBZZaleo=
X-Received: by 2002:ab0:23cc:: with SMTP id c12mr913953uan.89.1604170586260;
 Sat, 31 Oct 2020 11:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
 <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
 <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org>
 <CANPvuRn+ZOcnS+Mg_y5dcX+D1QJH__APYqLECGrBt8KVx0fU1Q@mail.gmail.com> <CANNYZj9VosotbYD_xF3u8qqiwKBkcN06f7itUasenXtbriONOA@mail.gmail.com>
In-Reply-To: <CANNYZj9VosotbYD_xF3u8qqiwKBkcN06f7itUasenXtbriONOA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 31 Oct 2020 19:56:15 +0100
Message-ID: <CANNYZj8ZE4wXmyGbK7JZoY0V4K4xgdu-ePhUdJiDxxLV0+pzwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f409f905b2fc112f"

--000000000000f409f905b2fc112f
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2020 at 19:54, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 31 Oct 2020 at 12:49, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> There are great tools on the OE core to check this type of problems.
>> Congratulations for the autobuilder infrastructure. I will try to
>> setup it in near future
>> because they are very useful.
>>
>
> I think there's also a ptest regression for gstreamer:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472
>
> It's not a failure, and doesn't prevent merging version updates, but still
> should be addressed.
>

Here specifically:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472/steps/8/logs/step1c

Alex

--000000000000f409f905b2fc112f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 31 Oct 2020 at 19:54, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sat, 31 Oct=
 2020 at 12:49, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com=
" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There=
 are great tools on the OE core to check this type of problems.<br>
Congratulations for the autobuilder infrastructure. I will try to<br>
setup it in near future<br>
because they are very useful.<br></blockquote><div><br></div><div>I think t=
here&#39;s also a ptest regression for gstreamer:</div><div><a href=3D"http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/buil=
ds/1472</a></div><div><br></div><div>It&#39;s not a failure, and doesn&#39;=
t prevent merging version updates, but still should be addressed.</div></di=
v></div></blockquote><div><br></div><div>Here specifically:</div><div><a hr=
ef=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/147=
2/steps/8/logs/step1c">https://autobuilder.yoctoproject.org/typhoon/#/build=
ers/81/builds/1472/steps/8/logs/step1c</a></div><div><br></div><div>Alex<br=
> </div></div></div>

--000000000000f409f905b2fc112f--
