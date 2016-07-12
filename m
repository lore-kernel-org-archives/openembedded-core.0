Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 927F16067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:41:29 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o63so1124157vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=mv4hm3TRbdfotP7BLoKSNhOJyStXENjpiT8KRfIkc10=;
	b=rU/s8eCCyVaesf3MoMV7m8zLtD9S1SNclzIfzTsi/XoRVs+4RUYa/kWuXbaC9dKx54
	aneDAu04uIVR31pOzqCGlJ9jAAfGGqkWsnAalPZKEyZ9c4IT2avmhkb8FujLZB85nu61
	vVXrIOuPywdzWXQPildXbZFpEUsOEDyI/nzJMQjH15wv97IwI5J9BORCCVutOe9VoAbv
	XJfCqZtIMkAn+9UC+zBN3YwPzBwNkjfoTl/WudB3AdKqi/Rj9kGbC9NliqW/j6dGx9lo
	4JFksFb4ivNddKekrSUr4wjmTtlUTAiVzqbkamMyEdKBqaBXfLcYJwlA1eH9ozRLnlC6
	gjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=mv4hm3TRbdfotP7BLoKSNhOJyStXENjpiT8KRfIkc10=;
	b=Zt5splyfpxQRspSafyLdolV8++gv/SnQDd5n2J99dghxBe9UHGPDDDnE4M9ti7ZfIb
	ZbW89As905xFVctCwoDFUMANoMfgyHfkeSbnwLgkrPrNDHpoe7yhOfyyD1r5pTFVKuLL
	L0WWNHx1IHH5uR0ClQHF6zV9zYaEKVP3LSHWQywDh0L+tGf1d8mre3HVIWY20HtpYL0V
	iczKEEhHED+WZd0/dKLqmaXIrdy+LWBb7us5sDDL3fyG/ug1cmW9DcUo8d7Bw3pE9ItZ
	x/Tz8ivSbMLR9Hi9MiXA21rjNuChil9Tw77UE447oeGZw8dSvaTIsbzbph5awTLLepjj
	280A==
X-Gm-Message-State: ALyK8tKv0tZpCo26o3y/jV4OzA1b9O4QXsjEOkOCQl8G2YLLl9W764D/XxaTho/5SzUB3w==
X-Received: by 10.159.54.202 with SMTP id p68mr1080509uap.59.1468334489944;
	Tue, 12 Jul 2016 07:41:29 -0700 (PDT)
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com.
	[209.85.213.43])
	by smtp.gmail.com with ESMTPSA id j5sm1641562vkg.24.2016.07.12.07.41.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 07:41:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f43.google.com with SMTP id f7so24595190vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:41:28 -0700 (PDT)
X-Received: by 10.176.1.106 with SMTP id 97mr1104900uak.154.1468334487996;
	Tue, 12 Jul 2016 07:41:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Tue, 12 Jul 2016 07:41:27 -0700 (PDT)
In-Reply-To: <1468329867-32055-1-git-send-email-patrick.ohly@intel.com>
References: <1468329867-32055-1-git-send-email-patrick.ohly@intel.com>
Date: Tue, 12 Jul 2016 11:41:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqgKqydpc3DvJkSNLzOydF2ZWAC4E-ETZTOGQ2f49HR6w@mail.gmail.com>
Message-ID: <CAP9ODKqgKqydpc3DvJkSNLzOydF2ZWAC4E-ETZTOGQ2f49HR6w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: make rootfs module optional
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
X-List-Received-Date: Tue, 12 Jul 2016 14:41:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 10:24 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> It still gets installed by default via RRECOMMENDS without having to update
> users of the framework (because without it, the framework is incomplete),
> but that recommendation can be overridden on a per-image basis.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

