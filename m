Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7035878643
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:11:13 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id s62so3028546ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Vqv/F8JrVcpHFsDVEMNst15gKxOixnr1gFPbIx/2MnQ=;
	b=A7b5aHgl2VHM6ABoHsVBMXzkEebUoc4VBR0lh+bUFs1H0qumkfXS63sjXlFreDTHDn
	5oZWei4dqA7eD4/M29TdMRcT55/WYM/mXQ9n+DCkeQG9C74CxCCBdAACYFapWIBa3klb
	DTUX/KK6L25hFFPupA9eFmouourXedouvQrFHURcZCgly3njtVE41vEqvNZe1JBN8n3l
	RyXmkBNNrIWRnOkekVhaCkX2aOf85rvd23sf8Jh19ZeyiDHCNRuFMNitmMt8zF8WDMop
	AV9vgxHov3+m+/rHS3/EZKCZQ0NaXZ/rDA+z30lC5JJ4zZlTkx9QAReOrPfDXwi6EpKG
	JV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Vqv/F8JrVcpHFsDVEMNst15gKxOixnr1gFPbIx/2MnQ=;
	b=cxVKDXMGkfIlftHjZlLNMhDau8qxUsxng/ficbj5fENxxdRDZ+2f0s9HlbcTN1tx+0
	nDqvVLdRyHRbokmw6kSYmmGDgj6h9Wxq1wEthzQIlDpb6u7BU+Ec7hgB+bRoWeCyjuav
	SoEGym4M5DJ4te8z5pTR9bFiKZXhdtL90wTMbW4lcaD3qB41nzQ/zPT4435CbeW+MXQ3
	bj8XnlWvQKChdpjn/X8uH3a+Ifmhdq6ocB+L8kFSVdi/7pD/0EZZDpkl62uGjNT8s9bp
	3sU3Ras172bkVYqfqZnI2oOSCiO5nlh/AdmhKOQZ0rwIJtHu4poJV9bFqVSifPmtaIhr
	JZWg==
X-Gm-Message-State: AHPjjUg7lF2yv/2zh2C5s8ra8t2XB9Yk0Vo74Z0GQsD42z12hIEnX4OA
	5NkE4ZWLrTIPw8N/k30=
X-Received: by 10.37.102.2 with SMTP id a2mr16570188ybc.141.1505333474492;
	Wed, 13 Sep 2017 13:11:14 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176]) by smtp.gmail.com with ESMTPSA id
	y186sm1669279ywc.71.2017.09.13.13.11.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 13:11:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f176.google.com with SMTP id j141so7706743ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:11:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDoKTJp3i/7Glb1rnUkLfFsZy/QzJ46rxGHKKeKH6b9E9RZAs7O/Qgv2erLwZTUlZe6guxJk37Aq/wLsfv80cQ=
X-Received: by 10.202.186.7 with SMTP id k7mr5256131oif.25.1505333472163; Wed,
	13 Sep 2017 13:11:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Wed, 13 Sep 2017 13:11:11 -0700 (PDT)
In-Reply-To: <26a8ac54-41bc-d74b-6545-5c13f67296d5@gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<26a8ac54-41bc-d74b-6545-5c13f67296d5@gmail.com>
Date: Wed, 13 Sep 2017 17:11:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpmqtGUt7jiqww6=9QcN_0Ou2Dc+THAqbYH6F-KsW45YQ@mail.gmail.com>
Message-ID: <CAP9ODKpmqtGUt7jiqww6=9QcN_0Ou2Dc+THAqbYH6F-KsW45YQ@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Wed, 13 Sep 2017 20:11:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 5:05 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
...
> What is the status of those dangling patches ? They were apparently
> posted, but didn't make it into the last two (?) releases.

I am confused. Are you asking for U-Boot community or OE community?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

