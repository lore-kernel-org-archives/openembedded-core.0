Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD9BF60C6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:39:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so8695455wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=jmEXuQ94c2loWI8Vr2VP/kY1jXmAKg4HB5bNd/T2mUo=;
	b=SxfonpeXlqxPkc88l/X5dCvMZD2ljJA5OqUYSAbTLqJvjzF1BrvBztZNjst/PvhvTP
	Nqmx0twq70O0hwHF/ykeLgGCyIy+zwyOX1mGT/mIYLrJ02+MMtg2OwxYtQVt0gd7G04O
	/4N5+wE0nLbqlB5RjMEmiiOgYIHaledvMMXYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jmEXuQ94c2loWI8Vr2VP/kY1jXmAKg4HB5bNd/T2mUo=;
	b=MBH4HWovPrzO+1rYE+v373uVGm/JDDfvRw4symIbQTZzB1/OhLgn9xFeDyL5RsAaJm
	H3d9T+9RHd6UeA88ynJ+5pCSShs1TdEvDdoWqzzLhSK9Ct59wvVKwCX1GrJXkuEr1Jn8
	XyiFFyWnsBvHjhpSdCTrdZUYSprTl0lDG6ML/1iT2LHBbjQaEiSzRilQAf9lf2JVarzG
	wZyGIIJ33XSGLpUnUbTDrdGUTt+E8wxb1Wh0yWjUzsUiMsSQj9HJvzE/XTf17AN0jpML
	bkskcLH/RoIscn9vylAitTWXGPGxFKw1aVGs2uArvPwsBl0/cuiy2SDK7KFXVTyjERou
	g2ig==
X-Gm-Message-State: APjAAAWx25v4xIiEy34igLg+HJyNJ8NCg4shgbROQRbje2jLXO6IN0UT
	Vys1qazk+QH+W7Kut1M0wBzO6iIpBsw=
X-Google-Smtp-Source: APXvYqxr0Xxsw0zwktSKJrQzBr1Yt62eFeNT1CGIvThfL65fV7MwDfwI1Xiq7tJ/Aac1zSrbFUYopQ==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr439674wmc.115.1581637184565; 
	Thu, 13 Feb 2020 15:39:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm4765190wrj.81.2020.02.13.15.39.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 15:39:44 -0800 (PST)
Message-ID: <6557ee9b5ee8375cc9e7ee79336975f2cd8c4468.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 23:39:43 +0000
In-Reply-To: <20200213061649.102346-1-alex.kiernan@gmail.com>
References: <20200213061649.102346-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Thu, 13 Feb 2020 23:39:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-13 at 06:16 +0000, Alex Kiernan wrote:
> Commits from v244-stable:

I think this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/1557

(systemd-boot patch failures)

Cheers,

Richard


