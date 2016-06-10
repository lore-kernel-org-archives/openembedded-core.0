Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 848AF6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:48:26 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id d64so98088467vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NvfgIYWzS0PWfmztirdBZp1lnIsQvovBx6DiK79j+eQ=;
	b=EVhm8qz/nO/QeJQ+K58cIvDiUNbiR8Cgy+3PrriXUxtqp0YJ+YKf4MRq+PVTQ+HWby
	LepeDR24wzfKKDz4HdBspy5l+HujEDw90a33+HXOAFkdEEjx4mDmW48whvJvy/6bJC7Y
	hjxV8dt6lPB4BlXIcLj48bR+/ECG70L7x5ZZ1+LWcVrR7DCQwKY2BJzJuJsD9ky1kIZh
	1fwsTCYh/1q7ahaYSd/8/fo0MDiSw7whvmqU1zNyveSHzrAOdyekwqv3i+TNDhde1wM7
	jBby7/ConTXNs0V3XP5uy675Eb4RyvQAHm2/h4JF7QaKRsPsJQ/D5ord3yJUdjg6b28K
	MF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NvfgIYWzS0PWfmztirdBZp1lnIsQvovBx6DiK79j+eQ=;
	b=PYURH/LijC2Ym65Yt1qi+HadqATMFUdHs7cT0DQVJptFNFYzBSOqS25NFr+Qv8/Vav
	ZMsWAhRwVc0JB/YOuTut8SUXVRHU7coXtFzM7HxyW9JxC2Pmo+6I+xJDtqxh4pTSB2dy
	OJK+msQ8T2jZksRNZq9hMDagJvG+xYvmaz9avo0rKFmpcMZe/NWN04xHKE0PbxSzVY7f
	ItYo954XsN9aG70Ezqvt02QLzcOGWqRWzO/7rKuesQ9WGv3e2k9+M78CCSI0tLfc5+vx
	lHt7JvdSqkvPee5Dpd993ySAoITjf2XgxJdS2C1BsSPLOV/MGT54hfDRGFQkeQgC3YGu
	4NUA==
X-Gm-Message-State: ALyK8tI1tTMTnFnotMKPRFE2QKXXG206R7m3HyzYK1CZcWR3UrxOAaVGWQZjNHEOxBfBgg==
X-Received: by 10.31.152.17 with SMTP id a17mr916004vke.100.1465566506811;
	Fri, 10 Jun 2016 06:48:26 -0700 (PDT)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com.
	[209.85.213.53]) by smtp.gmail.com with ESMTPSA id
	o127sm1865847vka.26.2016.06.10.06.48.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 06:48:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f53.google.com with SMTP id d64so98086934vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:48:25 -0700 (PDT)
X-Received: by 10.176.7.102 with SMTP id h93mr698325uah.70.1465566504802; Fri,
	10 Jun 2016 06:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.21 with HTTP; Fri, 10 Jun 2016 06:48:24 -0700 (PDT)
In-Reply-To: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
References: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 10 Jun 2016 10:48:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrx=HHQpK1HpAijc6UY3Y9gVBWtEk8zWTgbu3sLq2GX8w@mail.gmail.com>
Message-ID: <CAP9ODKrx=HHQpK1HpAijc6UY3Y9gVBWtEk8zWTgbu3sLq2GX8w@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] x11-common: Fix XDG_RUNTIME_DIR typo
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
X-List-Received-Date: Fri, 10 Jun 2016 13:48:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 4:27 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> Fix the if-statement that had misspelled XDG_RUNTIME_DIR.
> Also fix whitespace.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

