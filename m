Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DB9C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:43:24 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.10677.1642765402696311241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D5+83UkY;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id l1so14500018uap.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=laTF9ren6cyK/8CZcQxU5FFCXNzbAJ2wbZSEMME5MRQ=;
        b=D5+83UkYbz5y6l4AYP5uMbZLmdLZEgaPtee+yMN39KC4QWmUAI4RYKLzDDzIttiuTs
         1qnnRn96dvPOBTsml+iz9V59f5pu66AS7Btrbwhufu4lR9i8dhdr/MKrIxBxNRi6bs6b
         NHoY4EfayEH/HCwiYOxxocK3n5ByJEQ4r7ZlDZOcVeXN/Nym0e2mLXjseuc1eQBCpZEu
         TXcGua4bihCdi9GdJIUkBOr+MP7gtq9NJJ4d39XNgOXeWI+ecfL0A5pW8OgmzNZgm05P
         rLbZefAQLyjfd2yvxCiEjBvi/bpOMZPZM+KARJQ8+jELD7m025UXSX/FeTNV7PK10jV5
         EsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=laTF9ren6cyK/8CZcQxU5FFCXNzbAJ2wbZSEMME5MRQ=;
        b=W8u3JheTw60vlY/YMTyTQOapc6zirg+y6kXudcdOpmzLkkOE11LLW1IICIB2V7mXjy
         Z3xZHRqzIj8FlbVoC6g6VmFbCbpQgTCfDy68PjUr8No49toYipocP2JKRJMKPR0BMb9I
         SU7+nr5+oPvlO0QMgM0nbivEmb4D+EMDxUVlir1H01a/eu8hWzp7Vy8rVhGSw7UzjFl+
         bX9vHI48A3Wdp/L/TqX5LXh5Cvp1mEzkh6v381PGUVvczK9P3om5XR17FYqVyv3vmddJ
         K2dBKmrAS0iHjJrxSoDUBly8GsFoNuGmirn1U96wxY+QvPRV/gnlS/lQwyCE7Q2/Plfc
         LsnQ==
X-Gm-Message-State: AOAM531mHS00gp3qwXO9pQPgmKHcH9v8uMByZiSnnhDsb6hpOXhQx8SP
	u9ef67esJEW8DLwZt5SpKNkZte/Hr3oUnKdFUeg=
X-Google-Smtp-Source: 
 ABdhPJxo7Am5LUeMDoVh3ZsKTVp+p9ac+F1uzhfAMJiVRdnzqYPVSRhUNck6iDUEu4OSU7AGWAmntL/ev0teULS9K70=
X-Received: by 2002:a67:d903:: with SMTP id t3mr1332189vsj.42.1642765401769;
 Fri, 21 Jan 2022 03:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
 <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
 <56724a11b917e32b196f8aeb7c4678c4e0903d49.camel@linuxfoundation.org>
In-Reply-To: 
 <56724a11b917e32b196f8aeb7c4678c4e0903d49.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 12:43:10 +0100
Message-ID: 
 <CANNYZj8SFzeYPNvp87nP0WqL-T5FGAZCRMVOZAfjU7+Q4Jgg2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Ross Burton <ross.burton@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000038ca0305d6162092"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:43:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160819

--00000000000038ca0305d6162092
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jan 2022 at 21:46, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> I think the patch as it stands will actually regress things for many
> users. You
> must be already in the right groups to be able to access kvm on your
> system but
> I don't think that is the default for many distros. On those distros you
> would
> see a "permission denied" message from qemu which users find very
> confusing and
> I think this is why the code is in the form it is in.
>
> We might be able to improve the test further with the open permissions
> Alexander
> mentions but that is probably necessary to make the patch mergable.
>

I guess what we can do for a start is to check if host and target arches
match (e.g. x86 on x86), and then if kvm is not asked for, gently suggest
to the users that they do, for a much better experience, with a link to the
kvm on yocto guide. Then we can look into auto-attempting it carefully, so
that such attempts don't make the experience worse.

Alex

--00000000000038ca0305d6162092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Jan 2022 at 21:46, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I think the patch as it stands will actually regress things for many users.=
 You<br>
must be already in the right groups to be able to access kvm on your system=
 but<br>
I don&#39;t think that is the default for many distros. On those distros yo=
u would<br>
see a &quot;permission denied&quot; message from qemu which users find very=
 confusing and<br>
I think this is why the code is in the form it is in.<br>
<br>
We might be able to improve the test further with the open permissions Alex=
ander<br>
mentions but that is probably necessary to make the patch mergable.<br></bl=
ockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">I guess what we can do for a start is to check if host and target arche=
s match (e.g. x86 on x86), and then if kvm is not asked for, gently suggest=
 to the users that they do, for a much better experience, with a link to th=
e kvm on yocto guide. Then we can look into auto-attempting it carefully, s=
o that such attempts don&#39;t make the experience worse.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000038ca0305d6162092--

