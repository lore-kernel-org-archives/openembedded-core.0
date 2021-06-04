Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.358.1622819391688676838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WJNyU6X9;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.43, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f43.google.com with SMTP id n4so9679347wrw.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RDf/ts9ayWrA/apm96XtjdoJ4gqevV5OY3JOpZzrcyk=;
        b=WJNyU6X9ICCKhGEIPqfaw64zwXdsfFR0Jz5xiVQnPYxkicCTPO0uPk7XqBothTGY4F
         bfjZbkdQ46qXuecOJMj6f+b+i75SYduDatQ4yCBBPaOQSyIYHiTpuvXiD9U70V84XQIC
         ybjPMRvljjOIc6RDxovI5Av7H9Wg8NnZgCV+J9MdKyFGYxfdAFUOeiYaYk5RxXeLis8+
         x9rSVs/VPTJxVAP+XqN6O0irccZdsrobVKTB10VWjTJq+HpvHv6R4hJTKsPYFr+4KR/x
         foJFwR1HBJXHjJCgLurVBOZ58foOaV5A49ban5wwkYMEECmZBVNWNESxeMOyYaVqNzlI
         7zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RDf/ts9ayWrA/apm96XtjdoJ4gqevV5OY3JOpZzrcyk=;
        b=eQHDJQ2xhU+c98Vy3yy3XJcosxxzKFiwyuluE8PL741SQxJQmyYLY5DLYXFSj5ckH3
         cjeNOIRTW2w1/F5h3Al/jyJYHfjV0rspH3jENe7uF+2UR8RbtMEYUhanAlaW1GcBtkXx
         9odl2Hvm51q2MyRl3jMqltc+ccWUxrVZORH4tjqiphWz7YY4mr5nW1nX0Nfk0EpK+WS0
         jJsLXGR4zqedSWdpcaMatbxV3zbS7JZ/reoW5LhVtshhmn07GjVYnNqvUjbhiqlWgolT
         wb/ZWUmtXN+XGjUCTxDNeDqdeOOtzy3AM9RbVxmFGQO6rOXws5Y76ziNFj8FtTEPJpvM
         aOFg==
X-Gm-Message-State: AOAM531OKFBWCXrCiYsLg0B/M2baTuSG75qIcBDVzCec9hRuvFzL7cW0
	P6AwG50VHYKg7fM/YRfTtcTj6WonLtIuHw6sBfnPug==
X-Google-Smtp-Source: ABdhPJx3H7OQgi0sff5Hk4RPJmqubpU8YbW+VjDwpxLqi0Cj12XGpuV+C3PnsDG69aafFL/AGFI75FXxvBLllB9RbkU=
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr4397234wrz.350.1622819389690;
 Fri, 04 Jun 2021 08:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
In-Reply-To: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 4 Jun 2021 05:09:37 -1000
Message-ID: <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
Subject: Re: Request to backport KERNEL_DTC_FLAGS to Dunfell
To: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ovidiu.panait@windriver.com" <ovidiu.panait@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"toertel@gmail.com" <toertel@gmail.com>, 
	"RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2021 at 2:45 AM Jonas Mark (BT-FIR/ENG1-Grb)
<Mark.Jonas@de.bosch.com> wrote:
>
> Hi,
>
> We are using DT overlays and have the need to pass the -@ parameter in DT=
C_FLAGS to Linux' make. The patch
>
> "kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags"
> https://git.openembedded.org/openembedded-core/commit/?h=3Dhardknott&id=
=3D063b5de86624a42b0aa784db6dddc7552a6dee7f
>
> makes that possible in a nice way. Would it be reasonable to request back=
porting of this patch to Dunfell?

This is sort of in the grey area between feature and bug fix.  It does
seem relatively safe, so I would consider taking the patch if there
are no objections from the community.

Added Bruce to the cc list to get his opinion.

> We were also wondering what could be an alternative approach for getting =
this or a similar functionality. Patching a bbclass using a bbappend is not=
 possible, is it?

No, there is no equivalent of bbappend for classes.

Other solutions are possible, but taking this patch would be the
cleanest solution to your problem.  Let's see what others think before
we go there :-)

Steve


>
> Cheers,
> Mark
>
>  Mark Jonas
>
> Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | www.boschsecurity.com
> Tel. +49 89 6290-1105 | Telefax +49 89 6290-281105 | Mark.Jonas@de.bosch.=
com
>
> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Christian Fischer; Gesch=C3=A4ftsf=C3=BChrung:=
 Thomas Quante, Andreas Bartz
>
