Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id E585D70100
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 18:17:49 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id r203so21905596oih.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Sep 2017 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=bVqLut28Cgo9K0rEi+VcM8oZJSTwzHQsXqS+ZjGrp7A=;
	b=heoL5dBWpIfpLdOh0jrYctE3jY3DG+yXxi0r5dIRk9LRRq5FEju1U80PB3OI/0YRLh
	viLO7lrdpGBlFmWH8AdFvsfhKD9VQTTL9m8CayXVBPP22QrG2YwC7a7KXmjzjONmz1OK
	BzbqXQdXLjRlE5uuyg7IV50ha9dG2JVS6lPCg3ftL18NzRtOadKyO9yNt+7d2scgT8ym
	O9+k5otiacVy1yGRRrPeAXg3NLwskLZZ74S79Qn4m3ICIvo+Giqn6KAHThx0Go85bPGG
	18Spm7csniE05K9uo04QOFpHmINdvtcnxrzFbchNeW3uMnEQlw9egpVO2/agszqFyPAq
	LnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=bVqLut28Cgo9K0rEi+VcM8oZJSTwzHQsXqS+ZjGrp7A=;
	b=g7gmZBSzQs/DlxTbhMJnHlY4VhIRYwCWswCySsjFAc4dVpeVMdKoyQ5nsj0asSiKuH
	kgJdV+2k2AkD66d0GCtmr5Th6fJAZoocwkCbqXbutUwsXXh3w6d4Om+hMnYVW0m1hi6l
	ioxlD2CXebz/nOw8yGZjrigKkX69UZ99Y57tjLLylnO+11G2Xc+us+qZotHBR5/qjvxQ
	xKgjowUOZ4NU1cSsZ6WTm7WjCVZKAxDr7fBzxgzuRBAR25YuRKf6pJe3BYkfHBr2yOYr
	s3TtHhF4oa7t8TQ2fR8/9epSljN+vDpsyPeOzjCfDZ5Tm8OJQKMQTLhdJ6q31/DU69i/
	408w==
X-Gm-Message-State: AHPjjUgLl8j7PXOTo63+jE5b2EDCQq6q0+MXCmM9ImGXZt25tNiZyKNY
	FjO8bALt0CDQCwhpMmE=
X-Received: by 10.202.170.20 with SMTP id t20mr5635893oie.60.1504376269878;
	Sat, 02 Sep 2017 11:17:49 -0700 (PDT)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45]) by smtp.gmail.com with ESMTPSA id
	d26sm4479139oic.42.2017.09.02.11.17.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Sep 2017 11:17:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id n18so21928333oig.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Sep 2017 11:17:48 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6ZuQSvUY0QtMIVEFonu3EjjM2L7pto7F/Nm0sZz5J+gg4ZWMC/55hseUx/23iosrx6YxRLUBDCOhmi7sGkRHk=
X-Received: by 10.202.71.5 with SMTP id u5mr4812871oia.56.1504376267908; Sat,
	02 Sep 2017 11:17:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Sat, 2 Sep 2017 11:17:47 -0700 (PDT)
In-Reply-To: <20170902000458.28655-1-california.l.sullivan@intel.com>
References: <20170902000458.28655-1-california.l.sullivan@intel.com>
Date: Sat, 2 Sep 2017 15:17:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
Message-ID: <CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Sat, 02 Sep 2017 18:17:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 1, 2017 at 9:04 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> Having these the initramfs-framework recipe forced initramfs-framework
> users to build several tools they didn't need, and made it more
> difficult to declare the recipe as allarch.
>
> Fixes [YOCTO #12024].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>

The patch should be based on the allarch patch I sent as it adds the
dependencies on the whitelist. So you can also set them as allarch.

Please also move the scripts to specific directories. As it is not include

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

