Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.8328.1614692175207902946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wb8aYv/S;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id c44so6756064uad.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 05:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zp//S4XUE64oLMjqJ1YGKXyZMl5GuMvCROHSCnMOkz0=;
        b=Wb8aYv/SgGUh4a1/bsk3kUmAHXdpCX++8u6KKd9eVtw/lAuswL3V0numdsPonFQ2pI
         Rc20nwIE6GCYVzlNTYj4eOnrvTqVbhoK0UmDFUA7y23lByeDhV584xsvhuwWtyeQBnub
         V7P8v6bPZi6nhhjAo++ua+oU/Iyb/ieCv6R21u2C79maj0culrjNGuSgTr8D6JBW9TWz
         +KH8W3c7uU6kNwCg5RRnQLHMrmD4t0Rnr1aOgJjXt/Yq/F8T0fwsZ4JjQk/Cn/kj4quJ
         BaNdHgd2MCvUnuXh8Q4xHEiuU/jA7vAZIQ1CO4DsAzpd2vWEWH4MTIfhIo7+DDXUciVR
         JdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zp//S4XUE64oLMjqJ1YGKXyZMl5GuMvCROHSCnMOkz0=;
        b=bF2X3o0Qpx8r1Hjp38xxrCZ4p4oUdJkmRdZrCJWVhOxzLz2/rZsBU6QqCmI2yi4ZFN
         XK9TZoZbbe0QVrbRjhhrXNWdm7C/lN8pc1RYi9gGafiTeBzY0a7/7kMM9mfhqyBsjbZH
         jIt2iYRldcNZzNhuHbuwivyWAzGXoIo7DmYb6E42zSesh4O2jtR8bSpuVB0L6AWUv+WB
         oEGxJL997g1MkqamtjCg1eRoduxR1qvvlAttNamTbsj0JvMj+XOAFuS5XMeg0kFunEeY
         ifxaZRjwYkJ0c/QnbeiXbLq3OPQyDMic+WumkGErEhjRUsSz8FMDVROLx5O1IEIu6YpH
         6Heg==
X-Gm-Message-State: AOAM533IAUg1cEXsE5vu5idp6lTKbD2rGWSJPWrjvHpyzh0kN5/7jktI
	cyuyMWjZsD3HoaGaEa+R4YFqH21T5QkbNGqlonY=
X-Google-Smtp-Source: ABdhPJwx77SzG3u4EJWej0VnH2qHWoxNX9IswN/5TV6KWIJdoHxF/NJg6Cw4V57Rh0e0yfWxh233/p951bteMTFkQZo=
X-Received: by 2002:ab0:29d2:: with SMTP id i18mr6505949uaq.71.1614692174250;
 Tue, 02 Mar 2021 05:36:14 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org>
In-Reply-To: <28099.1614691555012100324@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Mar 2021 14:36:02 +0100
Message-ID: <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Colin Finck <c.finck@enlyze.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000077c76a05bc8dd1de"

--00000000000077c76a05bc8dd1de
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Mar 2021 at 14:26, Colin Finck <c.finck@enlyze.com> wrote:

> On Mon, Mar  1, 2021 at 05:58 PM, Alexander Kanavin wrote:
> > Can you send a followup patch please, on top of master-next?
>
> Here we go:
> https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_build/81024606
>
> Who decides about backporting or not backporting dosfstools 4.2 to Dunfell?
> I can only stress again that a large number of devices in the wild are
> currently running on FAT boot partitions, and come with a dosfschk version
> that likes to destroy these boot partitions.
>

That would be Steve. It's best if you cherry-pick the needed patches into
current dunfell tip, and send them here with [dunfell] prefix, adding the
rationale to the commit messages.

Alex

--00000000000077c76a05bc8dd1de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 2 Mar 2021 at 14:26, Colin Finck &lt;<a href=3D"mailto:c.fin=
ck@enlyze.com">c.finck@enlyze.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Mar=C2=A0 1, 2021 at 05:58 PM, Ale=
xander Kanavin wrote:<br>
&gt; Can you send a followup patch please, on top of master-next?<br>
<br>
Here we go: <a href=3D"https://lists.openembedded.org/g/openembedded-core/t=
opic/patch_dosfstools_build/81024606" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_b=
uild/81024606</a><br>
<br>
Who decides about backporting or not backporting dosfstools 4.2 to Dunfell?=
<br>
I can only stress again that a large number of devices in the wild are curr=
ently running on FAT boot partitions, and come with a dosfschk version that=
 likes to destroy these boot partitions.<br></blockquote><div><br></div><di=
v>That would be Steve. It&#39;s best if you cherry-pick the needed patches =
into current dunfell tip, and send them here with [dunfell] prefix, adding =
the rationale to the commit messages.</div><div><br></div><div>Alex<br></di=
v></div></div>

--00000000000077c76a05bc8dd1de--
