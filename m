Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.4242.1587396290993371486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 08:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F1764kZD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id u16so3270376wmc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LmhF0ufeI3uIu1Cos1z6TYGDReUsr7xLENm7cswfrw0=;
        b=F1764kZDN5hrju1LZz7nmh+zpSD9cXvpqLr2U9WI4NzYj2nYhh+QNZJNhGbilOz+Xo
         kUHr0sMMzLBZBtCA8FtN6o54UzdAc68Vt4sWnZzOuzCAM7wNXdHd1G+bJisJBJg+0Llm
         0OEivRYH1PgqzRSXAfbgtGzzgQ2d3wdb88XOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LmhF0ufeI3uIu1Cos1z6TYGDReUsr7xLENm7cswfrw0=;
        b=UlgZiKw5OhcDXFikRina75yzl1RYisNRJNzHvRJ+ZesktQCd/ir3C4flfcGIZyNWsA
         6u9a57pwF38XWgJr8YvD1A6qjKIixHgSVxVapVZ1lWS4P8ydru+Cz1PDQkJ7uW27K1gn
         TAhqB/j0wK1pDffrtnOtqxW0h336jJgYaEfP+hC79Bc1vBNiBTIr/3DLAV7VlWlF78ZU
         w1v5/hav3K1WKE4DjBMuYen298WU3sBipZ7AaplWcWPb3KCZbbIzKn4efR/4D5ldOOuI
         gSLYLJN6044+SR/LpUa1MDZl9uiYh4ESvoGlRDe7PwJQfc06Srj8BXz3T656vMHkO7qS
         /vew==
X-Gm-Message-State: AGi0Pua35lujxpRO+nYAfwsd+TqM2EVBiXm4+2NPCcHHp2GhvS8Qgc9v
	BStHHda87x7ZRvbM37N9KlZS3g==
X-Google-Smtp-Source: APiQypIZY6Ii3DMUqsgLD4dOCl4iY1jEi2Xj7B8y+J3j/ydVpB8P8NSweHGUJXILbZo2Yf2PNj2qaw==
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr16647323wme.38.1587396288696;
        Mon, 20 Apr 2020 08:24:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j17sm1768748wrb.46.2020.04.20.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:24:48 -0700 (PDT)
Message-ID: <cd6c409640658a4de370ed311fd84ec7f3e3e4da.camel@linuxfoundation.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2020 16:24:46 +0100
In-Reply-To: <DM5PR12MB2471393B012A652B914918A58BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
	<DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
	 <DM5PR12MB2471EFA4F9009E30FF859FC28BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <867b96d7dbaa0d7605aa9328b6fc9f88ec613d22.camel@linuxfoundation.org>
	 <DM5PR12MB2471393B012A652B914918A58BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-20 at 15:15 +0000, chris.laplante@agilent.com wrote:
> > There is a non-hypothetical i386 loader, it already exists.
> > Unfortunately the loader has to be downloaded and extracted in
> > place
> > before anything gets run so it all happens very early. Its done
> > centrally with
> > one uninative, not two or per recipe.
> > 
> > I think you might be able to do something like:
> > 
> > SSTATEPOSTUNPACKFUNCS_remove_pn-mytool = "uninative_changeinterp"
> > 
> > and it may at least stop breaking it...
> 
> What if we taught uninative how to identify whether it is appropriate
> to change the loader for the executable? If not, it could (maybe
> configurably) avoid doing so and/or give a warning.  

These are all options, I'm mainly worried about significantly
complicating an already fragile piece of code. It was implemented as a
proof of concept with a plan to go back and put proper hooks into
bitbake to drive it. It worked well enough that nobody has gone back
and done that work. I worry about performance implications too...

Cheers,

Richard

