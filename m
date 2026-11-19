Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5532.1795051226070599095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 17:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HQEUldXf;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: colinmca242@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5125a04ba7so81012966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 17:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795051224; cv=none;
        d=google.com; s=arc-20260327;
        b=J4LQARzOjdBjHCEXGKNIJE0xGTS8jEaVXxgJQ5YhmKzU8S8xx6sdo2KJ8Eu2jZa3Mb
         ffZhBdKhf67UBdAawTZ/3lmAPSAZBn4KjqpZXnwJRy3q6WexkL0LArBDeWHJ8E2hWjZ9
         O1Td7BsuqbypkMeS3KIVa6KklcHRZcHPSaVuySZd1WOcCYMjBgoVo9OTHsFPWg1XkZmE
         G+Elow8IhMMpdrPIg8T+5x7Td7e8UXUy+/3gMxDc5Z9u1yqnUIVaUcIxNxhns8XmuM13
         FsOoPdgRNxq73kZGsMGx1h0p7xMTy1ZetEsiuBAXpiLHIlBr/l3SZrQWvD+1qUlM6eDc
         +n+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=Qyz6AuczawN5eQPshkGipQnr3BumxG74BnhtAzYh2djYmRraoJ6I/9sxZfbaqr2muh
         jdF7Tuh7IcD631HDOp/gqzsWZhEaUOmCj16ENI76b6uADSbvnCDeE5St/M6M9XX2WIqN
         edtbVszKcYVaol03+76W4QmvpK66iMnY7sglxhtUwbnGeqPdkWmYmw563AutjfIilDtJ
         7AAd+dVAqYZ1AqTXkl9JUOL3eVyAbSDMNi5r9Nffrwoh0AC3a8FyBJ92EHWOC8csmwjN
         0vOkGHXMVUzAIdq8HUdnySys00OHEdkHXOnxFLGuzcyhawuKrppz3JvLoReXanhRJPSY
         NUHw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051224; x=1795656024; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        b=HQEUldXfI/PsowjEnAI7yDPmNFL4X6lmYGbkf8Ez7hO9JOfMTNdxUOvWT2QX5+6GwN
         ISscqOM7UKFPV/upRn0t2pq95+z+rflp0IB5Ihw94aofnsV3cN6XfWorSQ6iv3mShzRV
         7osrtwBgtJeBEH139G0QXnM5aamPJ+yxKln3UCy8gQOwbxfjN7NYH+GRYa4wnDG7GGGD
         JGpWfibQHIKGbSwttkt3xyvh9hD9zu4uYUncOCFazo4eil49aHvJFv5e1stwr5rfZV49
         2ROQawoTirkhrHb9zdh86yTNZ7fq1T9dG+JT2rjhGZsdJYXXkXbaSNQA+O+SMOD7u5iU
         94kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051224; x=1795656024;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        b=A57GURzJ9WUpJMPSORHwDSHTuqg0JKLRuse/3M4mBbteZ/bw5l5PJBzKP2XYgNk9Lq
         sCTqm6nYJB2y0nP6vVhrofEpcEfAK8rP10Qfw/8aQPjNx+tzeOZld9iMui/QzxCnLSAu
         hqzTw6KEvHq3dW7CL01maQvu9oEmscjlEl4n7xEgS6frCRsX5kdin5voqX4RBkylMICm
         iPExjoNWKa54/7MghbqTFoNrzYuY4v3J9rX8YluScFg7DyE5gCjk6gTSVwiaojD9UPkb
         BJYm3iomjjBF5REfwWUIf5ttkfi3+MNq1GzbXA3vQ+s8Am42c4MyMmApMnrWIi37c5t1
         wS4A==
X-Gm-Message-State: APuU4Z+DdHR1ODz7C35Kw5Sgyae73TPb9lkJbQb5gVcYYI84lu8hncoe
	Rbo1hGjJb0kREvpGIp89sqEDVFxqQyrB4AtUB75tSenu8XKaaw9R8ZOwo2N7Dpuc2g4BJ4otNgH
	orD4//0Ae2ijkolG0JKpcrLifrtJrwbCZ8NHC
X-Gm-Gg: AYBFou3PCf7aBVsTL5AT+ORZDLTMpwp9e0igQRnwEIUrSB35khJUhCuiUz5oJrQYjoe
	KdG7xqOYJ03L3IGg4BzChyODVelUsu/jqjCSmX0at2e9XXToFbElgJLe9LcY+gD+z9lhDNa7DxJ
	Jx+/bORwXnljvCwjc2sceHp4e1PFv9wZrN28GVhdRIP3+b2UkHTWStcvzMxTSe1OVEmrNKwZxjR
	DBUzFgvq1XH8QO3PlVcupGtuz2MdrIUMHI/NfYrQ4lfBPZYxNLNk97N3PH6RQmePAWkEutLO6Xk
	xgXKl7Y7mj10RGOZYTyWtwnMcb97Fl6nuJn7dGpvd4OfNfTVHUupQaez9H5rON7G3bzVtyqK+9a
	3QvaHW1f/SEDdSX4QKp+XcPesFUiqk20K4atbyyodzdr4TMyj14niroRQ2RS46U2sDiIRkg==
X-Received: by 2002:a05:6402:849:b0:6b8:9d20:1365 with SMTP id
 4fb4d7f45d1cf-6b89d201d1fmr3145917a12.19.1795051223785; Wed, 18 Nov 2026
 17:20:23 -0800 (PST)
MIME-Version: 1.0
From: Colin <colinmca242@gmail.com>
Date: Wed, 18 Nov 2026 19:20:12 -0600
X-Gm-Features: AclHuK95FrZy7siceL0YbZYgFr2TCwzHx8sDJKPtDWZXB22FmemDtlQlUOslZOw
Message-ID: <CAAyLwgTfO1B6_deRXFzeZun435Gq_rnGCjf6Qk4fCuxbKLOKpg@mail.gmail.com>
Subject: OpenEmbedded Workshop 2027
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 01:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250605

Hello everyone,

Mark your calendars: the annual OpenEmbedded Workshop will take place
on February 1, 2027, in Brussels the day after FOSDEM. We=E2=80=99ll be at
Silversquare Bailli (Avenue Louise 231), the same venue as last year.

## Call for Proposals

The CFP is open. If you have something to share, please submit a proposal a=
t:
https://pretalx.com/openembedded-workshop-2027/cfp

## Tickets

Tickets are now on sale at:
https://pretix.eu/OpenEmbedded/OEW27/

Early-bird tickets are 75 EUR until December 31, 2026 (or until the
first ten are sold), then 100 EUR for regular admission. There is also
a business ticket if your employer is covering the cost.

## Sponsorship

We=E2=80=99re still looking for sponsors for lunch and for the after-event
social hour. We also have a supporter sponsorship tier, which includes
a ticket and recognition for being a sponsor. If you or your employer
would like to get involved, contact board@openembedded.org or me
directly for details.

Hope to see you there!
Colin
