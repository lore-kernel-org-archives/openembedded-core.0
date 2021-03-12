Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.903.1615568278754432558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSa6dhe7;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id z190so24897382qka.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 08:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1FWN6i9z24ODCY5YllCv3O3RzJ47S00jAtr6QMq2lY=;
        b=MSa6dhe7ME+KhnS3cglslssj70KYtJfcuvxBjpyWjKbSZj8IXS6pGz4Nphn2CUfN+Y
         ohq46vPm1uTlcBeqxqhDrP9OdZ2s/d1JhPJ4PkkAC4Un9GncRBQfURRdfyUsK8Igbaqf
         XuiVUaszBwiNAd7pAA9q/wYzx8H4vEiFZxo4JtcoEf11B7i9RPCrhCUVDSlC4JQg8/Z6
         oR4Qy6ZpsQAfJ6JGrCYldEYJUcdf2zj3tmeymVQ3wUwFw1vPrh6Djt5bFx9f7hj2WqZb
         wCeRiUIsk3XAUaIzib1qYu9gB1ok6j+fzfBq8/EIn6bZe4rPxUedlWMjMJq/EGU0stAt
         yxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1FWN6i9z24ODCY5YllCv3O3RzJ47S00jAtr6QMq2lY=;
        b=qBs/XUJDDh5IxNZJ9yNOPjElf13/W3DEzJHvbJHw+dm2j/cc/O3VsJrTLorfODuCMq
         0/I11ajUyzqF6fj1jJzOgQ76H4Lnhr3qdpuRVYXdTs23VZWRQhdvrZFHARaBHTOZwG5a
         p2HhPr3T5kUpEgH5I3mzQ2GNwZa73v3wkYw7DDVFMMo096FuWE4IjoM4e7H+UOXIVyOa
         VYDbyzYXCAQe9ckpENGD8yr3fzqSDf1PHeTrlvP5LlmDPqQhkpBA6cGKZu3MfFSGcvbC
         DUxrNr06XgNX/s1XXzHhBrTZuDmd07oUyyQ0Rj4cK24aII/pzvjX0TzCWkRXhNeRyE53
         evmw==
X-Gm-Message-State: AOAM533D1nXRpbqCoe3ZHEmwXVrHViX9bguQs14RDnTbTLwujXdCDoxB
	E5VkHRSuPcVG7YppL2kqssjXIxIvj23HbKPbduE=
X-Google-Smtp-Source: ABdhPJxnr2+Zyt4XooKlNEDRg5+2Z7CnBBxbce4yA0Wb/BBkFaEqHypKap3LUspnaJjnRmT1D2M7+7gNemhaeEJgqlY=
X-Received: by 2002:a37:a350:: with SMTP id m77mr13247053qke.146.1615568277847;
 Fri, 12 Mar 2021 08:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20210311120512.287214-1-alex.kanavin@gmail.com>
 <CAMKF1spZ5tYHOVeyPV7xb+KNkdyh5QUgD=UQP9Yaj8VaRH7wpA@mail.gmail.com> <CANNYZj_UPO8RpmNC=-E_8=Jzw5+e1VFfw==GjthsVPZPDbj=OQ@mail.gmail.com>
In-Reply-To: <CANNYZj_UPO8RpmNC=-E_8=Jzw5+e1VFfw==GjthsVPZPDbj=OQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 12 Mar 2021 08:57:31 -0800
Message-ID: <CAMKF1srfO79nQpfO+rJYD_uZ-H3+0j9kA0KMU2qGf0iWvcLWWQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] xwayland: add a standalone recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Fri, Mar 12, 2021 at 1:30 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
>
> On Fri, 12 Mar 2021 at 00:48, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Mar 11, 2021 at 4:05 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Please see here for the rationale for splitting XWayland out of
>> > main xserver-xorg tree:
>> > https://fedoraproject.org/wiki/Changes/XwaylandStandalone
>> >
>>
>> I think this is a good change. Should we disable xwayland
>> packageconfig in xserver-xorg recipe as well
>> since I see that it gets activated with opengl wayland being in distro features.
>> so I wonder if we can completely turn it off
>
>
> That's done in the second patch, as it has to be atomic with dependency adjustment in weston.
>
> Alex
