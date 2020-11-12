Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web12.2950.1605181109737763711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 03:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C7GaW6pV;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id w123so1245474vka.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 03:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNM7CF35HHuoFrTUcgqWJ0GKsLJTG08b7ZZLfJZLY0U=;
        b=C7GaW6pVn5HL8CDHIjwecf0rSbNPklT9sYb6tPWH4mZ8rBpty1AR7WI6rJqjKydeIx
         FbCtGGz7MFRm36Gjxtt2vsVyEo3qU2PbKevqfvhSzZtAY+95xigjhSGvJ/PHJxf+jU7w
         TiapsDKlFAv8gvhDcxpgtbVll4S8Mo2yAN1XIQGTTHqL/TtXho3CTYAVWjsIi22KzXz0
         6MePG0Jy9L81P3nFL3AEiEvHf1z0WoMRvGbBSHYoRSm0LZ3XKkX9gd5FoUiIRBN20K/O
         MBvxo2QFNGy5f8zIImOA6RA9R/kHEcyX1IiplN6idPKDD5Ly4KLfwAR50bZbztcYDoO6
         MHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNM7CF35HHuoFrTUcgqWJ0GKsLJTG08b7ZZLfJZLY0U=;
        b=itBNki87r8gfj9Xg5YvOcuVoRZcQl5vI8wz+2s5GzqIc/oye/AS8TtzI1QPYkDueCq
         AxBXSzK5mGjJER+8pSlRI1t0tzMEHJ/wdpE5VFsCDfyu6dPiC+qGaiTqn76jkbJdAYeY
         PB5G+wgAay7RMI9kMfoG/m8WKlEHmzNdPQCJsy0N/fz7QTgZDxGQTYEpDh0XnI6keLC1
         VEymxXQN3paxqLC92EfDQYW1/QwbtZ8hD4musxV3D3b1+oHnPbjrtHxYNavSEAYePYOt
         st2mD2VSmuIA6i22fIjOZN+4HAr3acPA4zDnXfbAAJEgv7o/nERTLBPzV2qniTwb50ro
         VbNw==
X-Gm-Message-State: AOAM531jyvSiRW9kpt8wjLb4Dmhd36n2dasa5MQXOmPGWAzoNlf2H0XE
	ob2mlTym6jbQR9mr9MzYClYOY9cVdfbHrxuyokCaObZQd8w=
X-Google-Smtp-Source: ABdhPJzA6k+IIhDpmh7w6A2Y5vQfQSXCNFuFQaexTNTz+obdcZLUfm5+79jc6Krvpn2KbI2E52r/jPeTeZOD0dI0G38=
X-Received: by 2002:a1f:5e0b:: with SMTP id s11mr3940165vkb.8.1605181108801;
 Thu, 12 Nov 2020 03:38:28 -0800 (PST)
MIME-Version: 1.0
References: <76c7c436-29d1-1687-1889-72e883697a75@berginkonsult.se> <29322.1605179238305301621@lists.openembedded.org>
In-Reply-To: <29322.1605179238305301621@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 12:38:17 +0100
Message-ID: <CANNYZj_d6uefKzNP1YQ=zGNuG2z0xRs=37Zv1vz3XFvL4i3KPA@mail.gmail.com>
Subject: Re: [OE-core] devtool modify - ModuleNotFoundError: No module named '_sysconfigdata'
To: ernst.sjostrand@lists.verisure.com, Peter Bergin <peter@berginkonsult.se>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca565d05b3e75914"

--000000000000ca565d05b3e75914
Content-Type: text/plain; charset="UTF-8"

If you can provide exact steps to reproduce (the recipe is not available in
oe-core), I can take a look. It's been reported plenty of times, but always
with something not in core and not easily available.

Alex

On Thu, 12 Nov 2020 at 12:07, <ernst.sjostrand@lists.verisure.com> wrote:

> Here are two other threads on the same topic. I've also run into this.
>
> https://lists.yoctoproject.org/g/yocto/topic/74637733#51189
>
> and
>
>
> https://lists.yoctoproject.org/g/yocto/message/50856?p=,,,20,0,0,0::Created,,devtool,20,2,0,77178360
>
> Regards
> //Ernst
> 
>
>

--000000000000ca565d05b3e75914
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you can provide exact steps to reproduce (the reci=
pe is not available in oe-core), I can take a look. It&#39;s been reported =
plenty of times, but always with something not in core and not easily avail=
able.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 12:07, =
&lt;<a href=3D"mailto:ernst.sjostrand@lists.verisure.com">ernst.sjostrand@l=
ists.verisure.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Here are two other threads on the same topic. I&#39;ve als=
o run into this.<br>=C2=A0<br><a href=3D"https://lists.yoctoproject.org/g/y=
octo/topic/74637733#51189" target=3D"_blank">https://lists.yoctoproject.org=
/g/yocto/topic/74637733#51189</a> <br>=C2=A0<br>and <br>=C2=A0<br><a href=
=3D"https://lists.yoctoproject.org/g/yocto/message/50856?p=3D,,,20,0,0,0::=
Created,,devtool,20,2,0,77178360" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/yocto/message/50856?p=3D,,,20,0,0,0::Created,,devtool,20,2,0,7717=
8360</a> <br>=C2=A0<br>Regards <br>//Ernst
<br>
<br>
<br>
</blockquote></div>

--000000000000ca565d05b3e75914--
