Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DDC1A616FD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 15:48:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so5024421wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7GKlTD5YhOfpRshaWxRXEctmY/80PHdA3jF4jBQZ8Bo=;
	b=NqP+nDkScJqY6fTwq3LQvy8snmZW1BILFN3nq8gQSaQUm+/1qjQ2dfjL5HXzKC0GEe
	ZrXlkA4Ur5UvLD4b2J1PFA7mGhdEtWQXV7T3VGTjoQmpZ8rtTnCvFCg896Z9nb69eFVW
	oRRuoLK4asc71QQB6ekEYmHObLQNSpEHqFdaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7GKlTD5YhOfpRshaWxRXEctmY/80PHdA3jF4jBQZ8Bo=;
	b=ELftzBFrhpQUH68R+ujl3L8n4PQpVErcIpCyIZQar/f8sBtlEfy3A4Q0dAv/FlrKaX
	jkBz3Xfkw9ghpqGIY5BCPBUgbvfl3neBxPbAAfOUYmDfROUyzBR8CSvrhF3j5srseQid
	BrvnbEoHet937tTpio30ENLAU7ZiKF/eqMo0rL1M8YWitxSNsNN8g+F1liNiFlKF6vhh
	Kg7NrizrMC3FgEJ5zhggQiVL4BW/j+BpHqkcOyRwiH7BxFIbWZC8xMyjI46ZNNOKWwAR
	AnPXHkXMEhAbuGfdsUxKoUhkd1jCPcUwKRh9TijmerfW2uU+NvnUlBA6j7vYbxKEZQ+C
	VK1g==
X-Gm-Message-State: APjAAAVDxDS8YevXVse27ljFJpYYE8ed+jeIuKnpJl1J/hgJ7lnMM/xT
	q1WGnGJIxbJAfvvAxo1KlzqKQjheGPg=
X-Google-Smtp-Source: APXvYqxnq581oHFhJbHp9NblVYonrbQkAmlfUlWzxLnOgEftDCbmzA4hAi7iJ3deXZTCMqz9KojTow==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr10977861wmi.35.1582386507041; 
	Sat, 22 Feb 2020 07:48:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w22sm8979322wmk.34.2020.02.22.07.48.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 07:48:26 -0800 (PST)
Message-ID: <c2f23e7913742000ef79bcfe0a3bdd678c4dd513.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 15:48:25 +0000
In-Reply-To: <20200222140157.253097-2-richard.purdie@linuxfoundation.org>
References: <20200222140157.253097-1-richard.purdie@linuxfoundation.org>
	<20200222140157.253097-2-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] psplash: Add missing dependency to systemd service
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
X-List-Received-Date: Sat, 22 Feb 2020 15:48:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-22 at 14:01 +0000, Richard Purdie wrote:
> Avoid:
> qemux86-64 psplash-systemd[135]: Error unable to open fifo
> 
> by adding the missing dependency on /run/ where the fifo resides.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service
> b/meta/recipes-core/psplash/files/psplash-systemd.service
> index e14f42032d8..e6de450882f 100644
> --- a/meta/recipes-core/psplash/files/psplash-systemd.service
> +++ b/meta/recipes-core/psplash/files/psplash-systemd.service
> @@ -2,6 +2,7 @@
>  Description=Start psplash-systemd progress communication helper
>  DefaultDependencies=no
>  After=systemd-start.service
> +RequiresMountsFor=/run
>  
>  [Service]
>  ExecStart=/usr/bin/psplash-systemd

This doesn't help, the dependencies between the service files are
reversed as well. Working on a new version.

Cheers,

Richard


