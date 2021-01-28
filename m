Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web08.10898.1611851571240489447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 08:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agWox6QF;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id h11so6154031ioh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 08:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bflaWMZkR1DGLI4fakRdzSqeOMzRRIHfydhvr5EQ1Q8=;
        b=agWox6QFfJmTuLJDBcUzbJItEuNjFczhaVvoysMV4vAgoRG+Qtch1P8lEhoyMhtWzJ
         xB5U7NDU3AnvrdFOs3zgrnZ9eTVEzIpyDRCnVPclrjXmPX6xiqJNhyaI5Nb9eXKV2qNd
         IHI5bWotsthX75GhBXR99llhgZRqE8ab81DHNhBkCaGYTfhml+r6lcA3M4KyEGRkLd3j
         1N/k0BsyDwQoz5awZxSpSZIUWreEj4lKa7CNDo6TlhCAxDV9bC2EcoDKOr2ZYF/SsgMI
         4qooU0tLuAQArwcVG2rc4hs8zWk4EawczpzV6TnZFCxHhr7tdNwLl8X9bbml/ctzZuhV
         +HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bflaWMZkR1DGLI4fakRdzSqeOMzRRIHfydhvr5EQ1Q8=;
        b=mjpLYmX+9I17dbmjHbx5xSv0NADx/CsdJ7SNerQY2VkWv8G48bUAk8aeO3qg6j9TGI
         vH0EhRQ0O8kWZkCiWN/o8W0Ex+2IQgIVWgZLBo6Ds7B2hzieffdwnQwN+BQg3+9MMEtV
         r1FdiUJsBqc9GgYrKYXLHpBlXOzsqWa0mEtgjLasfO7voe3mkQp1lJqCq1Yfu5Ozlvwu
         lCxSjsaACCIniaAvbu5zmYIseUqfRoYoeRM5vvV3/ZDpTvfFipGAgzfsW1ecPyq31sQ1
         EaVIOaDpub8+IYDNeVHrpmuFo3AyohZYHVnvcFNsuXW+g7OCrDCT2rLrwXfAnyVIcIA7
         3Clw==
X-Gm-Message-State: AOAM5300IIroXog9XVveTROsW+OM6AWGpv0sQvLk2X/GN6WoowG9wrpt
	PEcnObtcqUjGITkI7AKKTx8zFXkDIzAXb4d1aSg=
X-Google-Smtp-Source: ABdhPJzxWbHnBR6f1sYthHMNwCOvj0Ha53f8NalHZh9YmufD1QFOi4EmLfs+HVGhQJ526j2CbzlGG09gqI4Vm7JR12M=
X-Received: by 2002:a02:5dc8:: with SMTP id w191mr97083jaa.23.1611851570676;
 Thu, 28 Jan 2021 08:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20210128155534.7104-1-tomasz.dziendzielski@gmail.com> <224352e6-e15e-cace-6f8d-7a5bda5757b3@gmail.com>
In-Reply-To: <224352e6-e15e-cace-6f8d-7a5bda5757b3@gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 28 Jan 2021 17:34:05 +0100
Message-ID: <CAJkqNs06aA8wGYb67Kn_8mgHDDM5CV3d+VZ=DyPQhONNu-Rk9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004d06c205b9f870bc"

--0000000000004d06c205b9f870bc
Content-Type: text/plain; charset="UTF-8"

>Hmm, this might be problematic, since "bitbake -e mc:foo" needs to keep
working to dump the base environment for the "foo" multiconfig, and I think
this patch will break that (although I didn't test it to verify)

You're right. I just checked and with this patch "bitbake -e mc:foo"
returns "ERROR: Nothing PROVIDES 'mc:foo'". I will try to find a solution
to keep it working for the environment dump.

Best regards,
Tomasz Dziendzielski

--0000000000004d06c205b9f870bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>&gt;Hmm, this might be problematic, =
since &quot;bitbake -e mc:foo&quot; needs
      to keep working to dump the base environment for the &quot;foo&quot;
      multiconfig, and I think this patch will break that (although I
      didn&#39;t test it to verify)</div><div><br></div><div>You&#39;re rig=
ht. I just checked and with this patch &quot;bitbake -e mc:foo&quot; return=
s &quot;ERROR: Nothing PROVIDES &#39;mc:foo&#39;&quot;. I will try to find =
a solution to keep it working for the environment dump.</div><div><br></div=
><div>Best regards,</div><div>Tomasz Dziendzielski<br></div></div></div>

--0000000000004d06c205b9f870bc--
