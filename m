Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.7721.1585657692167616087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 05:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VP1cmLFo;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id o127so21478895iof.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnEsckaxjTSIJG/eKxIycuFk51c4Aw1++rz/jz7NeRs=;
        b=VP1cmLFo/6MF9STVQCdSQ+B77Bn/sEdEgSKeC9wy/LvhfeqKtp8xee2u93KVrzJDkO
         u+kmQiyacwk8JeNRYFQ5NL+3SvT8WjgI1H59ZeifSUSFcMWw7441FaKf6UBim7Ra+9Ga
         VzDadEnxrBtp5EgXZ0s6v7NVMCu8yRGnazwV33OvIojdjI2veXpM3jbs020usKWvfGOy
         vM69s6ykZoJ1oV/lF/1GeZzrRjALz+eRSZv1TJWIMa8lMpx1LOt1tOmKpetrC4lxu6Zq
         VU+nCnFK5rtpU+f2164T6+qtvGWJTV7t5kh07YQAP0OWP4YdaS4lDYyyK5Du0XlrOG4F
         +//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnEsckaxjTSIJG/eKxIycuFk51c4Aw1++rz/jz7NeRs=;
        b=scZq7atpVUGB0VgDxdtllnRCQo5m96WXJaR0VECX1hSSB+Yd9GAelhFapM+8Q9H9QJ
         QDaAyrFlhCNYc4P+GZZQ5V5wB0zV6RMrNlQyiHT0GoNuypCEyoqP7qKxvaR9r1OP++VW
         9Iui0tznxo/RpbYp62VXtxcgvhGEoluIhnaYAa6hGuRXFM+8UwJ1j2NEzXB0HInhutHl
         KxaHDfq7q821doxjk801qfo1Tbwsw7eytBECXaKPg+CEkf7d7gGLDD58hkhXmbSiEqA2
         9pL8jOEGuHoCBUskjnl7XgxljeTlV5Ya0p+fePYNdYzZu2NmXpNylAUroFnLafR3T+5F
         3xhw==
X-Gm-Message-State: ANhLgQ3r/kn0VX+aGO5T9fzKNxMRAHjc0HlENiaK5E/LMSX390Wo3wz4
	7eMVds8BHX0Rk+DfqSiFOdCCejI0X/nc+9VAyqM=
X-Google-Smtp-Source: ADFU+vucwSbBfrMnKefxQShX+mJapB3XG6q5VYkXJHH13Orlcf24RLbZdFVlOg1BmbXCz4CD/QhHdiQul7kkTKD4Yfw=
X-Received: by 2002:a6b:f002:: with SMTP id w2mr15248129ioc.48.1585657691585;
 Tue, 31 Mar 2020 05:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200327172520.62888-1-alex.kiernan@gmail.com>
 <20200327172520.62888-7-alex.kiernan@gmail.com> <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
In-Reply-To: <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 31 Mar 2020 13:28:00 +0100
Message-ID: <CAO5Uq5QO7RVK3YkEUzAn9bLsy-NBjeFandvTNQZN=P+6sQe18w@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>, Adrian Bunk <bunk@stusta.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Otavio

On Sat, Mar 28, 2020 at 5:17 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Alex,
>
> On Fri, Mar 27, 2020 at 2:25 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Add sysvinit PACKAGECONFIG which disables all sysvinit handling in
> > systemd if it isn't present.
> >
> > Consolidate sysvinit handling so that when it's disabled we exclude all
> > sysvinit features.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> This address the comments from Adrian and I'd like to mention that
> /run/lock is not being created if sysvinit is removed from
> PACKAGECONFIG.
>
> This patch is good to go as is, if possible Alex, take a look at the
> /run/lock creation issue without sysvinit support.
>

Just got around to looking at this and I'm confused... you should have
/usr/lib/tmpfiles.d/legacy.conf (which systemd delivers) which
supplies that at runtime?

-- 
Alex Kiernan
