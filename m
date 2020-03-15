Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2A863601E6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 11:48:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id r7so11200723wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2HQAfTOlaMnb7znSIu8j2If8m8azCR1fzLss+NoURZQ=;
	b=DI329cJJfyHX6++4/J3XMW6qeAXFKuczcrLcOVMyh/7wsKE9JbJO2fzZx+99hOk2LT
	BWeazel0M7TvUtNTSvVmK3eU57cjd+raJajQWftz68qe92cFVvkbA8NZUsHbibp0sUtp
	9NE3gSc0m8kKuC04DKrjcD+EhjFeOfOWqjwsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2HQAfTOlaMnb7znSIu8j2If8m8azCR1fzLss+NoURZQ=;
	b=JyXHoeYOfhA5xRZYFLfLOLsuFNxyKCNHUg5I+UcPfi2h+SYoO2JvoAA4agFq13FCCC
	R/8C+IXSoQqAyxI6XIpf14zHfK1xkt2kFoQAnFy0V2V9sKGrs+mWExVzq5Rx/3Ge6329
	lQOF9TLXwv8tjw9licp7ARNg/JbnC3E955z2z0XkjMgvsxFMo9Kt0KugI//qJOILRa94
	maORnoAPl46h79p2EpODI51D9pEVLw/lKFVS5Y3M/V62SD7mC6lUeTKTeLkqpXBAL4e/
	zcUhdpewnjQ/9GDW19bxLHUEsKl1xK98Ir633zZeAzl4Wc3ga9angiAbgJIa0yqD0Fzs
	vnHA==
X-Gm-Message-State: ANhLgQ0t2mnuixTonnRVUBEMcrISk8+JUjP5/XAFzMhL+WTg9EOr+YTJ
	FmtVJNi2bzkUtLdYSJB8zPH/EG86ofI=
X-Google-Smtp-Source: ADFU+vu8AyCY9Xg+F7ieZeeYBQek6eWoyKsz+nyzW0IaHMayR00tkNlxwndXQLDuMrOQn1Fl4OhO2Q==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr21404145wmc.84.1584272929653; 
	Sun, 15 Mar 2020 04:48:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p15sm7754397wro.68.2020.03.15.04.48.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 04:48:48 -0700 (PDT)
Message-ID: <f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 11:48:47 +0000
In-Reply-To: <20200315061311.19344-1-alhe@linux.microsoft.com>
References: <20200315061311.19344-1-alhe@linux.microsoft.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] Windows: Enable Windows builds under WSLv2 and warn accordingly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2020 11:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-14 at 23:13 -0700, Alejandro Hernandez Samaniego wrote:
> Due to the architectural changes between Windows Subsystem for Linux
> v2, and WSL v1 it should now be possible to run bitbake on the
> several distros offered through the Microsoft Store.
> 
> WSLv2 is available on Windows 10 build number > 18917
> 
> The current build number may be checked by opening a cmd prompt on
> Windows and running:
> 
> C:\Users\myuser>ver
> 
> Microsoft Windows [Version 10.0.19041.113]

Thanks, this is useful information. How much of our system works on
WSL2? runqemu? testimage? eSDK? virtgl? Is anything known not to work?
This email implies everything works?

My big worry here is that we have a set subset of bugs which only occur
on WSL2. We're struggling with the bug reports we have today, adding in
a whole new set with no help to support that is a concern.

Is this for 3.1 LTS? Are Microsoft going to be able to help us in any
way? How "official" is this change?

> 
>          if "Microsoft" in l:
> -            return "OpenEmbedded doesn't work under WSL at this time, sorry"
> +            return "OpenEmbedded doesn't work under WSLv1, please upgrade to WSLv2 if you want to run builds on Windows"
> +        elif "microsoft" in l:
> +            bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
>      return None
>  
>  # Tar version 1.24 and onwards handle overwriting symlinks correctly

Is Microsoft vs microsoft the best check we can have? Should we be
checking the version specifically?

Cheers,

Richard


