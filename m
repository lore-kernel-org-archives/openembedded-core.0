Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.11878.1608647819376326138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ic6rzwA5;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id p14so11995115qke.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k7c9DNxlJkdEGlzGMbswvSS5h9L7EpzZf3d+3cqIJ10=;
        b=Ic6rzwA5jAJlWzMvPPbBTV3G6FT/B+ZDjweWiDrFwFUEQrni/XARq3XlV6DdMs+tSW
         V56N9Gw7HJrt1lueK1UmTQmMHUcwjy/qypzc7Lim2W2sZf89jKOPRTjCVRuPAkT3VvbZ
         E0SB8srdXOXwm6xi/PX9nPHGrE+8OJWjpE5G6zpLr9uYa9HQtIQsJLjacK7O2FXWPIat
         tqElEMd8lcqEENA7iJtYp5LOZdFdffgfc7894m0tkbV15rB2H+woe63FK+2MncP1t1h0
         dI9WzlVXRvCOWsmzRaTQe3ipH/pjVDPdIWPgn1dBiV525cmAG1KaC7RSLeIn1ePR2zYW
         UvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k7c9DNxlJkdEGlzGMbswvSS5h9L7EpzZf3d+3cqIJ10=;
        b=YpdTu6H0Wki+u5xfRNUYTGoC570z/Bvk3PxL0eK5rDuYfBlEcmuolLVnIrESLh9vGU
         /lFlS2SB63ksLyK/S9OHU0ct0DIg5iWqNEhi3DonmRQbW4KIVdxlSo8lnTnwmUbZ1i7m
         RgpcAI/sdxmXccyOWeHTfXFjAMClmjdcJ3YqCCBi8auf5M6cYTkO6DX8FEsBZMSdS5Yk
         BJ+UtigB2l/CIA0jb41AJnlMcKfIUFjNvy6RvIWI1d1MmNKL2TgD/n/ftkBeiqsKR36W
         K4erpOwYPjEvOabdNzzhs1dXNY1u8JhqWgXv7aVkxDFeZ12FR8kAEryNJcrzIwKX9DuN
         iRZA==
X-Gm-Message-State: AOAM532CIwi7bLqKIjNw5Svh1jnPK8dysTaopVIfF5hc0P5eclClYwOR
	lDrruw/JB/7frnvHMZm72Ro=
X-Google-Smtp-Source: ABdhPJwbOdMLqyg09n2nVR2JuIzJCHgtMNUZU//60CI3Jt+rw7jAkP/Kfggz+1uJGd0jyHbyJtqbBg==
X-Received: by 2002:a37:6f06:: with SMTP id k6mr22624984qkc.347.1608647818595;
        Tue, 22 Dec 2020 06:36:58 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id x185sm13121431qkb.87.2020.12.22.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:36:57 -0800 (PST)
Date: Tue, 22 Dec 2020 09:36:55 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG1lc2E6IHVwZGF0ZSAyMC4yLjQg4oaSIDIwLjMuMQ==?=
Message-ID: <20201222143654.GA30751@localhost>
References: <20201218045245.18876-1-twoerner@gmail.com>
 <5291abffce231a5dbec49fa24d68a12b07c2c4e9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5291abffce231a5dbec49fa24d68a12b07c2c4e9.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2020-12-22 @ 09:18:51 AM, Richard Purdie wrote:
> FWIW this is missing the rename of mesa-gl to match the mesa recipe.

Oops!

> I've queued the missing piece for testing.

Thank you.
