Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAD84607A4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Dec 2018 18:12:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n190so8814156wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Dec 2018 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7/Ftm4dfWfkBMshlNh0DDnOxrhv1ux40apaRYpKgw8Y=;
	b=VwIDKBE9t01Ox2v65ZSLxeJ4EoPGwjAH+yHwrsufbLbS/gQbKXYpTmIuCc+YwDnGt9
	wdBTXWws1Gebok+JLFVhcAzsJEozK7/WyDaGClmB44g0UVuCW4EBk3MSaBJxCv95GXJL
	5eKOG5WN4PpHxt2iJRXn7VfZNR+e/Ooi1jjfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7/Ftm4dfWfkBMshlNh0DDnOxrhv1ux40apaRYpKgw8Y=;
	b=gmPswht2bU7rqLPRirMRWe+vvmuuP4FFASi3SpG8LBMBNAx8/zpLMe7plJ/qk+XclW
	gtjrWryBwU+DbRRkoJ93kXyt1q+ZzQUlVpVHxZFfyH11REi3EqmITeCkHkaYLzCjNKfR
	wrlZjibrAKjvvKK4SeJfbavQj1cMRiiE35mwlGXj4Niqc6jNK3aDQ4Sn5hFU2gNM0jlp
	z8BkuAsXprxf62M5UINWl0WYfxS5pD6G3AjL/dWq/BnTU4O0jLnoMU+AxHJmQjYdEYAM
	6onIcopaRG45wMoKzy2IN2llm7Y0ekR0YAphNh4wIkIZAWYAnUa7WMx0qY0lrn0zlOUf
	91Wg==
X-Gm-Message-State: AA+aEWaiQX03iRyGGHPMLYbumXa54KgOdkQwWQPR4LRxQpKlLzFTnEiG
	zrFbopj94KAoQutTkBNawVRw+w==
X-Google-Smtp-Source: AFSGD/XgtxbaTgXYlewLr613SC0WCU5mkv+W7UDBe0UKTLCrdtEHronbXN6nqrgvHvJvHd1lhAwAng==
X-Received: by 2002:a1c:48c1:: with SMTP id
	v184-v6mr8412412wma.26.1544379133372; 
	Sun, 09 Dec 2018 10:12:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm14206864wrp.12.2018.12.09.10.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Dec 2018 10:12:12 -0800 (PST)
Message-ID: <81b73451de8a9149beda328186cbdf4adb4452ea.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, poky@yoctoproject.org, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 09 Dec 2018 18:12:07 +0000
In-Reply-To: <c2e11d2a6ebb8da6177c0b0d7174a0e2047093db.1544102766.git.kai.kang@windriver.com>
References: <cover.1544102766.git.kai.kang@windriver.com>
	<c2e11d2a6ebb8da6177c0b0d7174a0e2047093db.1544102766.git.kai.kang@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [poky] [meta-poky][PATCH 1/1] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Sun, 09 Dec 2018 18:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-06 at 20:53 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Move configurations from local.conf.sample.extended to
> local.conf.sample
> to make systemd as default init manager for poky.
> 
> [YOCTO #13031]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-poky/conf/local.conf.sample          | 8 ++++++++
>  meta-poky/conf/local.conf.sample.extended | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)

I had a feeling there would be some issues to fix before we could do
this by default:

systemd fails to compile with x32:
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/76

sanity tests on qemux86-64 core-image-sato-sdk:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/77/steps/7/logs/step1c

sanity tests on qemuarm core-image-sato-sdk with poky-lsb:
https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/77/steps/7/logs/step1c

dpkg issues:
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/77/steps/7/logs/step2c
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/77/steps/7/logs/step1c

wic failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/33/steps/7/logs/step2d
(postinstall problem?)

musl sanity test issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/77/steps/7/logs/step1c
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/78/steps/7/logs/step1c


Hopefully its a small number of issues at the heart of this but we need
to sort this out before it can merge.

Cheers,

Richard



