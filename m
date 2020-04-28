Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.3591.1588063666104140973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 01:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNwwWQ1U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id x4so1792989wmj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ME/TDm3ZDRXcIEtjuO6k5EGsk1lbBsJiTR+hggwKe3Q=;
        b=UNwwWQ1UU6CEzbwUBeD5lSI7mIDS4vY4L+XUj/E4dz//TxeKSu0ggEs0U233tcVyob
         QsH+4eM0ztDbCSphLYtgSxG8L0auEdtDSLQN3HjEV/YYDlDQzxUynzDZYk9NOMYS6NFB
         sd4pUN3i5Yfd6bOoyR84CkPml7R88Pw3Vnfgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ME/TDm3ZDRXcIEtjuO6k5EGsk1lbBsJiTR+hggwKe3Q=;
        b=rZtAne7lGisjg6jK/hnXS+lxAju3Ni8qggVotBhBAzqU46JEP15DcfzEiSteH5p/ly
         hZXlfdY/UcY4r3vQfDrqBl9etTOV4h9yYxi6HFx6aFAqMxTIvyTGFiwha+UQSIOSUps6
         9fdKKM1LyC0aSpABrfG6a1Wl9R6OdTFtm+g5R6XL5vnAYkQEKPKWI74FHuP5diPFqg6R
         6OtVemA76cAOBDBtPfFQ7wDH8AcLmcwkKw/TBcpf1T8wx5DQVl1HB1s4tOiVXDKFRJsz
         nkHk/dDsbYydt2+TQ5tC8VL9zzqmF6eBhMOLOdEfsN5OcM+qzjDqmq71YIKdfhRg2hp6
         +kow==
X-Gm-Message-State: AGi0Pua7teJ02ICmkYpOl9/z142MAABFb13SdkJyLr9FvPG+Qvcqx+GO
	ULOggfEr+8tUuoM4xrJNl+pQEQ==
X-Google-Smtp-Source: APiQypK4NDI7XxQZ4A5hhJ+R5+LLTIyOPlityxrE9pY/cxfFCJttBpR3c9oT/WsTWjmlHTP91PyLNg==
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr3594311wme.177.1588063664140;
        Tue, 28 Apr 2020 01:47:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s6sm2356630wmh.17.2020.04.28.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 01:47:43 -0700 (PDT)
Message-ID: <376f53f97f8eed5797ddb21d52fe8e0b5b9fc87f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: =?UTF-8?Q?Bart=C5=82omiej?= Burdukiewicz
	 <bartlomiej.burdukiewicz@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Date: Tue, 28 Apr 2020 09:47:42 +0100
In-Reply-To: <2255490.NgBsaNRSFp@navi>
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
	 <28192.1587843536617759309@lists.openembedded.org>
	 <e5e73ac7edc8c2695ca5dd0d31e9d800480a4e8c.camel@intel.com>
	 <2255490.NgBsaNRSFp@navi>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-04-28 at 01:09 +0200, Bartłomiej Burdukiewicz wrote:
> Other media player don't have strong requirements for GLX.
> 
> I'm now totally unsure. Probably adding PACKAGECONFIG with glx flag
> (disabled 
> by default) will be better approach with conditional virtual/mesa
> dependency. 
> This will fix recursive dependency problem for common cases. There is
> also ton 
> of articles that GLX is deprecated, so softly going away should be a
> proper 
> way.
> 
> Or just those bbappends should stay where they are. Another thing is
> that 
> meta-intel layer introduced libva-intel package which also need
> separate 
> bbappend to remove virtual/mesa, this made me to post that patch in
> first 
> place.

Turning it into a PACKAGECONFIG is definitely a good idea and I'm happy
to have a patch to do that. What the defaults should be I'm less sure
about, initially leaving as it is today, maybe discuss changing the
default in a follow up second patch?

Cheers,

Richard

