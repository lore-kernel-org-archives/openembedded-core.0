Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7658C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 13:08:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.4994.1640005704581615186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eM0KmOke;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u16so2014695plg.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q/AF1MAmIheOBk8ihPHO01I0rsAns4DNXYNXx/F6xQE=;
        b=eM0KmOkegKEGlMXauIGRPZDyVr6Z2f1lf5jtzq4Woqy0To2yojprk5k/XCGWNuzjoz
         D3lhlno4ocTdiRPckL2rIKGnBtWObk6Pw+TCwnM/kRllmHP5LQXGkC6sADGpiwihfM/m
         rj606a+sK89OIjDes2SXcSMXUKt/yuBUDVn5AgR6tVH9A8k01U7LbXie6ZIk8Bma4mx1
         NrHW+QyjMsWN7ASe8YXfFurCaVNboq1Pl003hn4lai9FuQsa6UQoUmbJDeZK5QQ+92Ym
         xpPBQHRwSERkMX8SNj1zDZ/zkqFeQmYP17u8Jpm+FmcDDYpsbkNoHYpUyuD5Cs/Kiaia
         M9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q/AF1MAmIheOBk8ihPHO01I0rsAns4DNXYNXx/F6xQE=;
        b=R0kd2vQNyZZQXym6VZ8NcDY0DLpABW5gdShmKegqHlotHxNSJlwY0KxB9vkl/ztFAT
         Q9r8C4/9if3JO33AWxUTZfFIByWDvibv6WIaaIuTXjO73UU3Sytke1PA3rUybh2KqtXb
         tPLA8+mjRafGr+Ltgma7W450YQLG+WeTiYUuYvON8nYrs2zsMTm91TQHQ8Gs7NgUfAAo
         DzehI64kRoSMZSzR9MbyH1F0L6tKkJFNOf0heHrCUXJGxszmosS0xlk7cCx3f6nMMyA9
         HPxuoHQiq08NW0gXxGNYID2Tlo4qlmoU8Q06yaFaxHWDdqC+v/SIslar1Bq65Se9s3AZ
         I7PA==
X-Gm-Message-State: AOAM533o6GqCjyY9J3eSmSXGfxhVoYNGn3Lo5zSo8LaCoUi1qBOLagZT
	nPWlmSo3TneIVifiLfnG1EtfJ7c2Yh15dNFp/jg=
X-Google-Smtp-Source: 
 ABdhPJznVGrydbUUnbO7nC1qjxSDjq5V86yiz8KpYluIn8kUv2e1NPp7pVncz4Me5UVRjfl1hK/8wcdo3Dq9/1J0vb8=
X-Received: by 2002:a17:903:183:b0:149:2b6:65ff with SMTP id
 z3-20020a170903018300b0014902b665ffmr7907005plg.128.1640005704098; Mon, 20
 Dec 2021 05:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
 <3ab3fab5a6355a247b9f539e5db6a5a7187a2909.camel@pengutronix.de>
In-Reply-To: <3ab3fab5a6355a247b9f539e5db6a5a7187a2909.camel@pengutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Dec 2021 14:08:13 +0100
Message-ID: 
 <CA+chaQcxg=XXk1jf7L999MCoh=hZ6+0wFF6gioVjF85vOSexxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] busybox: refresh the defconfig from 1.33.0
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c24da05d3939581"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 13:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159865

--0000000000006c24da05d3939581
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I don't remember the details, but looks like not intended. I guess I was
running with default SRC_URI which contains syslog.cfg and other optional
fragments, can you please refresh it again with all .cfg files removed from
SRC_URI?

Regards,

On Thu, Dec 16, 2021 at 6:26 PM Jan L=C3=BCbbe <jlu@pengutronix.de> wrote:

> Hi Martin,
>
> I just noticed that since this change, syslogd is compiled in by default,
> even I
> have SRC_URI:remove =3D "file://syslog.cfg" in a bbappend. Is this
> intentional?
> Otherwise, I'd prefer change the back to disabled by default (SRC_URI sti=
ll
> contains syslog.cfg by default).
>
> Regards,
> Jan
>
> On Wed, 2021-03-10 at 14:37 +0100, Martin Jansa wrote:
> > -# CONFIG_LOGREAD is not set
> > -# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
> > -# CONFIG_SYSLOGD is not set
> > -# CONFIG_FEATURE_ROTATE_LOGFILE is not set
> > -# CONFIG_FEATURE_REMOTE_LOG is not set
> > -# CONFIG_FEATURE_SYSLOGD_DUP is not set
> > -# CONFIG_FEATURE_SYSLOGD_CFG is not set
> > -CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D0
> > -# CONFIG_FEATURE_IPC_SYSLOG is not set
> > -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D0
> > -# CONFIG_FEATURE_KMSG_SYSLOG is not set
> > +CONFIG_LOGREAD=3Dy
> > +CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
> > +CONFIG_SYSLOGD=3Dy
> > +CONFIG_FEATURE_ROTATE_LOGFILE=3Dy
> > +CONFIG_FEATURE_REMOTE_LOG=3Dy
> > +CONFIG_FEATURE_SYSLOGD_DUP=3Dy
> > +CONFIG_FEATURE_SYSLOGD_CFG=3Dy
> > +# CONFIG_FEATURE_SYSLOGD_PRECISE_TIMESTAMPS is not set
> > +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D256
> > +CONFIG_FEATURE_IPC_SYSLOG=3Dy
> > +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D64
> > +CONFIG_FEATURE_KMSG_SYSLOG=3Dy
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
>

--0000000000006c24da05d3939581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I don&#39;t remember the details, b=
ut looks like not intended. I guess I was running with default SRC_URI whic=
h contains syslog.cfg and other optional fragments, can you please refresh =
it again with all .cfg files removed from SRC_URI?</div><div><br></div><div=
>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 16, 2021 at 6:26 PM Jan L=C3=BCbbe &lt;<a href=
=3D"mailto:jlu@pengutronix.de">jlu@pengutronix.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br>
<br>
I just noticed that since this change, syslogd is compiled in by default, e=
ven I<br>
have SRC_URI:remove =3D &quot;file://syslog.cfg&quot; in a bbappend. Is thi=
s intentional?<br>
Otherwise, I&#39;d prefer change the back to disabled by default (SRC_URI s=
till<br>
contains syslog.cfg by default).<br>
<br>
Regards,<br>
Jan<br>
<br>
On Wed, 2021-03-10 at 14:37 +0100, Martin Jansa wrote:<br>
&gt; -# CONFIG_LOGREAD is not set<br>
&gt; -# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set<br>
&gt; -# CONFIG_SYSLOGD is not set<br>
&gt; -# CONFIG_FEATURE_ROTATE_LOGFILE is not set<br>
&gt; -# CONFIG_FEATURE_REMOTE_LOG is not set<br>
&gt; -# CONFIG_FEATURE_SYSLOGD_DUP is not set<br>
&gt; -# CONFIG_FEATURE_SYSLOGD_CFG is not set<br>
&gt; -CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D0<br>
&gt; -# CONFIG_FEATURE_IPC_SYSLOG is not set<br>
&gt; -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D0<br>
&gt; -# CONFIG_FEATURE_KMSG_SYSLOG is not set<br>
&gt; +CONFIG_LOGREAD=3Dy<br>
&gt; +CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy<br>
&gt; +CONFIG_SYSLOGD=3Dy<br>
&gt; +CONFIG_FEATURE_ROTATE_LOGFILE=3Dy<br>
&gt; +CONFIG_FEATURE_REMOTE_LOG=3Dy<br>
&gt; +CONFIG_FEATURE_SYSLOGD_DUP=3Dy<br>
&gt; +CONFIG_FEATURE_SYSLOGD_CFG=3Dy<br>
&gt; +# CONFIG_FEATURE_SYSLOGD_PRECISE_TIMESTAMPS is not set<br>
&gt; +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D256<br>
&gt; +CONFIG_FEATURE_IPC_SYSLOG=3Dy<br>
&gt; +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D64<br>
&gt; +CONFIG_FEATURE_KMSG_SYSLOG=3Dy<br>
<br>
-- <br>
Pengutronix e.K.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
Steuerwalder Str. 21=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| <a href=3D"http://www.pengutronix.de/" rel=3D=
"noreferrer" target=3D"_blank">http://www.pengutronix.de/</a>=C2=A0 |<br>
31137 Hildesheim, Germany=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | Phone: +49-5121-206917-0=C2=A0 =C2=A0 |<br>
Amtsgericht Hildesheim, HRA 2686=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
Fax:=C2=A0 =C2=A0+49-5121-206917-5555 |<br>
</blockquote></div>

--0000000000006c24da05d3939581--

