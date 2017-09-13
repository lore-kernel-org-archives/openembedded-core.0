Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id CD07B78504
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:57:44 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id s62so2272443ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=h/RtFUS/DUJqowL8mdHUqi1UwNPyNaNTLnq59zxCRIc=;
	b=fB4gEeHOCP1T8fl7Ve+9fDfUqlkE2JCyokvb1V9Y1WlpDiUKIJWGBMdHsFqrMvgdJ0
	EufeezMA+6/lW60696qiJaZdWDUtYSp8jeuSjaofo5t9IquaeE59mNPlU0ydgMae1Kfl
	fqEv2YOTgkyljQ3QfIl+8UXXo55FRkvJW35MigYrLmlt/OzibUNZN6qHd+DZ5+PW/VNy
	SUObVdtMu5IXzYou3dn7rx9/APtrLYWgJasUM3MmnERdhJZFWNee/2QuRyNYmy3Raphl
	hQTloV0cgMGUfTdWrb8H0qMHl5a28rl8VPomNfp/uWymdN+iswrFz/LhkV4VqiHSAHYO
	q1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=h/RtFUS/DUJqowL8mdHUqi1UwNPyNaNTLnq59zxCRIc=;
	b=ng3UABuYnr6Ox3IxjcYbViBg1Ej+CoU5746DV7In6IT8cF/pgfB7TBpUDdDcP8fPnD
	44xW8WL1V0D+ke/28Q63VsJaW2yYCXFpq//MibEa4wYQvEzT8DmMl8cj5KxLrKwGVvsj
	Q1dS3Id68pqXS0Gv7plNQ5Q0DeHi2r7yYtnhh2Ot1t4BXGTHFoyXbXZjWumItvcKYJjz
	8rSAvGrUZ7k+LXSyI6P5cwATrO/VmkvNvDWi/W/48mBz+xoyBFHfezn8n+tt05lWwa40
	3kPHVUH70NFDaPUgnr6G19Vcuh6aSXA3WFbums5xuQxT7sWhceFeleG7wXdd1eIBBk2U
	89MA==
X-Gm-Message-State: AHPjjUhnuraUHr+GNKWTx26vgLGsTItlYKhcWLJTA7C0yZRAbU+J1HJM
	IMu5SlcS5qgZf6Rfbv8=
X-Received: by 10.37.113.137 with SMTP id m131mr15954077ybc.236.1505325465364; 
	Wed, 13 Sep 2017 10:57:45 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176]) by smtp.gmail.com with ESMTPSA id
	w142sm3581640ywa.90.2017.09.13.10.57.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 10:57:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f176.google.com with SMTP id k101so5535425iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:57:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCIQXLsx/v62Z6Iexm0ALKwoujR8sNRuTgOe9AXiSfKOh9BB0wqGYOsvgzBwCFS5z0lXhzY6E6NaMHI4zZFtDY=
X-Received: by 10.202.177.195 with SMTP id a186mr6490121oif.32.1505325463038; 
	Wed, 13 Sep 2017 10:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Wed, 13 Sep 2017 10:57:42 -0700 (PDT)
In-Reply-To: <1505315706-8937-2-git-send-email-mark.hatle@windriver.com>
References: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
	<1505315706-8937-2-git-send-email-mark.hatle@windriver.com>
Date: Wed, 13 Sep 2017 14:57:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKofch41F2YHW4TB==fN8KKUFiEPuPD9C1_agABc3JwOnQ@mail.gmail.com>
Message-ID: <CAP9ODKofch41F2YHW4TB==fN8KKUFiEPuPD9C1_agABc3JwOnQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
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
X-List-Received-Date: Wed, 13 Sep 2017 17:57:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 12:15 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> If FILESYSTEM_PERMS_TABLES was not defined, the default was selected by the
> packages.bbclass.  This made it difficult for a recipe or layer to 'append'
> to the default.
>
> Copy the default into the bitbake.conf, allowing future _append and += style
> actions.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Couldn't package.bbclass one to be dropped?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

