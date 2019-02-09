Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E88D6BCE7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 23:59:30 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id z7so18048211iti.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 15:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=8H+3e2NC1+5aPVRtp94rfiNkot+oIQNkGvydFCk8MjI=;
	b=bWGT8g2/PssJ8C3WLy374s5YQU7UHXv07yG9t+frDxgu00RfsaB83fsDlXVzOMkDaq
	hZXTnb9X4Smq5HCpbBnx5kCdKu6dfXTI5svSc5VZPh7ROsutftUs1i3g/3vTawp1hVCK
	eaB4EGWOeiv/1UKh21xKL7pEndVkjw1yZPMV8Ob5Xnw++9ri4xe1j4RucX8QE/waUnFf
	xx8KyMjDsEwSKx+GPVDwHAjdUkY/WwkVURqIuUD4Y76w4ME4Bpd7F5Oi+XYTruKZcdWt
	qTXAaZ56WrsKvzUEwc8go3YHbLEfOU1sIfFLCggyutTsCbhwnrk1rehVadv2/6NmqRAf
	eZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=8H+3e2NC1+5aPVRtp94rfiNkot+oIQNkGvydFCk8MjI=;
	b=SWXZkPgv73V9LyGYR5D7HlIpnphoHR9NIM+aQ3z6Qv4TSim9BAvEuLoNZloxIyxxBo
	daHDhFbozu4CAV0PV/MSZrarinl7dRxDWIdtQZ0K6aiveqWGTHcgGAWyhwfwdhX5nsAw
	x9sKgget3/Kapjsq9yh+RNo1uNxINhrvbzlbsLqC1Ga2TNDkdSMOh1vbdtuyBn9uFAqI
	CxOav+mMzLgUEl/p/OCEVWtxMgz66zwK0p0GSB2NMfULT/8GG8kbWqS/Cp8EYSRJL1w5
	l+hO02chcjpIRsi6/UTrpYV3YEIsSYbCy5vnWI4wTut5WMOlJ1ScPupkTtzeOrLInnY8
	0HhQ==
X-Gm-Message-State: AHQUAuYgCBIsGQ4LwAuKyP+8hWFih8R9c+x1fjX3gYC0YTwzyY5WKg9Z
	JRhNwGND/RFPD3X0XRP+awKqXRZ1DInuBhaz1oUnXw==
X-Google-Smtp-Source: AHgI3IaBDk96AVF8yQXrMjY8RGpC54X8B7h5eAfgvpDzIbGdDRM4r3fBVnAtqIORg3pgv+WldAxY3T4Tz+Vxdlkh8/w=
X-Received: by 2002:a6b:fa01:: with SMTP id p1mr14358129ioh.271.1549756770961; 
	Sat, 09 Feb 2019 15:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20190127202504.22909-1-schnitzeltony@gmail.com>
In-Reply-To: <20190127202504.22909-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 10 Feb 2019 00:59:19 +0100
Message-ID: <CALbNGRQW0AmiKMp_bKeUnVLyBJow8jifPmr4ReCmSwGLWCPgqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] menu-cache: upgrade 1.0.2 -> 1.1.0
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
X-List-Received-Date: Sat, 09 Feb 2019 23:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2019 at 9:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Latest LxQt requires recent version of menu-cache.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Ping

