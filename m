Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.10697.1619458449135246794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 10:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UiGsxnOi;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id r18so22752465vso.12
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hqlcuHp2pav1kJvYBk2dPY9PfR++pcE0oziHvxo9bE=;
        b=UiGsxnOi3iGkcG+OVIDZIvg8tGxgHMboMydCRXtRqVaqvtaEV1htKgagRKL+7LoGRk
         aJLEPYJnlKuMJ9Vtal5wbGQ4o4Pnftd+Hr1/YLoPnyHGUepIqkj56+/rgoyZdukNUiCL
         1nlFjD6Kh/5+dYco4rEyfiyfZVVg4aXGbsMoD8bQwoRQAMRBvPUcB9UAeBJvRuoUtYOx
         2uIAKFSTMf3QRGzZaYHo1lnV7v7UJ0D2Oy7bNLzCpRzv4jfui9dxSG609wO4i504VK3U
         sqs0jwaPa9Nb9oCl6FeSh1nfv+yUvmWhUv04udG54vfrt1NdITkxM6P714lOFyQmZv7+
         fKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hqlcuHp2pav1kJvYBk2dPY9PfR++pcE0oziHvxo9bE=;
        b=c0F5uOXLnnyd6WhOZWs1g8dVRajGndB9101wnrZlAol3jMZJ1xirjXgH0BDTmLEfH6
         t9O8Gg4j7QlPbJGM+C5Gih/4igu86bINcpUeHtM3lLF88owxb7FgRIq7Zv2JSdgEwoXz
         kDv8UK9qrMBBsWQEKK7KcSO2eXy3Sp7g9cbLnpOSqYceoqHVse8YDn3cbYJfM3Dw4ADO
         lLMX7upmGk19xzFjW/6bdFTvv2gqwtxUYVb+nqVegXLWklNqgTLAeCPCCtMnFn3o3P9v
         Op4FDOnMMuEq7itbGPVLP4MAWjAMKFGHeM6E3QH7FTWPobLVjC1oUFNEDncD0sWoIpM0
         0geg==
X-Gm-Message-State: AOAM531k/pQNVTsz92rVt6H3y5b3e/k9/VegNMLSPMzWCEJPpjMtV4U1
	A7kSHqefJRPjkVmsfOGGbPKT37PocYWvooSpajY=
X-Google-Smtp-Source: ABdhPJxkAzSSeOHyKsCmSKbJ1pCg/HaFBdReVzX/sGxyrUoElSjuWbEFjpS/ZQjCIW+T5iCPY6tdtKyoCL5SuMwMNKQ=
X-Received: by 2002:a67:2ecb:: with SMTP id u194mr13221814vsu.41.1619458448266;
 Mon, 26 Apr 2021 10:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210426104210.789444-1-alex.kanavin@gmail.com>
 <20210426104657.yeyfms3riieplyia@qschulz> <d186182b-637f-fdf0-4188-45ca776333c7@bootlin.com>
In-Reply-To: <d186182b-637f-fdf0-4188-45ca776333c7@bootlin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 26 Apr 2021 19:33:56 +0200
Message-ID: <CANNYZj_FZ5i04cJ2wyGt-SzunQ4ODeGUUAKh7E1tkoax24TbvA@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000899a8d05c0e38da5"

--000000000000899a8d05c0e38da5
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll remember to send versioned patches!

Alex

On Mon, 26 Apr 2021 at 18:11, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Alex,
>
> On 4/26/21 12:46 PM, Quentin Schulz wrote:
> > Hi Alex,
> >
> > Could you please add the v2/v3/vwhatever in the mail subject next time?
> > You can do so by passing `-v 2` to `git format-patch`. This helps us
> > keep track of which version of a patch should be merged (well, it helps
> > Michael :p) and on which patch series to answer/rewview.
> >
> > No need to do it this time :)
>
>
> I agree :)
>
> Thanks for the patch.
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Merged into the "master-next" branch of the yocto-docs repository
> (http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next).
> I should send a new pull-request for inclusion in "master" by the end of
> the week.
>
> Thanks again,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000899a8d05c0e38da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I&#39;ll remember to send versioned patches!<=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Apr 2021 at 18:11, Michae=
l Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.=
opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi Alex,<br>
<br>
On 4/26/21 12:46 PM, Quentin Schulz wrote:<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Could you please add the v2/v3/vwhatever in the mail subject next time=
?<br>
&gt; You can do so by passing `-v 2` to `git format-patch`. This helps us<b=
r>
&gt; keep track of which version of a patch should be merged (well, it help=
s<br>
&gt; Michael :p) and on which patch series to answer/rewview.<br>
&gt;<br>
&gt; No need to do it this time :)<br>
<br>
<br>
I agree :)<br>
<br>
Thanks for the patch.<br>
<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
<br>
Merged into the &quot;master-next&quot; branch of the yocto-docs repository=
<br>
(<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=3Dm=
aster-next" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.or=
g/cgit/cgit.cgi/yocto-docs/log/?h=3Dmaster-next</a>).<br>
I should send a new pull-request for inclusion in &quot;master&quot; by the=
 end of<br>
the week.<br>
<br>
Thanks again,<br>
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000899a8d05c0e38da5--
