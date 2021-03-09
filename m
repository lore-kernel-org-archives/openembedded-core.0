Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.10684.1615303976690356612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 07:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=renzC2g6;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: jatedev@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id a24so6733028plm.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 07:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=5YQ4zN0tm/U6vJffCm8FVVpeeGaCTjcrV3qHsPkEoOU=;
        b=renzC2g6gR9H4HgmsGMbA2hlkSAtFOOzXM1ymwvrcNsAQIJ7BM8txu6L2KM+CeYJbW
         P+xyjpDZhFaknRZ7FsYHEryRWEovmMf5FrC76mk2q946s6859nNYpleTd4HLe67CIF2/
         2UbtoaGKqFcyhrHQwpm/eIcaspvD1OJk//oPlbCZw+D6313Kv5so7iCBohLuPK/GOzw8
         oTz7I8mxA6nUvSn9CS/wUI4TWtqEAxJeQhe0Bj5RgpCh7smZnP0CsvwY0fwOgRhJZkY2
         R6Z7DIFDaE0R0jEdTt4lDX625dqr0UaLkwDy9pLYbXl/jmZMZl5eLQg7/trvtbExKry+
         7s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5YQ4zN0tm/U6vJffCm8FVVpeeGaCTjcrV3qHsPkEoOU=;
        b=UmEGZxvrydcsHjTCSjBvNe1H6k+s9ZkjKj8T2Me/HHUUMoCBEW3CNMXVwoWSFH+/jn
         FRJ9OIIhBogUH2m8vG8nMN/sIffi2l0M0MA6bZGYh2GH1Rvk8fZ7o/Iz5tvKB1Y0uBoF
         qv+8/yKMTIus5X/t5RnE7rT65Q0xprzY6wVPmSQrVTRmZBdM1tJoCYBj3aPAIhWL0IAG
         F2NDLW4Qoiv7Adzz/uqrkQy6Y2Lqm34T/FpF1v9RN6K6wswujbECsp0cjy3lLOJCUMPz
         jtYX0DdN1dDn05h21o+ZhTA/TtMmEM+/ycRT+2vie4+7s3SIyU8v7B4TXrsqnVpAtEjT
         Dljw==
X-Gm-Message-State: AOAM530Nk5+mjsnh3rLX0494L3YaMhfqc6VihCLoVz1EJWsZ0dEY43wH
	Cr2QWK/Lz8+AOX7uOhlt/KRDR3v0VGabXjdKXMk3DvLH
X-Google-Smtp-Source: ABdhPJzhteLH07AzgVOmF7imHhyHqjcg8GugeWtaWiMvfJluTbTxjbIpOeQIXZcirrlIbrvWVP7Zlv1SvDfj3GjfzYc=
X-Received: by 2002:a17:902:9f94:b029:e3:287f:9a3a with SMTP id
 g20-20020a1709029f94b02900e3287f9a3amr25354350plq.46.1615303975883; Tue, 09
 Mar 2021 07:32:55 -0800 (PST)
MIME-Version: 1.0
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Tue, 9 Mar 2021 10:32:45 -0500
Message-ID: <CAPphmgZ0BPaVhcVV+aBP7DN_dA23N6ANT3wYg+oFKuqA6vJj0A@mail.gmail.com>
Subject: eudev and the variable not_first_boot
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000afd9a305bd1c430e"

--000000000000afd9a305bd1c430e
Content-Type: text/plain; charset="UTF-8"

Reviewing the eudev recipe, I found a conditional for the udevadm
trigger/settle code. The variable "not_first_boot" determines whether to
exclude several subsystems during the trigger. Looking at the recipe
history, it appears that this is leftover from the dev cache code.

I cannot find not_first_boot referenced anywhere, so I do not think it's
used any more. Could this be removed?

I am looking for ways to speed udev and I came across this code.

- Jate S.

--000000000000afd9a305bd1c430e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewing the eudev recipe, I found a conditional for=
 the udevadm trigger/settle code. The variable &quot;not_first_boot&quot; d=
etermines whether to exclude several subsystems during the trigger. Looking=
 at the recipe history, it appears that this is leftover from the dev cache=
 code.</div><div><br></div><div>I cannot find not_first_boot referenced any=
where, so I do not think it&#39;s used any more. Could this be removed?</di=
v><div><br></div><div>I am looking for ways to speed udev and I came across=
 this code.<br></div><div><br></div><div>- Jate S.<br></div></div>

--000000000000afd9a305bd1c430e--
