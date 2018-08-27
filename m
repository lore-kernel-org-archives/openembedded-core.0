Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7426E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 02:04:59 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id q204-v6so24598179oig.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=thZ/3NyMdlXQ5pMdC1F8dy+XD7Nbj/LTgL8lL/4t3oY=;
	b=TGhCakUYqCzw36DpdTfFfE3UFRgpWsNpB7VJnDTSwy6cb8W4Fvr4lfc9T3cdTc90px
	TTtA5N2CwFl6ykgKi/f7pIv4O/qeXiqEpo8f+mpNcPdiXUYyUOiV8Bob2slvrABDMwnd
	pI5EyyBmhxHJBBemyR2u7FUeoC8+5z5YhOdcrO38izktHZC9mFVHzClMqH63Ud6S8B2S
	m3ONXw8taWvI0wO8ojkNGhQ4U5WwUM+Ce0RPiRbeZ/sZmYFW8jVxuRmkzFnylFiI3Q7x
	3nBNlVlYlCDaJIst658ybKJQOhguMWOKLzSHEHDBqxqIn01CGs12sOSQQw8kBQ/Rlwbq
	SRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=thZ/3NyMdlXQ5pMdC1F8dy+XD7Nbj/LTgL8lL/4t3oY=;
	b=p4axPLGvkEuHfBYMi1wSdPsGt01t+202JQVK0zwYVnUikJ8xsuBS0RGfhfsOP2rGhD
	vpirqjXW4/NO9vbt83x+5MKDBeqrKULzogQkOW14/uu4Rfk1ZUcdKX+hxi/hdZ2DCCfY
	SMPFp4MwW4LOm6r9PrgxoehzwJgCmH6COlYGbZh4upAuRn1iwNWPcDUxrS+lZcBbyzhl
	TQ+iRI+NKq0BRdcRWqDc91iiI7tG0Ttho4kykukCxsoB2Fd3pnMsnCaIkiPjXnDii2Mv
	h1u8pQQkCF/40/p+DvQ90ZC4k2/AeCYbF48QvbXP5XX9k+d2j+o2xNMm3oOPkqyhOG9G
	np+w==
X-Gm-Message-State: APzg51B9m+XwsY0QFkvzRRwF1blp4x9pzDgbyFfsWJhalI3TqztKwT4k
	L0fKGOVD38kAFJUrvvAmUWdk30YrbGl1GQ==
X-Google-Smtp-Source: ANB0Vda25sKaZJDJYkCRhTC5VGRHts6PJQn7l8uDUTH5RnO9l3vLVdAQlMhSW1qU4k3p1ot2KQbSdg==
X-Received: by 2002:aca:fd4f:: with SMTP id
	b76-v6mr11267811oii.307.1535335500602; 
	Sun, 26 Aug 2018 19:05:00 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	e143-v6sm31683674oic.56.2018.08.26.19.04.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 19:04:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id l82-v6so19025111oih.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 19:04:59 -0700 (PDT)
X-Received: by 2002:aca:4bd7:: with SMTP id
	y206-v6mr10132221oia.41.1535335499049; 
	Sun, 26 Aug 2018 19:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
	<bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
	<CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
	<0f31c417-75ef-fdd4-925f-de320a778275@windriver.com>
	<46251E21CF6D2D45A2D672A9B36E9FF34EC18912@fmsmsx104.amr.corp.intel.com>
	<7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A4B2F@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A4B2F@ALA-MBD.corp.ad.wrs.com>
Date: Sun, 26 Aug 2018 23:04:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoiejC--zVT=rCoT02emZ687eAxb8ZhZjcvCuNa+aBkTQ@mail.gmail.com>
Message-ID: <CAP9ODKoiejC--zVT=rCoT02emZ687eAxb8ZhZjcvCuNa+aBkTQ@mail.gmail.com>
To: yang.wang@windriver.com
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	jair.de.jesus.gonzalez.plascencia@intel.com
Subject: Re: [RFC] Yocto Project Bug 12372 - Automate the execution of pTest with LAVA
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
X-List-Received-Date: Mon, 27 Aug 2018 02:05:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 24, 2018 at 11:23 AM Wang, Yang (Young)
<yang.wang@windriver.com> wrote:
> I see some good feedback from people mentioned they are working on similar solutions and should come out soon. We will continuously work on this ticket.

Did you consider using labgrid? It has a lot in common in current
infra we use in OEQA (ptest and like) and has nice capabilities to be
used locally and remotely.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

