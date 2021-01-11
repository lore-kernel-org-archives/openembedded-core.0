Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web12.33667.1610368751244305018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 04:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fSnOpJ1V;
 spf=pass (domain: konsulko.com, ip: 209.85.161.44, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f44.google.com with SMTP id o5so4056448oop.12
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MQtNKQIq0fQz38q2v5SRcUgGDBD0ZKAT1cQTtjJuD6Y=;
        b=fSnOpJ1VOEjjvkaEjbPL4Aor+4LYH+vkteBxDc8HpUFhdyx5ab1lHnekFheLkN37AA
         gbMF/FpamqXYVHH4aNJjEIrifVBG2/Gt8jhUd1kYxXw3pR8s8wyZE2iN4xbMVQXzjOVf
         vqZQt3i6fjnuATYK34tayb0vylO9M8TuQtqhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQtNKQIq0fQz38q2v5SRcUgGDBD0ZKAT1cQTtjJuD6Y=;
        b=TEOb03zrHd9NS+ZKov4gbZEp9k6i00OqZMMqcbUPza/VfK+Ep4GEwo+pWzGPIanJya
         O0dgobfHvoBn1vTBA1WE8wtNw4yAQNgLrYRh5s8zprXrdziDD2AOgrCYQ91p4jEdx1kX
         GZ+lwMuTCtM2HkePrM502tc6HwO7KXd3xjcaOdhvgwNn33gB6OPZ1GZQa9xZnnWYZ+DE
         QUK/kzGfNimHAW5tNEpuP7iebj7xuw+APiUj4RkE7oKPl9GTOUF1PthF5I96QUvJZBdt
         OVJFQryPG6KfiUxDzSDqsUuSU5j9sSQUeoZE3ANGJ3M+MBSMktL/GaOmUMGOYLaJB/Pi
         o9JQ==
X-Gm-Message-State: AOAM532bppzdDnJE59jrwAde2j9e4OIvZK2KEsMNKgQG8WJYCRezhwJd
	KROldx8aZ4WeH4MZDwajkhZLFeTYEwv2t1oNWWOCJj83Frmfrg==
X-Google-Smtp-Source: ABdhPJz2w7kU9TiG7F/dO/MUzcd6qkui8uTdJgcqtrTYtfZHWcw+Frc/dLx3lhuZvy1AWBMfRXvjsSATSIarf4z5COE=
X-Received: by 2002:a4a:b244:: with SMTP id i4mr11778596ooo.5.1610368750653;
 Mon, 11 Jan 2021 04:39:10 -0800 (PST)
MIME-Version: 1.0
References: <1609739642-25372-1-git-send-email-mshah@mvista.com> <CA+=qD9MRuL5902aOE+An63_ScRN-je9Q0kecdeMJ_HQsz882gw@mail.gmail.com>
In-Reply-To: <CA+=qD9MRuL5902aOE+An63_ScRN-je9Q0kecdeMJ_HQsz882gw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 11 Jan 2021 12:39:00 +0000
Message-ID: <CAM9ZRVuf68QRocmxq2B4_XVg3aeQ2QF9WCf6osG+h84LYvVCxw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v3] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: Milan Shah <mshah@mvista.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jose.perez.carranza@intel.com, 
	Randy MacLeod <randy.macleod@windriver.com>, stephano.cetola@intel.com, 
	paul.eggleton@linux.intel.com, joshua.g.lock@intel.com, 
	benjamin.esquivel@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 12:19, Milan Shah <mshah@mvista.com> wrote:
>
> Hi All,
>
> This is a gentle reminder to review this patch.

Looks like this is also in master already:
https://git.openembedded.org/openembedded-core/commit/?id=6b4e2eafa6eb71ca94ccc8a18d05b473b352367c

-- 
Paul Barker
Konsulko Group
