Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.2215.1611877444971243637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 15:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gGcwyCJQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id c20so6948365ilj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 15:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/1FOHPVnEPMWEDpOswsy0PDsDpsWYiVBsC5HZxK0ff0=;
        b=gGcwyCJQ1JZjHhqeG4OApxnvKa4rS4YFILbBix+7mxZJ1OsWUUgSfc34cnyFDoijyt
         WJWdyJl08fWCYN63yxJCF+Uk5FpB+dpW/3ddXf/A3SvZgxgQLSr3vycFo84leImvHyGN
         rw/8V239y7XbIg8gXMWnWo++qtruNpfCovmhOZpycgffAe5R9E6bSweYcVIAidggPP8z
         xelMSB67cV5P2zGEtxW0Y/qCbZ4Mw+RKxTJ8JD9rC+tBFjfBAmSt7TFxt56CIIdiLoGm
         97Ei1xgGWSCww8bkCE6nl6I0Kk2uvvBmKVyVZj1spSwXz/gMOh2tGvy7/SPSElmaqrpd
         0uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1FOHPVnEPMWEDpOswsy0PDsDpsWYiVBsC5HZxK0ff0=;
        b=kyh8RX3bdfx+8GZ04V8EV8T5uemIQXOP0LF0Es4LkwTzVThWegd7qNssgTVoGQx1dQ
         2Yayr0u8NdJ94VqqMypWhe+EVStwbbo9MvW+5R5cH9aZmV5gflFEKnNnVJNj7fT9AC4G
         na8N7/iI2fwKJrtxBqP72CoAfw++x1BfvlQLm3T5hLqOyontyLrZ9+PW5OdfD630O6qT
         RHLpFJYXCIaVJezRYtnkpl7DkluNA+T9Z4KWKnGPdppPQP9LuBHXUfQP6BU3Hvvtv46W
         Ue42OmPNhrsjmh1G5PBlDPAL8HmJKa1+6TiCOIbn2zXRO8lJ306ymckEkoMBZ3SSEVSi
         j24w==
X-Gm-Message-State: AOAM5303M9jpnxlPWjjXBnh7Bc2jDlhxMQUmVRx/B3e1tluqNnVQwGnL
	cJMP4JzLK1GLf+gGq8DtnLtlrzy0elnJYpnD1YA=
X-Google-Smtp-Source: ABdhPJyil37Wkl1UUiN4Af2wBmhUczEwi033ggLZOApIUj2NL+O2usNS34DdWx+T7PLpZfViLq6uYAP+S8kJk5IOThc=
X-Received: by 2002:a05:6e02:1d02:: with SMTP id i2mr1318639ila.30.1611877444408;
 Thu, 28 Jan 2021 15:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com>
 <20210127213311.6030-2-tomasz.dziendzielski@gmail.com> <CAP9ODKow4MBA-WoGMJyxiU-75GXY3-BQyWRqT+dYsJ=+AT7ECQ@mail.gmail.com>
 <f7478654da009d76e9bc6c7a1ba3a99865f775e6.camel@linuxfoundation.org>
In-Reply-To: <f7478654da009d76e9bc6c7a1ba3a99865f775e6.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Fri, 29 Jan 2021 00:46:36 +0100
Message-ID: <CAJkqNs0zRmQKw0eGTRJ7mo3-44BZ2fYLREYwLVHs+8SwCLjkkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] insane: native-last: Print classes inherited after native/nativesdk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007ed8a405b9fe7664"

--0000000000007ed8a405b9fe7664
Content-Type: text/plain; charset="UTF-8"

>> I'd prefer a little of context on the commit log.
>
>Agreed, I've improved the log of the patch I've merged. Linking to a
>bugzilla entry isn't really enough information. I appreciate the
>patches though, there have been some good ones!

Thank you both for your feedback and for improving the commit log. I will
add more descriptive messages even for small changes next time.

Best regards,
Tomasz Dziendzielski

--0000000000007ed8a405b9fe7664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span class=3D"gmail-im">&gt;&gt; I&#39;d=
 prefer a little of context on the commit log.<br>
&gt;<br></span>
&gt;Agreed, I&#39;ve improved the log of the patch I&#39;ve merged. Linking=
 to a<br>
&gt;bugzilla entry isn&#39;t really enough information. I appreciate the<br=
>
&gt;patches though, there have been some good ones!</div><div dir=3D"ltr"><=
br></div><div dir=3D"ltr">Thank you both for your feedback and for improvin=
g the commit log. I will add more descriptive messages even for small chang=
es next time.<div><br></div><div>Best regards,</div><div>Tomasz Dziendziels=
ki<br></div></div></div>

--0000000000007ed8a405b9fe7664--
