Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A9BAE731C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:00:11 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id g64so42372970pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HSkd5aMO9uYhjJiMDgOeJa6LfLtkDVHBSdhNwswaHlE=;
	b=uQr2rT9x+zlm9QV+JPV3KFl6bLpv8LwsNHpwkV0S6Fa7T4uOBTUCN+jql2SNwMAkzH
	sAFTQB1YhjbZWBSmHI0cCRkF8LynTyAgoiMWxGrbdPH3W/LaBlRKlIymh66Joa8IHpsH
	6gzq9PRS4ELgRI/tDzyD8PUPd3msyINc9hV1A5QNX8ZT3XIrJr99hnpZQ8hzIU9jR2un
	WnKsrMSbumNRrA+F3j/6fGDzHCBrWqesVPlLH45uLa3dC+qm8sgv3IE8m2F5R6h9JqlN
	pFdhGz2GFaCLl2ajQTBQSMlu9YFMx6on2ku6JdHRUaM6U0I0gSolbUt0Soscp9b/A4ST
	Z5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HSkd5aMO9uYhjJiMDgOeJa6LfLtkDVHBSdhNwswaHlE=;
	b=S9RrSnYzVZJo2czy1illTLeDPkSa7R3K2HWqQrWBYC0Skn7m2BVN53zNLqUtm6S09P
	GYfoJkgQoUqcBtHBLHDa24TLj2uiXXk+ixDc6htdWkjtk7ouIlU1MQ4Hy+fWZFNSTlxp
	4WW5+okTShEIm7TDtgSkR9c917PD4hq0YNRAVesFCFnEh2F6z6sKJdSNOfswnnesiudE
	+Al0IcHsR+MPuSwiTQ8vbkowJQjJIjOMkccY2JF84bzWT+3dThgAYwggbhGiLb5QpfjW
	zYZu8Fs8YAChQLT20gazKJMTfaVQ8OteIN7/Sly8KUNb1upy6YqkGMvC/IdOrxwQxU7O
	lDdg==
X-Gm-Message-State: ALyK8tI/4eeomnXo4IzzhZwGfFvjnsX6Q9UqGv6g3Hnd9lJNGvWObyQ/YT+4VO73+rL8rw==
X-Received: by 10.98.8.146 with SMTP id 18mr19412874pfi.14.1464357612631;
	Fri, 27 May 2016 07:00:12 -0700 (PDT)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	a5sm28611641pat.19.2016.05.27.07.00.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 07:00:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f44.google.com with SMTP id eu11so31352719pad.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 07:00:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.65.169 with SMTP id y9mr22847466pas.102.1464357610551;
	Fri, 27 May 2016 07:00:10 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 07:00:10 -0700 (PDT)
In-Reply-To: <1464357493-8652-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1464357493-8652-1-git-send-email-andrew.shadura@collabora.co.uk>
Date: Fri, 27 May 2016 11:00:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrhu4+XFZY5BeghTstiq4F2FeW52Yox0VqUusuq+p6tuA@mail.gmail.com>
Message-ID: <CAP9ODKrhu4+XFZY5BeghTstiq4F2FeW52Yox0VqUusuq+p6tuA@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 27 May 2016 14:00:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 27, 2016 at 10:58 AM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
> Upgrade U-Boot to the latest upstream version.
> Add a patch to unbreak build on some toolchains.
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> ---

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

