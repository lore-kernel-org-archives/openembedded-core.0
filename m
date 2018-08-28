Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id ACDC6771B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 12:02:45 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id y207-v6so2277374oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gPLXtZbyQYAMW9MuEQmnBTLPsNbLtVBcPALBFFdNR78=;
	b=ZCm/S33KYKQ1HQx3MtJCaLqqT+Y6YlilvUVbuJn+sLcFWlIp6flknUyHTQth1MYI5Y
	Ameihhde4/9jnwuZnL+jzfoLUZhnrD3pe7E2XnPxAg/PO3/lLGowWYqpRmm7Cr6WMtvI
	Asbpx5/BIhq7R0A7EN26UnnqGRnpcNsBFP7CgPHWRx3N5HrS/PqLbyyJwY0XaaFgr8nf
	Mn1ihVqPZVfGp7Mx07n/WTnFQ3RMeRqiDvDZcMUAhO0sv7TjxHiRT4gvJ0EozCLU/6l+
	XIinfQTrygNRjPZDG5jQtJwIe4TvYXLMYcr8RNBVmj0I7T1gD4geu/qIZ61d+XSnkQmu
	LuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gPLXtZbyQYAMW9MuEQmnBTLPsNbLtVBcPALBFFdNR78=;
	b=irzxYaWyCxpIdigoumyZVrIgWGH41xoiNp8+HOJwl3p7/V1dkyzCQJACsmdD+3ZJKY
	Exp8FTmVrJAxz5+pLB01uF9fvO0mQTfQdE/maZ/GJPnPHfTvbsGzYVyYUSuii580Ctc3
	qz4ElprcHGTyMkTP0AO07pWtM4ykme8rj9Rbv+eU5P4GfQiERYmg2X49Bb5Qg8XbD3cy
	eUc/sDDjgoB4u4jm+V5USMCJMKNsTxZH3fopYeQOi/Lf8v2F+/Sve2ZgC0slQQ3Rq4kp
	pc8QsdZ5WdV0C91E6RXPwKEdk8SQI4ayJzX9me/QS8WdgI8noI676l8pFRuroA8+pJum
	RkUQ==
X-Gm-Message-State: APzg51BKOnE0icpHecytQFQoEOKF5bs52K09iriWpPzKQdh4gYWOMXkW
	sStwfil11w1+U/qTW+v4tXBTKvM0Soezg6R+avFWEQ==
X-Google-Smtp-Source: ANB0VdYPsiX8WJnWaWu/8q5zLT7ewCMcMeATm8kPtJS8mnk84S6HyeLnsomQRWCn+C9rCyakM7zixWvmBVnpGKAroWY=
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr968174oib.217.1535457766644; 
	Tue, 28 Aug 2018 05:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:02:46
	-0700 (PDT)
In-Reply-To: <2f3b7c17-9233-5159-59bb-73e6858eebca@innovatrieste.it>
References: <2f3b7c17-9233-5159-59bb-73e6858eebca@innovatrieste.it>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Aug 2018 14:02:46 +0200
Message-ID: <CANNYZj_V1UfEQMWFJhbGy41+8j4rQWiCeZSA-Unpi=LDFzEyQQ@mail.gmail.com>
To: Marco Oman <marco.oman@innovatrieste.it>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: devtool recipe not working outside workspace
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
X-List-Received-Date: Tue, 28 Aug 2018 12:02:45 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-28 13:44 GMT+02:00 Marco Oman via Openembedded-core
<openembedded-core@lists.openembedded.org>:
> So I gave the command
>
>  devtool add https://github.com/Unitech/pm2.git
>
> and then
>
> bitbake pm2
>
> Then added a patch. Everything is OK. At the end I moved the recipe under my
> layer (sources/meta-mycompany/recipes-devtools/pm2)
> and issued the command
>
> devtool reset pm2

That's not how you should be using devtool. Once you are satisfied
with the recipe and sources in devtool's workspace, issue 'devtool
finish' instead of moving the recipe manually etc.

Alex

