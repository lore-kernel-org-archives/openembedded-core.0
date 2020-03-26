Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.2613.1585247556896225731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=r3pxryg4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id h14so7891954qke.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=Byj/2rAN9CeLS3GXkFOjJMufbHT+9h7t3r+6fWQ6kWk=;
        b=r3pxryg4EkQCkY5wS0BKr4WFLLB7X3xhMiwJW69n26ByfUIalCr7c2MNRqvl6aGTTn
         e5deHDuc3ejvIlDSKn2HK9/ul35DfHoDGVqSWus6bwD1trRc6bBxhOw2dHCIAy5yPHEg
         5k3xFL7xCiHiMonXMhwqRR1aeqQ8ylqPMq6oHyFk5D0/ccJdKHHLaHxs7BZPG71xqbyL
         IVZd3wzjyNWGWJ5+SGRecoCHSTyAm9oyGilKVtq7AK6fMFQXAoKaQK+bLr8FLQZBEfia
         hH61b9bLg4Ai20Dawgy+K6YPo2jYnVLacNsAJ3JB3860dtymVriMqz2pm33v5sefp7s7
         JpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=Byj/2rAN9CeLS3GXkFOjJMufbHT+9h7t3r+6fWQ6kWk=;
        b=jyTNQXb2IJVrEQ6p709RZDC+0L3saUgb4AsYtfR289tPDMDlv988CVnxGZKPaYzIQV
         jWakdT/G7pNvKWvbLIgejpv4w5+DJ+mK8UibWcBJlxHDet7QlPw8Pyhr43DmNQHukKjj
         fkd+E3/UbOaWUVn9eTxJRzTExUWPM1fmbFFgzLsrngJ3rjcxjcjQMaalKUztGMqXXruP
         IZD5/eFg4Kpgy2KbDfaiCxIfTGHU01Jbn/m2ujk3/QP0ln07TdFA92JiQN8VcQuoqlnA
         9CENWUUWBY9SrODvnCA1cmZfxEwf1c3j6FMv4AloDIcIfni+yAILGLY3K7oDtbX0tl6R
         VIeg==
X-Gm-Message-State: ANhLgQ2/ogyy0cpSbTJT4+ckkaYGH3FaCMreG9UzBSH9fBQARgACZWZs
	4i6JU0yY6diazZxBpu38ZlmsuR7EJWloSw==
X-Google-Smtp-Source: ADFU+vu2k7pE+57Oy9+hmQELYePZpO1nyqRGmV5dnAOcR6/YBXGDQH3VXgIP6gh91VfDaZmNcMkiOA==
X-Received: by 2002:a37:606:: with SMTP id 6mr99586qkg.194.1585247555667;
        Thu, 26 Mar 2020 11:32:35 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id l188sm1891879qkc.106.2020.03.26.11.32.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 11:32:34 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f181.google.com with SMTP id z12so6324308qtq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:32:34 -0700 (PDT)
X-Received: by 2002:ac8:6edc:: with SMTP id f28mr7414889qtv.271.1585247554360;
 Thu, 26 Mar 2020 11:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com> <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
 <20200326173258.GA31846@localhost> <CAJ86T=UWhfdQ9-F8QfbbHHW9r8BYGUgQhWjj_1Q6J4m1g482tg@mail.gmail.com>
In-Reply-To: <CAJ86T=UWhfdQ9-F8QfbbHHW9r8BYGUgQhWjj_1Q6J4m1g482tg@mail.gmail.com>
Date: Thu, 26 Mar 2020 15:32:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqAc3sqEZDFfS7J1NXuBrNCu4YSBVXt6_8Ve+Mrzbo41Q@mail.gmail.com>
Message-ID: <CAP9ODKqAc3sqEZDFfS7J1NXuBrNCu4YSBVXt6_8Ve+Mrzbo41Q@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, Alex Kiernan <alex.kiernan@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 3:17 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 10:33 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> > > On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
...
> > For packages that can provide both, if the init script gets installed
> > it is ignored by systemd when there is also a systemd unit.
>
> True but we don't usually reply on that. If sysvinit is not present in
> DISTRO_FEATURES and the package includes a systemd service file then
> any init scripts will be forcefully removed (see
> rm_sysvinit_initddir() in systemd.bbclass).

Agreed. The preferred one is defined by the init system and virtual runtime.

The patch seems ok for me. Besides, you can override it on your custom
distro if you have a weird requirement.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
