Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.5768.1608073349422767989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 15:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aMXrAw5F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t30so3376710wrb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 15:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h/N+E7vk36/oBbhd0sYc0zaxg7NI3EMgpPhgoetZfUA=;
        b=aMXrAw5F85BXJd+FwcJtDwItHmed/oeJZFLZpXUspWzixy8XjAvqaxV67u6lieETQy
         bPSA6vSxyellhalTHS4J0Q8yeeoh4BQsMQOxF273kuHgw28YwBKRnQJVjiwrWr82utui
         MDV9RylPkuam82ZjQ4idC4mR+dxDdVLQhIPsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h/N+E7vk36/oBbhd0sYc0zaxg7NI3EMgpPhgoetZfUA=;
        b=p4lS/2DtoX5rpyCs5Z6Iu/UAsA1xj2oANkXQ6Dzndw3JKuomrJhS2E3DLuvDP8UZZ3
         j1T/FkveFrpz761ve6/wcu9lyRjlqvU7kWLXvZPOomMBtkDv+aB6bhTR2uWkPmID/LSf
         t74zT6iO/T0Vh1GCkU3+b9omz9iawn/qNOTDyIBHNTjaABoJAoGjbLozIyhndlpbW1hD
         uM8EeoK4enSs2VCzZxrnttVBzO9mdJ3SRNbqIFrkLTxr98fcM5McppCT1OE/SvbgBZhn
         gBGeEs5Nq/qHofYN9HX0mc0KBBzfBQuBeAMcTHmEH8EnRF2aPsaU5DeF4TWQl4uh0EyH
         Hi2Q==
X-Gm-Message-State: AOAM53324vLHXx6Nhy6l1PJtb/scohMug3D4iS+pa2/ZwdlAamqqW1K4
	BMaXoy1UgbBz1j+hfUgBC6j7Cg==
X-Google-Smtp-Source: ABdhPJx7ln73d7EX6yvCttnqwiZbpYBVSWSexVLWeSVpkAF6nxBNdfz5RiqJuB+hjW/Lq63f2obRJw==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr33851692wrn.296.1608073347842;
        Tue, 15 Dec 2020 15:02:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id l11sm108362wrt.23.2020.12.15.15.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 15:02:27 -0800 (PST)
Message-ID: <4f88fbfa2d42b363ea92e7ce6b396f9075ea85f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 8/8] gstreamer1.0-plugins-bad: remove meson option for plugins with dependencies always present
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2020 23:02:26 +0000
In-Reply-To: <CANPvuRkBwC0SborxcEtzRmYOFVT8w1iiZw+S4RfM=U8LhAWZjw@mail.gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
	 <164EC9D39D4D4B41.7121@lists.openembedded.org>
	 <CANPvuRkBwC0SborxcEtzRmYOFVT8w1iiZw+S4RfM=U8LhAWZjw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jose,

On Fri, 2020-12-11 at 21:13 +0000, Jose Quaresma wrote:
> I have think about this patch and probably is better to drop it.
> It is now on master-next
> 
> Without this we have meson options for all the gstreamer plugins that
> have external dependencies.
> 
> Probably its better to have it explicity enabled than don't have this
> options at all and falback to meson auto discovery dependencies.

FWIW, I agree. I put things in master-next to run through the
autobuilder in parallel with other review so just because something
makes it there, it doesn't mean its definitely going to be merged. I've
dropped this one, thanks for highlighting!

Cheers,

Richard

