Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.23994.1597585634212935946
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 06:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N6rF1sSq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id y3so12367707wrl.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BwO28oQCWvEXCAwKF8uZowxIcW13K3F77K9UG5LSFxs=;
        b=N6rF1sSqym+auh1gue2dt6o107j18haYcswm9XdgougueqJwiwDVezT7n6nO/nerWH
         +3fmZuvnv/uHvbbq3JJ7iOVYFOGQGU2vdr7IVMKVLDrb2j8rgM7CBD/efP9n2N0OrpLC
         sCAWfeHGG3x0MZKI/fsjafSYLGwDXwaPsj8pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BwO28oQCWvEXCAwKF8uZowxIcW13K3F77K9UG5LSFxs=;
        b=Dx/HV3YgEL4j9tj0q9bIl99gIVTl4d+oOpYv+AAuTblzsx7r5JsoJm1MB+xiliYAix
         1zztmfgNI9vbxUMy/aQ5BSzaAicMlY5WYlut/Rd9NhNOeShILrdVb6b/eSWLNtfSwsBe
         kldlDA1NmSkCFJeP9mPGWQrEORW0mvup9K5qZQNeWBdvuMOvd5LZPNvrsCMyLvxrYNZO
         +75ScFzz/egc6ZUqlY8fOE2f2E9exrdEliIvWm3gCzWc0NdHnvSww7OqEYsF37hSak8B
         U0ErzJAeR1MY8WSsHd/m1XVc2hBiuOsBG6zeQdPkvHAt64eM2isnVH1W/E+D1YhroH1s
         uUyA==
X-Gm-Message-State: AOAM533loWYS0zexCMTVUOE6Qn+XZbxWEl1b2WNlqL3b7uwEFeqqpb93
	QRvIsBzZ8tIpaJQWG/Uho2WdLQ==
X-Google-Smtp-Source: ABdhPJw5vFHxvVnvewZjzF6LKCSIj9yxt1AaZDIeXIcSwi+SXU+gyJT6r/d8SiFQnF7soBgDMyxhtw==
X-Received: by 2002:a5d:6cd0:: with SMTP id c16mr10950495wrc.121.1597585632500;
        Sun, 16 Aug 2020 06:47:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id b123sm26591930wme.20.2020.08.16.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 06:47:11 -0700 (PDT)
Message-ID: <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Aug 2020 14:47:08 +0100
In-Reply-To: <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
	 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
	 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
	 <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
	 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
	 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
	 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
	 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> Bruce,
> 
> We need 
> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> backported to 5.4 kernels for perf to build with -fno-common can you
> queue this in your kernel updates as soon as you can ?

I think we have other active kernels which will also need it as even
with Khem's patch we still see failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1267

Cheers,

Richard

