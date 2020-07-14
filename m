Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.6886.1594761878250223121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 14:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=DmkVd/S4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.218.50, mailfrom: mircea.carausu@broadcom.com)
Received: by mail-ej1-f50.google.com with SMTP id lx13so28450ejb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 14:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jH+qmQJDVplNQuiQa/yzgA0+96O46qfMIztjpE3KUYI=;
        b=DmkVd/S4jL1Yb0JkDM0gozf4j5U19bAJ4dycYlbIxWuLxhtWmakofjGk9O/e6iCovk
         PYdVFL81QL572+gKcG0s9XNE4ymlc+evBSFyO+bT8wWsYz5//UwDNZwjCpXHwNnSL2Z8
         VQ9cqmiysnGbZVK1MsHEFUbNC0uPXchUxpBmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jH+qmQJDVplNQuiQa/yzgA0+96O46qfMIztjpE3KUYI=;
        b=bRAlKIu7tw/ODi9RBKEMVDNksm7kgo/P3yU6yguUKK2UR/1lANqFQdQwgkJ+NQO4vl
         KsMvzYTrtvXG4FUFZ4WIEKwwFuPYyZZsPw+QUymOa5LatopsCsykWoFgvb1XqJzY5nM6
         qye7pXdOSPaCF5rebvMGj3On3HXnRF2eNZNj3ld60DNxVTdF4slkvC95uoA4fandwdRB
         8nKJworBYLn6f0RZVrJw32XDbZhlJOqqgA3+vkw17WAjbozLXQZV3JJeIk5KuEPhiHGe
         bPimIjaC0fbksOwC9DULuBZPNfGgNp0zA9P4tNX8rzK8lP0Wn71ObW6CHaWuWUx6v/uK
         aGHA==
X-Gm-Message-State: AOAM530keVRmoIywXtUNnIpNoeTOGtMkkMO7jDFPw5OyZpt4yZ6lIfif
	xwOhb882V2O4nyYZcF12lU+r9OIsERAKHWNGwYi6kQ==
X-Google-Smtp-Source: ABdhPJz+Ps+ibLxwTLevYyfAtd4KS3YHGix8IdQRT7uPiu/qMJDWbMyP1DTOCl5lLHBpBKUPzHNIYM+wLQfbrhbPHqE=
X-Received: by 2002:a17:906:7709:: with SMTP id q9mr6346715ejm.123.1594761876617;
 Tue, 14 Jul 2020 14:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5OMZ8KP=CriR-gsRsiq223_r-N7+yT6Y9_AvPddQb3Fbuscw@mail.gmail.com>
 <CANNYZj_fsrhc02Ox9HZ0npEyU4Wa+2tzWUp7OmADctMaH4o8fg@mail.gmail.com>
In-Reply-To: <CANNYZj_fsrhc02Ox9HZ0npEyU4Wa+2tzWUp7OmADctMaH4o8fg@mail.gmail.com>
From: "Mircea Carausu" <mircea.carausu@broadcom.com>
Date: Tue, 14 Jul 2020 14:24:24 -0700
Message-ID: <CAA5OMZ_EAWHvkQwv5UiM1HWdgCaYTaGM+HxG5sDBV4+1psO4yg@mail.gmail.com>
Subject: Re: [OE-core] tinymembench: fix patch fuzz
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002890f005aa6d6f9d"

--0000000000002890f005aa6d6f9d
Content-Type: text/plain; charset="UTF-8"

Hi Alex,
many thanks for your reply. Will follow it.
-Mircea

On Tue, Jul 14, 2020 at 2:22 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> You can start here:
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> Alex
>
> On Tue, 14 Jul 2020 at 20:50, Mircea Carausu via lists.openembedded.org
> <mircea.carausu=broadcom.com@lists.openembedded.org> wrote:
>
>> Hello,
>> I am new to the list and up-streaming activities.
>> Could you please kindly guide me how to submit a fix for the existing
>> tinymembench.patch
>>
>> (meta-openembedded/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch)
>> Problem:
>>
>> tinymembench patch does not apply cleanly (it succeeds with warnings -
>> fuzz detected). Used devtool to fix:
>>
>> devtool modify tinymembench devtool finish --force-patch-refresh
>> tinymembench ../meta-openembedded/meta-oe
>>
>> I already generated the new patch.
>>
>> What are the next steps (other than local verification).
>>
>> Should I just upload it here for review once I consider it ready for
>> review?
>>
>> Sorry for asking such basic questions....
>>
>> Many thanks,
>>
>> Mircea
>>
>>
>> 
>>
>

--0000000000002890f005aa6d6f9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div>many thanks for your reply. Will follow it.=
=C2=A0</div><div>-Mircea</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14, 2020 at 2:22 PM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>You can start here:</div><div><a href=3D"https://www.o=
penembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded" target=3D"_blan=
k">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded<=
/a></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 Jul 2020 at 20:50, Mi=
rcea Carausu via <a href=3D"http://lists.openembedded.org" target=3D"_blank=
">lists.openembedded.org</a> &lt;mircea.carausu=3D<a href=3D"mailto:broadco=
m.com@lists.openembedded.org" target=3D"_blank">broadcom.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hello,<div>I am new to the list and up-streaming a=
ctivities.</div><div>Could you please kindly guide me how to submit a fix f=
or the existing tinymembench.patch</div><div>(meta-openembedded/meta-oe/rec=
ipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-dir=
ectives.patch)</div><div>Problem:</div><div><p style=3D"white-space:pre-wra=
p;color:rgb(53,53,53);font-family:sans-serif">tinymembench patch does not a=
pply cleanly (it succeeds with warnings - fuzz detected).
Used devtool to fix:</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,5=
3);font-family:sans-serif">  devtool modify tinymembench
  devtool finish --force-patch-refresh tinymembench ../meta-openembedded/m=
eta-oe</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53);font-family:=
sans-serif">I already generated the new patch. <br></p><p style=3D"white-sp=
ace:pre-wrap;color:rgb(53,53,53);font-family:sans-serif">What are the next =
steps (other than local verification). </p><p style=3D"white-space:pre-wrap=
;color:rgb(53,53,53);font-family:sans-serif">Should I just upload it here f=
or review once I consider it ready for review?</p><p style=3D"white-space:p=
re-wrap;color:rgb(53,53,53);font-family:sans-serif">Sorry for asking such b=
asic questions.... </p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53)=
;font-family:sans-serif">Many thanks,</p><p style=3D"white-space:pre-wrap;c=
olor:rgb(53,53,53);font-family:sans-serif">Mircea<br></p><p style=3D"white-=
space:pre-wrap;color:rgb(53,53,53);font-family:sans-serif"><br></p></div></=
div>
<br>
</blockquote></div>
</blockquote></div>

--0000000000002890f005aa6d6f9d--
