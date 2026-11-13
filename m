Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8939.1794569089681278551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XUEaQZe6;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb449364cso18530436d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 03:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569088; cv=none;
        d=google.com; s=arc-20260327;
        b=XqN61fLL32fc/sgWfGYdnjq6hPQKYL/7RuEP4OcEHIspv9EkSbRCb6UAlN5vWt0YCx
         C6GEXPw1EfK2twrw/Id47p2UZHEzVMaeAxKub17wN92A6mcTOWgUMKfqbA18TX0Ad0Cs
         UYir+J3LqbM6wNLQkSYAreSvWRcNzu3yy+pf2NSM3tF6XdAJthBKzDrcF/CDyq3P6pBv
         J85sh/uM9KNpzGXxoSXZbvgcoc7I5qti8iZE2ioljzejrasVBIYCevhJpibHMqx1VFR5
         NHJA1beqt/x5Wvz9nYDxqauzAxmIxvgRNsssw17wHHMK52sW7UPK/BvTehDQM3Nu6BlL
         oVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VEDT6mIR7obiXBCDI37HvPsKZ7kv1bpg2AioH6N7BEw=;
        fh=yQrz9mJWOW9QnPy8ignfyeQd2MXXNzV52tdxU9bi9Bs=;
        b=I/9SUMLBltDKLGfnoNGYggg8PS77GD3O7qJM7RkdbjUcgbRsJfNlM4GGlaqA8lpE3b
         9zw88ULK/pdwCpvUWLWOaIeEOTxFo5PUmie58bBeGr/FladIYEKGvJSLUrtyMD8exXlb
         t3SORvGqgiC68FBr4BEh3f+d/1CTFRfLVotw474Vy5yYaTZtkzBOkEAPLdTwdOjeTksJ
         8kQumd6yX104GysLcKbZZq1PAJhww+Un1+F0HI60FWFDyNxwDfpy7YqRA39keWGMKvcF
         Xo6vsPFz2InYNmJCv0Sop1xh36AoN1VfqhugnfoDpi2EHNPq51OYQBRu4O7uWRdfts/J
         AyCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569088; x=1795173888; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEDT6mIR7obiXBCDI37HvPsKZ7kv1bpg2AioH6N7BEw=;
        b=XUEaQZe6m8zvL+8sTX55xnMHcZHajIm7XalvpmvUwm5u122w5SAEYut8sVQtqJAE2/
         3QI+xlJ59Ba+eJpbbfU1vfz+QLcfUrwu5H4FDgPMt9FzgQ9qq3+EvbrSug4FzrISLn8W
         wgDAfxuomoSUgmBlWuYqjWb5jkoFfJUFxw8G6724njtrvuU9kDl938SqIcDDFJvj+PRh
         Zu2aVnN698Pau/+9+dQgCUjHICdzbQtI2S5RzgtL2BQ4EVzhPZ8bogPBalmVeI6EE9t9
         hUkBa3nqETQ3cR/Z/zJyLfHNAD+hCbCzhJRpngE+NKYI72F63BAvhlNbCq1tc+AYjrQK
         qhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569088; x=1795173888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEDT6mIR7obiXBCDI37HvPsKZ7kv1bpg2AioH6N7BEw=;
        b=IgZ1rbzzr32JMdB4I64QeDm0XrCcP8aDQfTqRo2SmNk0bySTl4pSY7ZGPK4UVUf7xi
         LgsLYoowcKhyiy2Sc9X+qCsNK5PHp2Wux+vliXYKN+K7ikhxWBnm+RoDIGQdn6xQQ9AX
         tYnaxfKArPWI3DYQQ5bnoGSpYnxVVtUCI8lLwB1U54SlWDrlT5V0JZAzMc2blo2e41Ox
         vrisWaQVLlkAZVpr5BE/SOzdbaTivRF/nHthEnB2tN1b5U2q89hZr3lRnpMIpWNaIuoO
         9kky5abQfq9LUPS5emITF2V9J7ltPI0P5id2D3m+/T40GmAWT+tfuzgDSrNfoJ9qEFCw
         Ky6Q==
X-Forwarded-Encrypted: i=1; AL+hErGNYPmPArbPEQUwnf5aRN9WqFqK14I5VUhdHCsLP126S8u0np0j0C8ezEPpi7xHsp7Mzs6OjV+JKxHkENtQiJIr4g==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8uLQgJBTIE2hwM1MnbPefl6XiZLaA++TlctbyyT4fuANMVqZD4
	P77axhIXCW8CKbP+QnXSFN8aAGMkpWQaI+S/EA3rXOlQMQok6LSTrACcLFkAF75o2Vnw/ZsL1AR
	ECUheIkf1LtBrlbv3fa+L5zDwsNgSAdKNNw==
X-Gm-Gg: AYBFou1xjrGdVTjO0DqMwr0/9cnUAGfn2rvUa3JQ/F+nXIBxdtOFWTdsO9D8+kaxKJs
	sTrCVvHjbAZwivdf/b5xeuZhwFps/8rIeU/RALWobwWQQ691E1W0gEMCw2YPsd2x4/CR9K9Qz2a
	6kfIQtjFD9vffunIi9bcdoqIaBFipghMeMrtBNgEih20HdS7flA55f8bgYekx5CY7IHRmBVVbs7
	hH3orx0zrsxPmmepo5TzZ5HghuPMOtO2WUfO5Zaok2YaH12xOSosWML7XU3mOsIGks4zzWQ2T/+
	yk60lA+gvqlfaadW7b+iW/zR5gFhgd0QvW4GRs2ZJMp7sTe/U8ZMtvB9s4rjh8RXUybJhT2A1fK
	9erwinnkxKuWpEZtMlx3ZLZClusSYe8/zeMXwg8RBHsSdIL/ZIacNO31ybp4w2fbuc4VsFl0=
X-Received: by 2002:a05:6214:258e:b0:91b:9061:b7f4 with SMTP id
 6a1803df08f44-91f2421dbbemr31845966d6.42.1794569088510; Fri, 13 Nov 2026
 03:24:48 -0800 (PST)
MIME-Version: 1.0
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
 <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
 <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
 <18E7449543C100DC.893556@lists.openembedded.org> <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com>
 <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com> <DB5PR02MB1021331FEDA82B00E39E86139EF7F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021331FEDA82B00E39E86139EF7F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Nov 2026 12:24:36 +0100
X-Gm-Features: AclHuK-0YdURFeoFr5rbtCOFFf2iMyiVrRxmEhe1tYhY_ZllDW1uD0FN_ciioDU
Message-ID: <CANNYZj9J75S6ApU3g9ayPG3hgDRLpOveLpSVRhvRc3PGh+vmFw@mail.gmail.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Sean Nyekjaer <sean@geanix.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000baf65066026ad3c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250160

--0000000000000baf65066026ad3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You probably have a point here. I'm not sure. Asking the audience :)

Distributing gpl-3 generally requires that users can modify and replace
that code in the context of their use of it. For SDKs that means users
should be able to rebuild and reinstall the SDK with their own
modifications?

We probably should keep the current enforcement as it is (both target
rootfs and SDKs), but add a variable to opt out of it for SDKs only.

Alex

On Fri, 13 Nov 2026 at 12:04, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> That does not sound correct. If you are distributing the SDK, you are
> distributing both native and target code, i.e., the licenses for the nati=
ve
> tools apply as much as the licenses for the target parts. It is very
> unlikely that you will ever be able to distribute an SDK that avoids GPL-=
3
> since many of the core components like GCC, binutils, autoconf and m4 use
> GPL-3.
>
>
>
> //Peter
>
>
>
> *From:* Alexander Kanavin via openembedded-core <alex.kanavin=3D
> gmail.com@lists.openembedded.org>
> *Sent:* den 12 november 2026 12:22
> *To:* Sean Nyekjaer <sean@geanix.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] INCOMPATIBLE_LICENSE
>
>
>
> On Thu, 12 Nov 2026 at 11:47, Sean Nyekjaer <sean@geanix.com> wrote:
>
> My intern pointed me to commit f757ae4dad ("license_image: extend to SDK
> coverage")
> When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populat=
e_sdk
>
>
>
> Due to that change, the license check should probably be then fixed to
> only run for the target rootfs, and not SDK sysroots. Can you reproduce
> this on plain oe-core/poky master?
>
>
>
> Alex
>

--0000000000000baf65066026ad3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You probably have a point here. I&#39;m not sure. Ask=
ing the audience :)</div><div><br></div><div>Distributing gpl-3 generally r=
equires that users can modify and replace that code in the context of their=
 use of it. For SDKs that means users should be able to rebuild and reinsta=
ll the SDK with their own modifications?</div><div><br></div><div>We probab=
ly should keep the current enforcement as it is (both target rootfs and SDK=
s), but add a variable to opt out of it for SDKs only.</div><div><br></div>=
<div>Alex</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, 13 Nov 2026 at 12:04, Peter Kj=
ellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjeller=
stedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg7830855522461467778">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_7830855522461467778WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">That does not sound correct. =
If you are distributing the SDK, you are distributing both native and targe=
t code, i.e.,
 the licenses for the native tools apply as much as the licenses for the ta=
rget parts. It is very unlikely that you will ever be able to distribute an=
 SDK that avoids GPL-3 since many of the core components like GCC, binutils=
, autoconf and m4 use GPL-3.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Alexander Kanavin via openem=
bedded-core &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;
<br>
<b>Sent:</b> den 12 november 2026 12:22<br>
<b>To:</b> Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=3D"_=
blank">sean@geanix.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] INCOMPATIBLE_LICENSE<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">On Thu, 12 Nov 2026 at 11:47, Sean Nyekjaer &lt;<a h=
ref=3D"mailto:sean@geanix.com" target=3D"_blank">sean@geanix.com</a>&gt; wr=
ote:<u></u><u></u></p>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">My intern pointed me to commit f757ae4dad (&quot;lic=
ense_image: extend to SDK coverage&quot;)<br>
When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populate_=
sdk<u></u><u></u></p>
</blockquote>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Due to that change, the license check should probabl=
y be then fixed to only run for the target rootfs, and not SDK sysroots. Ca=
n you reproduce this on plain oe-core/poky master?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000000baf65066026ad3c--
