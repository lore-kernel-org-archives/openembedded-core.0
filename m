Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.4717.1631694780313538465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EIRHH4Cy;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id f6so1977387vsr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8B8nOCqXKKwNcgpL8x+0iWWV9cb5G0I3mq3mR07waY=;
        b=EIRHH4CyF99gKai/4/UwNPrqRyRyo4H6FEE/y0rWPCwMPMjWwLEoAJvfb746egb2fo
         UO10RXD6tESOAYZLJQ1MaXMXpLVFW8BfYpjPalvPBlzjzixNp1Db9FpCkPJXVg+QriEW
         elh+YkcU7HY56rQPbEsCxu9tdQn14fOBz1HxrzYHq4PRi1RQIvVfvIBnJMex6zf2EvuU
         JR6cTc7f6470JA3+IGAM4Szte28FboXoNcQ+9oXSomTXAflvnE3KFuwfCvNVPeZPnDLY
         tS2p37lLjpOSLukgSDYrr17YSN0EJ44lodPkVmKn2pCZ4XnoAIM0EhkQxAlcgL1up61/
         8oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8B8nOCqXKKwNcgpL8x+0iWWV9cb5G0I3mq3mR07waY=;
        b=cpJsXEJ5mz9jOxUkhCMgyNtwzjmSMCsAjc7PhfoejzioXV8EaZjK7XbqsZO+wpK62b
         HzqnEvseiYplsPLSUvchOoT09VcPYmX+IHJG1lyBYxRk3Ajp979WJUNO2gzFYJBZNLlQ
         e6TEBPNzXfdhyWqHEJBFnMi8zixzhxKNkIkQIELwUV2lHA2wNQs2HQNBWddoa3pl1xOh
         9kXXguQPRCOguvkXFr0SHAsUPy78ZJMew1WCLi+5IvyXAXuV1FsNQxMi7Ze4XFVGBaw+
         CRgnbz6c20Il9G9SMpIW2gKBvlzFIVRhddnTeJ/zkxBl1TYfa1pdWBlHPKqPpeBiT+v6
         KpFw==
X-Gm-Message-State: AOAM530DOsScB/URTIz+YffswjliaSmhOADWfbtbAW+Ij6OyoX8e4rzF
	jRAP8Jjq+7pNI1xke7VDW3pey7jqO7UCT2+m96gcJcLq
X-Google-Smtp-Source: ABdhPJwob07EMcoidg0r+/4E67WgL4XttA8DjTVKmlaH0ELwdRP9N0HqIG6owRNw/CCtoIP5Ngw47HvqaYx+yqq0yYQ=
X-Received: by 2002:a67:2dc2:: with SMTP id t185mr2266849vst.1.1631694779417;
 Wed, 15 Sep 2021 01:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
 <d7158686-8c8f-e7e0-70c7-db2d433a1c6a@windriver.com>
In-Reply-To: <d7158686-8c8f-e7e0-70c7-db2d433a1c6a@windriver.com>
From: "JH" <jupiter.hce@gmail.com>
Date: Wed, 15 Sep 2021 18:32:23 +1000
Message-ID: <CAA=hcWRdHaeu0ACq5hSLcy6+KxvAxqrcuTzwSR814kEabKk7nQ@mail.gmail.com>
Subject: Re: [OE-core] OE systemd RemainAfterExit does not work
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

> How about adding 'ExecStart=/bin/true' here?

It was my first try, but it did not work so I removed it.

Thank you Qi.

Kind regards,

- jupiter
