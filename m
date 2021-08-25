Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.21468.1629924986811033747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 13:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DLEzN0vq;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id k24so479792vsg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=msvJtqiXXHBjAgHGS0lpVquhJ7KNiJqvcfMWz53GeEo=;
        b=DLEzN0vqcVE6llA62xMZxuRPfWVpGViVivgIp1ikhEa3ymQGMfMdtqv64AwFBn/jMY
         oSevwPuolbO2Tnt8+wdGEOLR+LXMCCIhjWUx9ntRfmPauB5D52CpHa1fcQLO8uQwcfyf
         1nTg/S4cxzbMAxY3iNO7gsylrrrDDuE6eeWB6fWndfgWfgskUFoe1qWbYRf38mouV1C4
         9XA9C/gagE8ZpS/zx6VOLO6vW8R0DZHvKvT1MbxVOAiSYQihf/wS5EWy2qmKGIin5GJJ
         IY2WnWA21ttK9GIu9I1JgBDosQjj8D6VsyGEi83AysGT6iJ7j8cHP7AGtflyF8DA4Fi/
         cZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=msvJtqiXXHBjAgHGS0lpVquhJ7KNiJqvcfMWz53GeEo=;
        b=QFfkJrhfyNIVIznYGs2G77uY21xqfS8bqk+xutx7z9RRX2/9uxPCRp5/HYusip77BJ
         47k2+c9LT3J9oWnL61obJTiw/oNyHnN2G61vYRANyjwnIcMgnXQQyvR8hnGMVsT7J4gE
         49stpIPiCSPpXtTje8V3/cavc4LkgZZH2gsuCOxM6+w7hnkOqsP2EwiRRuPUwVljmHCf
         9hKDa4c9QIGbTGVErsqI7oj6ro1s2e4DL/frbvUr/KtDxUyoDfK69drr9G6cwXtlQohW
         z0u/gNdtgAjqp3jrJU1oOPSJpVKXk0/KnqY8cYp18k51D9KgC9ecLFTBV1ug7w2vSzIa
         Ed2A==
X-Gm-Message-State: AOAM533uvdsiauKyYpecLuL+dcxG4EWBx2lEmookuchWbXBTqGvlvbet
	zeShm/2W10WtEkVDg0+olh7E2pkjF2bgyThxGAZ/bBkp
X-Google-Smtp-Source: ABdhPJyBc5/jXeUj7/VqBgcob1jyJburP+XdZHx+qOWm4AodNXn5KeTX3DFKMYaMSfl077utdE67w1V3W7Jds+SgIWo=
X-Received: by 2002:a67:e243:: with SMTP id w3mr183881vse.41.1629924985962;
 Wed, 25 Aug 2021 13:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
In-Reply-To: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 25 Aug 2021 22:56:14 +0200
Message-ID: <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cc834b05ca687b25"

--000000000000cc834b05ca687b25
Content-Type: text/plain; charset="UTF-8"

If you show the confusing examples, we could try to figure it out.

Alex

On Wed, 25 Aug 2021 at 22:35, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
> there will be many more questions about pkg_postinst (and related)
> routines shortly, but digging into these for the first time, i
> thought that that test checked whether the routine was being run
> at image creation time, or at first-time boot. now i'm not quite
> sure what to think after seeing several examples.
>
> what does the test for null or non-null variable "D" mean in
> a pkg_postinst routine? and once i figure all this out, i may
> very well contribute some enhanced docs for the next confused
> person.
>
> rday
>
>
> 
>
>

--000000000000cc834b05ca687b25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you show the confusing examples, we could try to f=
igure it out.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 Aug 2021 =
at 22:35, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpj=
day@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
there will be many more questions about pkg_postinst (and related)<br>
routines shortly, but digging into these for the first time, i<br>
thought that that test checked whether the routine was being run<br>
at image creation time, or at first-time boot. now i&#39;m not quite<br>
sure what to think after seeing several examples.<br>
<br>
what does the test for null or non-null variable &quot;D&quot; mean in<br>
a pkg_postinst routine? and once i figure all this out, i may<br>
very well contribute some enhanced docs for the next confused<br>
person.<br>
<br>
rday<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000cc834b05ca687b25--
