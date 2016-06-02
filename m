Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 600AB774AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 20:47:49 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id c189so88132253vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=M8JMBF4aPaCQc6Rxs3jXWMZ0EYij0GRCaA3b5gvnKjI=;
	b=1tRlILKAwkdwqGcDw+or5b1bzJgbNmSxKu5/HUmlUAi4p2aMRHaeRSu6ptZDsCawDT
	suD0sVb+PuaS80ENehzjtqWjgSq64PlRJOB7yVKR952I+UzuXvrBCyGZPlpjYR+zdo9o
	r5z63NjomcplREoDpeTBjUShDRLFzOaGzxZ8/r1KKkMGV90++tcOSNNB36WbALGXxFwZ
	En0DBawZmOqBOGkh2O9lXnp7+KPuOtJJXWoOmZKKUYanWsnO6lWnrhe2/vi+tCaAl6aA
	Wp17gCZ2X6sx2pc+++9+hiwJCyxD7csF0decclx4JXFxghNOhSTiNVnqDPRlpyw32hDh
	YA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=M8JMBF4aPaCQc6Rxs3jXWMZ0EYij0GRCaA3b5gvnKjI=;
	b=hyA3GDN+a+mcc47ng0o9Zt+ecaIwXeeQTswiqr6d+xNDigUR+A1GzqANX23/VuSj1j
	2PGO4L2lJ67ciJkzZF+CYEECRSeWVUUyRfzB7IUZo1WG9XOotDb/V18OfE7DPJae8T3G
	pkCl6crBoXZjud9GaKl1Mu7xOcklmIeQL5Cy/S31Dbe5kAJK/O9eJrMXij2roQ6YG8ZX
	LVvAyRFTTaC98366xUxSXV5m3XAVZ1CGuy/4s38uMl/EsD3tRNTQ7OZVuGSmZ1bhOOj9
	O0FnfkEZQfChbxBDWUpKg+68mC2yk8Iyc3PaDQNp4Xb1JzO9hT7E/CcqJBEvIKGXk/u7
	lu/w==
X-Gm-Message-State: ALyK8tL7qw7IjlqSL6zpnQDb12GqUzAUDfePrDPm6ZgNrU7no4snRswYobaCmIsxfnzDmw==
X-Received: by 10.31.130.71 with SMTP id e68mr29530vkd.145.1464900469845;
	Thu, 02 Jun 2016 13:47:49 -0700 (PDT)
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com.
	[209.85.213.47])
	by smtp.gmail.com with ESMTPSA id u124sm102497vke.1.2016.06.02.13.47.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jun 2016 13:47:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f47.google.com with SMTP id r140so88168939vkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 13:47:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.176.69.201 with SMTP id u67mr41099uau.131.1464900468377;
	Thu, 02 Jun 2016 13:47:48 -0700 (PDT)
Received: by 10.31.189.129 with HTTP; Thu, 2 Jun 2016 13:47:48 -0700 (PDT)
In-Reply-To: <275b27054ef38a72eecd19d22c9263f432cbc9a0.1464898710.git.paul.eggleton@linux.intel.com>
References: <cover.1464898710.git.paul.eggleton@linux.intel.com>
	<275b27054ef38a72eecd19d22c9263f432cbc9a0.1464898710.git.paul.eggleton@linux.intel.com>
Date: Thu, 2 Jun 2016 17:47:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKomJrxA0RGRFmkwE5Pa_4TfMy+7uqmxnzoq9F=nkxnYDA@mail.gmail.com>
Message-ID: <CAP9ODKomJrxA0RGRFmkwE5Pa_4TfMy+7uqmxnzoq9F=nkxnYDA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ca-certificates: add dependency for native/nativesdk on openssl-native
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
X-List-Received-Date: Thu, 02 Jun 2016 20:47:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 2, 2016 at 5:22 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> When running update-ca-certificates on the build host, as we do during
> do_install for ca-certificates-native (and nativesdk-ca-certificates),
> as of OE-Core commit cea46e7b8d9463306779301fa97f651d750f380f we now
> need openssl-native so it can run c_rehash.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Thanks for addressing this.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

