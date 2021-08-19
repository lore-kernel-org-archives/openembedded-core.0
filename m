Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.72425.1629390566081775055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qTbj6vAP;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h13so10034754wrp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H5AGdI+WYCXyhbxip3th3+hxh2OBQf81TObT9BWU9z0=;
        b=qTbj6vAP591gkfTm183AxGWEQknJB2JzwNidO6IOzEAc4wMwkf/ybyQbulcYpj1jt8
         gsqb3YXtcriN6AMIQvsYVVuMS5b0HVaLq4LoJPGjwp4jj1hgnJ7vH/6R1bHm5snVBiL9
         DWBwKXO8Mvvr+xfak/iiG0tGMiDMaWnQHbL4bZHcu2B47sbIW9f4PhaLuDRoT4Zxoa7g
         7FE8leZpiCG3IQMFXjSySc/YYlJ8JAPQWWCd/YJTmde1cQxaf5bkC1cl48GY1SX88PWa
         x7niNH9sV9KX0Qd0vLmaeJ42GLY7KRo2plwrvN0PXEIclz+cqgy7PK8Yx2OWUCy+p1dU
         aW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5AGdI+WYCXyhbxip3th3+hxh2OBQf81TObT9BWU9z0=;
        b=gumgQtWC12wOnMAj/VDs2oaIvISS6CcV6J2+2PjFhbFiPm+m7/gkNNQkztomi4dUQX
         O2d19Fg62huh6xfDR4vP1bit3YzjJ+ICXIsTxMKI7tg5vvzOvU1iy1h0z0mVbryix8ER
         GMw+p9P0EJ4MFKCBbWNo3fxpDz+Ha+KbfWWO0WxyBNFqiWOryuejeRcIXSFNn5GflovB
         I0ITx4rc2HSDWDQ8v3mrjNq32S/xZa10kTDt7Olt++IukmYUVheP2e7CU81X4ERPkA8K
         SzVCsa7D/K6cV3yvFGd1ARbm4N2MEa74lVvj/hggh3r1dgxeRZ7QyvhrpuZE4ZpNtGCb
         dNbQ==
X-Gm-Message-State: AOAM533CddY5uNURgVDtADyz8yjZd8NGLqDZlj+VNDrgpDYRBRq+N4/W
	5JEI89UfsGDXq20ieYSgt0mQ9YpWSSCRhznEcuM=
X-Google-Smtp-Source: ABdhPJxDenwSETaMpZ9ENZAMwIQBI1tDaNPUOzNd7/GAvZRc4mTqV7Qpb/fWx5ikPKk+pkzm+i2gcB6U029Q0KtUHYQ=
X-Received: by 2002:adf:f00d:: with SMTP id j13mr5077788wro.14.1629390564641;
 Thu, 19 Aug 2021 09:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811145158.12224-1-JPEWhacker@gmail.com> <CAApg2=QW94Bh2a6iC+YgeDakFB1SjtpT-5KVCb0xKYpQEqRTfg@mail.gmail.com>
In-Reply-To: <CAApg2=QW94Bh2a6iC+YgeDakFB1SjtpT-5KVCb0xKYpQEqRTfg@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 19 Aug 2021 11:29:11 -0500
Message-ID: <CAJdd5GZay3MoH36nYRr5Z8wYK-mK36w4J4ouB4u1ApvaXZbrFw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/cve-check: Move get_patches_cves to library
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Saul Wold <saul.wold@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000ce4cc705c9ec0d0f"

--000000000000ce4cc705c9ec0d0f
Content-Type: text/plain; charset="UTF-8"

I have a branch called jpew/sbom in poky-contrib with my WIP changes.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jpew/sbom

On Thu, Aug 19, 2021, 11:04 AM Marta Rybczynska <rybczynska@gmail.com>
wrote:

>
> On Wed, Aug 11, 2021 at 4:52 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
>> Moving the function will allow other classes to capture which CVEs have
>> been patched, in particular SBoM generation.
>>
>> Also add a function to capture the CPE ID from the CVE Product and
>> Version
>>
>>
> Do you have a link to some resource on how you plan to use it for SBOM
> generation?
>
> Thanks,
> Marta
>

--000000000000ce4cc705c9ec0d0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I have a branch called jpew/sbom in poky-contrib wit=
h my WIP changes.=C2=A0</div><div dir=3D"auto"><br><a href=3D"http://git.yo=
ctoproject.org/cgit.cgi/poky-contrib/log/?h=3Djpew/sbom">http://git.yoctopr=
oject.org/cgit.cgi/poky-contrib/log/?h=3Djpew/sbom</a></div><div dir=3D"aut=
o"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Aug 19, 2021, 11:04 AM Marta Rybczynska &lt;<a href=3D"ma=
ilto:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 1=
1, 2021 at 4:52 PM Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Moving the functio=
n will allow other classes to capture which CVEs have<br>
been patched, in particular SBoM generation.<br>
<br>
Also add a function to capture the CPE ID from the CVE Product and<br>
Version<br>
<br></blockquote><div><br></div><div>Do you have a link to some resource on=
 how you plan to use it for SBOM generation?</div><div><br></div><div>Thank=
s,<br></div><div>Marta<br></div></div></div>
</blockquote></div></div></div>

--000000000000ce4cc705c9ec0d0f--
