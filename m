Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3D939731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 12:48:09 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id u13so6412083uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=DPINMFPMSnibjSyMJgAHk50EV66XIbKZl6ljQu8rutU=;
	b=p/PL2//LM/4VmIAKr9tXAHGiki0FDvOAt1iWglXMWQofJqingvxU23Ln9H18o/O8mk
	sdwEhANaFI2+ttIJSDy2CTcuSDskpQZdZG2n+vuh+6Y1ozM+by3GyPl/MXssI7C2CA6J
	J1SVwl9HdRzrppqsdjE05g6YWqlMKkSOuynLAlZQgXnZtnkqXlbnO6/j1btciyC6ElLY
	qL+HT5A0os3cefFdBQkDPBpy+/WBswa9quaXOzO7ndGNICc7cLSBKGC2Cy1h5nDAwBeA
	aQQFsgjV3hyKvWZJgn9PcVrMmKniuhERtdQvtJZ6zvZqmtMuiiX6r/m1e4VauOfHHNVm
	ZQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=DPINMFPMSnibjSyMJgAHk50EV66XIbKZl6ljQu8rutU=;
	b=OWXg1PO8yIlJy+g7Qp49MHWKeSOoMKKRJ8sRhH8+CKpAtNpBfYBGMZ+sPMov35v2VK
	OLNYjlNz5MrSekCMOHEqiVvccZEQIjhhXfOXd2tQOhZy07YAihJhNpUJxuCztV3fLauS
	lW+xrTQCMJR9hTYVJCO/LZgnw9xFtXw4iaujbdz/zSQ+ypRoJzjei0y8I0wfpUeQDgJe
	+97KNq42id/6i0x26Mkiu+/sqz53UWf3EyWUZnQ+nAetMKj0O0K76+wX8+drAoPY315y
	8WdpDBT2cqcIuLOZnSZIZ3QKCSSHiIMEHI7yfRzZZyi3pMerioc0UQHEYYrDqmiYRfqm
	K8mQ==
X-Gm-Message-State: AEkooutYgQ0aD26rtvsgn4nmzZg3fJ9zlB72kvT5ToJumyQy9meRsAA5WEdDDcYzMOSaow==
X-Received: by 10.176.66.197 with SMTP id j63mr5538529uaj.76.1471351689822;
	Tue, 16 Aug 2016 05:48:09 -0700 (PDT)
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com.
	[209.85.217.180])
	by smtp.gmail.com with ESMTPSA id 5sm5476325uaf.26.2016.08.16.05.48.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 05:48:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f180.google.com with SMTP id 74so119409684uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 05:48:08 -0700 (PDT)
X-Received: by 10.31.94.73 with SMTP id s70mr16798944vkb.78.1471351688144;
	Tue, 16 Aug 2016 05:48:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Tue, 16 Aug 2016 05:48:07 -0700 (PDT)
In-Reply-To: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Date: Tue, 16 Aug 2016 09:48:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
Message-ID: <CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 12:48:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 9, 2016 at 2:15 PM, Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> This patch enabled out-of-tree builds for u-boot. This also helps building
> u-boot using EXTERNALSRC flow
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

It seems to have mixed changes; why you are changing the install behavior?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

