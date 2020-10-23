Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.4073.1603491425167096997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 15:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=XaQXtbx8;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.221.54, mailfrom: andrei@gherzan.ro)
Received: by mail-wr1-f54.google.com with SMTP id j7so4256689wrt.9
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version;
        bh=eqqkrKZPfOLDrllidSqLrbx2OhoBJsfvs/CVwSUM2ec=;
        b=XaQXtbx8/MQTxrtVkR0buwb+JHjyqkclcteL8oz1/Ow3OqQQqZ1dulThz0VsIDAgtT
         2oq49VEeBnL1yh2h+LwKjD5LHcb3AmFBcAKYm3ZYT1OhDDWVMR9vALcNwG//VAVfkR6g
         Y+kIsBQ/4YcGnPGhK+n5mHtcx18G17FUnN5FGCN1zRl07SGNR95FQIgfRxnYA+7Qrl3P
         8Ta//vOX2vLaWhhv+46nrzZQjFZnVQpEx6jimO2UmGYLHKZnHB8QNzFSKjPgNQKQzCZ9
         WuqA1NCgSmUuecdF7QkqLTwlSOkTBf+9cTyfcevBKGD/DJ0dJhjkdfKLjvG/05uQ9o0z
         438A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version;
        bh=eqqkrKZPfOLDrllidSqLrbx2OhoBJsfvs/CVwSUM2ec=;
        b=eiY7jgAqF4ySCqQLdEz+KZTS0wnghJG3ObyKGIU7MXl3ha4ZIBugKZ1c9g9jbiY48k
         qYClZ5To0moh+0llSk8DDk1k288fj76ZpL3G32kZlWQjO0VqlKvYaKiRh0juHhoiPOx1
         Mp4thJP4r8KJqi7ETNLVs4nSdt/KgZkWNwkLgS0d37j7YFt6HJJ07FicRa4F6Xg/l8ju
         wDYQTMgmmtx996DySaIgxGJVKq0I2zL9ceLtn8mhqmlApfnIpddo2rrlYvf7lPemocSO
         REL1Vk5gfBuYALbEfdyemvqRW+9+cQMHuFN0gcjwXT+e4NZOjHuQDbRF/shsBch7HxIw
         CzZw==
X-Gm-Message-State: AOAM531O2j5a0q1MrmFa/8PytE/QwjVFwKvQIn9RNptz1VAg5v/o0E6x
	po2UsZAxCj4ftFZ8ERetHDVf7Q==
X-Google-Smtp-Source: ABdhPJwrtbjg7/Zm3Koufd02p0Y3a2EsY7UJljwKNaWUYAXcGM9Cf9EQF8JAfv6fwh+XdrP+VSTuDg==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr4523483wrj.287.1603491423495;
        Fri, 23 Oct 2020 15:17:03 -0700 (PDT)
Return-Path: <andrei@gherzan.ro>
Received: from [127.0.0.1] (host86-130-146-50.range86-130.btcentralplus.com. [86.130.146.50])
        by smtp.gmail.com with ESMTPSA id l5sm5746656wrq.14.2020.10.23.15.17.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2020 15:17:03 -0700 (PDT)
Date: Fri, 23 Oct 2020 22:17:02 +0000 (UTC)
From: "Andrei Gherzan" <andrei@gherzan.ro>
To: Joe Slater <joe.slater@windriver.com>
Cc: "'openembedded-core@lists.openembedded.org'"
 <openembedded-core@lists.openembedded.org>
Message-ID: <458056c7-059c-4801-ad6d-7637e22f9ea7@gherzan.ro>
In-Reply-To: <BY5PR11MB3992E2FBAD8DAF232D5321B5881A0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <BY5PR11MB3992E2FBAD8DAF232D5321B5881A0@BY5PR11MB3992.namprd11.prod.outlook.com>
Subject: Re: [OE-core] git repo vs archive for source
MIME-Version: 1.0
X-Correlation-ID: <458056c7-059c-4801-ad6d-7637e22f9ea7@gherzan.ro>
Content-Type: multipart/alternative; 
	boundary="----=_Part_26_220518113.1603491422098"

------=_Part_26_220518113.1603491422098
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


23 Oct 2020 22:56:28 Joe Slater <joe.slater@windriver.com>:

> When updating versions, like for ruby, say, is it desirable to switch fro=
m using =E2=80=9Creleased=E2=80=9D archives to using the git(hub) repo with=
 the corresponding branch/tag?

I think git is usually the preferred way mainly because it matches code dir=
ectly as opposed to a packaged payload.

The exception that I found is when people are using git to store binaries.
--

Andrei Gherzan


------=_Part_26_220518113.1603491422098
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>=20
 <head></head>=20
 <body>=20
  <br> <span style=3D"font-family:sans-serif">23 Oct 2020 22:56:28 Joe Slat=
er &lt;joe.slater@windriver.com&gt;:</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">&gt; When updating versions, =
like for ruby, say, is it desirable to switch from using =E2=80=9Creleased=
=E2=80=9D archives to using the git(hub) repo with the corresponding branch=
/tag?</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">I think git is usually the pr=
eferred way mainly because it matches code directly as opposed to a package=
d payload.</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">The exception that I found is=
 when people are using git to store binaries. </span>=20
  <br>=20
  <div> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">--</span=
>=20
   <br>=20
   <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Andrei G=
herzan</span>=20
   <br>=20
  </div> =20
 </body>
</html>

------=_Part_26_220518113.1603491422098--
