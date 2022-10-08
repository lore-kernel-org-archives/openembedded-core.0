Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E278C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 22:42:15 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.8699.1665268930614018437
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 15:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qM9CWqZg;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id l22so11391283edj.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QmNsXZmwBlo9Y4baYvsWoVne6X+IbBo+MN4kykmfW70=;
        b=qM9CWqZgRaBWWYWt1NFrS+0KmHcbPg1DG7+/5ImHaGbZnXREXNmDQ3DAxzKROj4csu
         TJVhEkPkXCg6ufiEIj+0axBujXrxjS4WOi3+P+sJ73I6E9QaW18v88/QxxZibqlvQSdf
         sjO2lJVIAaQR+Jtu6SxCY7eTYV9MUkRl11Dmc5tbz3zc2t6oouqEzELVH48ejVv8A9vU
         Dxz+qZZ6YrLgp4QEmFNZtJChcZ6K0+HdHTn0jb2lKao/yADB+sY5Lf+gEZbKLgR30HY0
         r/Dt7UM1laFR6nXsNkhkw49Xy+JXuAUbYCrzk/6s4ltsug2r+Sb8T8Q3OyZdscCqYu5S
         QgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmNsXZmwBlo9Y4baYvsWoVne6X+IbBo+MN4kykmfW70=;
        b=msdhccKAcPWT7hZhlQXmKTY9FJF3BV2DH2151U7KHL6xn9U8VV8w3Ex+Jf6IgzCVlb
         aAOhAx3j2rJys+pjyNmPZIity0z2vTx86aEpXFEDVfRkxo5L4kobjvhoFe6o0RF0zYzH
         NLwT0bawnvE4T9P9z/tl/wkMBYCe/HI5AjjGRJwPgFCo8Bn0kIbFMTFtufR0OYd0liA4
         GSa4vGJR8/hr3TWRPVv1wyXSYmIDtSUxwfbS/T3/f36+Z11U9i+bJQqtP/sUDnGAJiuM
         TovmwVklTlkzTQC9MDHLDkEJN5gZ6XqnYAVAVuzT3KyHLUrphnoUcCFe6wnwWV+D/18H
         lvWQ==
X-Gm-Message-State: ACrzQf0tTPV5eBVbIuNNv7I1O15JS124B0s2KuzhNhM87QNIl0YsFd4/
	YV+Ns7aaU8/elgotXwwhOIknIogdT6mGvFUzGmg=
X-Google-Smtp-Source: 
 AMsMyM5MSxafC2XPec50PmFu3V+cuwPn5IyqdRn0/W51rpIDrfNK2Jxq0SeEibRfmqlRBi3Kt5N4HUnNZJx8NY+d66s=
X-Received: by 2002:aa7:cdcb:0:b0:459:e3a6:2df9 with SMTP id
 h11-20020aa7cdcb000000b00459e3a62df9mr10693614edw.105.1665268928699; Sat, 08
 Oct 2022 15:42:08 -0700 (PDT)
MIME-Version: 1.0
References: 
 <010101839477e521-59c97957-a82c-4797-afe7-3275325a3dd3-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101839477e521-59c97957-a82c-4797-afe7-3275325a3dd3-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 8 Oct 2022 15:41:57 -0700
Message-ID: 
 <CANx9H-A6nu+ogMRoapzC9952dt15ban7So7MorCao_4V4=cPbw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] at-spi2-core: upgrading to 2.46.0 FAILED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Tim Orling <tim.orling@konsulko.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f35fd505ea8da2bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 22:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171537

--000000000000f35fd505ea8da2bf
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 1, 2022 at 9:55 AM Auto Upgrade Helper <auh@yoctoproject.org>
wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *at-spi2-core* to
> *2.46.0* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed


I have a WIP upgrade, but it drops atk and at-spi2-atk (merged into
at-spi2-core) and that is invasive with other recipes.
PACKAGES += "atk at-spi2-atk"
RPROVIDES:${PN} += "atk at-spi2-atk"
Should make this backward compatible, but more work is needed to split out
the contents of "atk" and "at-spi2-atk" packages.
 https://git.yoctoproject.org/poky-contrib/log/?h=timo/at-spi2-core_2.46.0


>

>
> Next steps:
>     - apply the patch: git am 0001-at-spi2-core-upgrade-2.44.1-2.46.0.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171333):
> https://lists.openembedded.org/g/openembedded-core/message/171333
> Mute This Topic: https://lists.openembedded.org/mt/94055775/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f35fd505ea8da2bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 1, 2022 at 9:55 AM Auto U=
pgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org">auh@yoctoproject.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.46.0*=
 has Failed(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed</blockquote><div><br></div><div>I have a WIP upgrade, but=
 it drops atk and at-spi2-atk (merged into at-spi2-core) and that is invasi=
ve with other recipes.</div><div>PACKAGES=C2=A0+=3D &quot;atk at-spi2-atk&q=
uot;</div><div>RPROVIDES:${PN}=C2=A0+=3D &quot;atk at-spi2-atk&quot;</div><=
div>Should make this backward compatible, but more work is needed to split =
out the contents of &quot;atk&quot; and &quot;at-spi2-atk&quot; packages.</=
div><div>=C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=
=3Dtimo/at-spi2-core_2.46.0">https://git.yoctoproject.org/poky-contrib/log/=
?h=3Dtimo/at-spi2-core_2.46.0</a></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-at-spi2-core-upgrade-2.44.1-2.=
46.0.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171333): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171333" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171333</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94055775/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94055775/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f35fd505ea8da2bf--

