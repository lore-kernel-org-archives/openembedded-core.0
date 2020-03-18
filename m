Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id BBB8560ADF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:08:29 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h14so36462488qke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=JOdRUoMXX9v3Db7ddAekDlc0GjM99dr7udKdtGUbRh6k/sc9YoCz4sOxUXcbH3erbI
	M9EeLoEW5qlks4ssKp6Dk9KgJNFqkWWFloyr7hVnJGZCMEk16wiTn1f/XOZsLqTq12DQ
	u6OLQ7trHjEQOj/cz9rGZ5E9mEp5D/Mq3tGci67nFAsOZoHOuRZlqr8NJJAjvhCegP5N
	FuIuMWl9WdUZ6epd83Vp8UhodzPK315VncwFB7gdhGNmZkUT7HPIkA/mCjE8vv0ZKD04
	pnMsgNXeiWjHowZFJaO0+q8DcT/nElK4sYiHIdzyGVyYaokoG4tqbJXaTUT8c8BuCuzt
	Vbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=Mvyl+vZ7sjyGsKnQ63psBYf/a67mBMLZRUml0yu8lwOIcCNlA3Qjh+ulC8pKEjEqqH
	bj1ka2K64riqwfXSu9AhZwUFswe7gC30TpFI7rvewTCPa4tLf+qONzvX+IrzbndXF4NB
	t5dWvJv0pVzp+MZD1Q4v/8vFy1pZLf+m3GbHJeozs1CU82DdPmou4zrLKzURQi8sfw3y
	YV4qZA5gBRxOdPdXn0ysH+s0i4X81+ak2t7zVF14RabreSI49oiYfNcyottjdZri47ox
	1VyeYEyUiG9HY++FW6QlDWPa2eKSGITWZhe/hAqEShdHd7zlL845AO5eCJh6jMLUOYQY
	HdHg==
X-Gm-Message-State: ANhLgQ2uDh8DorMZOzbcix6L9zTcYt82/X94tSi1QMYwq9UvJnEWvgt8
	RL2/n7gWN9c0C9k+vaZ9Im0s6R0Cov3Umg==
X-Google-Smtp-Source: ADFU+vuyehT0NBL2Q2o/42skIAwJZtCvDXefZBhDJlAfZm//qgzK0qvvM1IbceQqTDHsh/rTWgd/qg==
X-Received: by 2002:a37:27cd:: with SMTP id n196mr2175488qkn.144.1584500910418;
	Tue, 17 Mar 2020 20:08:30 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
	[209.85.222.177])
	by smtp.gmail.com with ESMTPSA id x6sm3303836qke.43.2020.03.17.20.08.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:08:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id q17so11793650qki.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:08:29 -0700 (PDT)
X-Received: by 2002:a37:9542:: with SMTP id x63mr2171127qkd.82.1584500909362; 
	Tue, 17 Mar 2020 20:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-11-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-11-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:08:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq=hbFLaYb-tr0CUkZmm0poEv5-0Edwtsz7T+aZaSyVnA@mail.gmail.com>
Message-ID: <CAP9ODKq=hbFLaYb-tr0CUkZmm0poEv5-0Edwtsz7T+aZaSyVnA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 10/11] systemd: Enable audit based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Mar 2020 03:08:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:30 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

