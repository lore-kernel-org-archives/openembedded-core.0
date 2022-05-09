Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB2AC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 15:27:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.33724.1652110037794655963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 08:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HotnfL1p;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id kl21so10672741qvb.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qME5SRBVrjBV488+rhSb3lXbdvpmoDY4SMFA+pudptc=;
        b=HotnfL1p6LX2m21SED2L82iV2AT5LiHgeQSvn/DB4iduEkXrbkZmXHqNScQKLJsKM/
         xq5G9AZsLzddnK4liCC6/EAr84vN9vCfLHUDIcqD7o0cv6Ob+5vRVOq+3iyTK9tcuECI
         SFwUkr7/DiEi4r+LAKbLGktGw7yaBQ9kqo05JDWhb+QmEl+PdepknaVsExdnRqJBBoYh
         skkwZQEGzwnGO0F1wza+zZ20PpiLo/NY5uy1Z7YuUWpiN5Wlai7CFYeKWL6N36cdN9aY
         TYx/mNz6mnQKaf8iFuMEXlsK0ZwM7DtZUiMSbxJ0P2ENICbYKPPFqyMeg6qvCoVVcwom
         aCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qME5SRBVrjBV488+rhSb3lXbdvpmoDY4SMFA+pudptc=;
        b=sdRzcn/bN4oo0K8V5TL4F3Egu/vuh8o+4H4KDdjxYDoN5hA10rcaqSgSgKpReCYudv
         ID1NqoofnVPeyk4SBenMimsgfm7jTE4c7y5XtpVnoXRCondQkWt2Lg4d0uama5VD+Fwm
         ZSqzaM3zJ0ESb6uHOZMOzsDFE15x0AxexE/WSlLD5wDFhzKlD1cdWawZVwAVVxL8DLAr
         8EdTnyED1nlqMVUg3btZ4QtmQL3KU//gKiDPQA1K1epWwc0iln3fUFvJc5UZxFNFaG3A
         fABsvKuQpvQpN0sdY9YDVKuznaO5gUOXvdYjK5yprb1ad7ismfuZlhJl751OSr09T0ma
         dn/g==
X-Gm-Message-State: AOAM531tge9YjqI+48X0vsyBAM9MTNRCG3Fti1R3OqHjm/iO/1FIV361
	8ePprnk9Q086t5BceeT7b+76Ct5VLg+Y48Aa69A=
X-Google-Smtp-Source: 
 ABdhPJwyQyDQbAUzjZis6jwSoYJZ749vhS6ozFy6a06oL93d/Yi054R1zQq0inxX7Afv//JujE8kRcRxf9N1aczhXj4=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr7285725qvb.36.1652110036710; Mon, 09
 May 2022 08:27:16 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 May 2022 08:27:06 -0700
Message-ID: 
 <CAMKF1sontKL6cGgcCSxxo3WmKU7jeDWDKkT+WChBjduweezH0Q@mail.gmail.com>
Subject: Re: [OE-core] gcc12 testing results
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de374f05de95d72e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 15:27:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165400

--000000000000de374f05de95d72e
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 6:24 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, May 6, 2022 at 11:14 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > 5.10 and edgerouter:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
>
> I just sent the yocto-bsp bump to 5.10.113, which had the identified
> -stable fix for gcc12. I can't say it is 100% complete at runtime for
> gcc12, but this moves us along.
>
> >
> > and meta-virtualization has a couple of issues:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
> >
>
> I pushed the patch that Ross found on opensuse for gcc12 and Xen. I
> can only say that it doesn't break gcc11 at the moment, but again, it
> moves us along.


Thanks I will test it locally as well since I have xen workspace handy atm

>
>
> Bruce
>
> > Build is still going.
> >
> > Cheers,
> >
> > Richard
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#165340):
> https://lists.openembedded.org/g/openembedded-core/message/165340
> > Mute This Topic: https://lists.openembedded.org/mt/90935511/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000de374f05de95d72e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 9, 2022 at 6:24 AM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Fri, May 6, 2022 at 11:14 AM R=
ichard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; I reran the gcc 12 testing. We still have an issue with linux-yocto<br=
>
&gt; 5.10 and edgerouter:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/111=
/builds/3046" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/111/builds/3046</a><br>
<br>
I just sent the yocto-bsp bump to 5.10.113, which had the identified<br>
-stable fix for gcc12. I can&#39;t say it is 100% complete at runtime for<b=
r>
gcc12, but this moves us along.<br>
<br>
&gt;<br>
&gt; and meta-virtualization has a couple of issues:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128=
/builds/46" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/typhoon/#/builders/128/builds/46</a><br>
&gt;<br>
<br>
I pushed the patch that Ross found on opensuse for gcc12 and Xen. I<br>
can only say that it doesn&#39;t break gcc11 at the moment, but again, it<b=
r>
moves us along.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">T=
hanks I will test it locally as well since I have xen workspace handy atm=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Bruce<br>
<br>
&gt; Build is still going.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#165340): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/165340" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/165340</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90935511=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90935511/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000de374f05de95d72e--

