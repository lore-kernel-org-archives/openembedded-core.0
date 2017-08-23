Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id E0C6D78208
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 11:46:26 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id g77so6216374lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w6x+i3ktbgIgK+924bsEn1MdMWP/5d46GOGtvIdKF3k=;
	b=JQQ/fBjDTpB4UYhJ8EGH3cLSMhTs46ZU4K054gFn+XbJVpvNufdHNhPClf+3An9KhZ
	p9r6WpEilKxUnWzdadjx1xmS/ZEdVhYTihZHHug/75uz6FnpiFv0UOQkpk06+6thjZgp
	hPPC2lWjVEXkhbwFqVGXKNJiZfXjthkKhHBMUkpSVvfYZQsSBTkQbuo687Nh28JI4u8k
	5lN+7fGAZgYg+xsj0XybWvu87h/La80fQGKIEkNQTH7zCN4lLEBZna0nMr5ka626Q3ub
	H4oRKX+vxhIE/P6XXAiCQjiTyRg78zyRx59DixRAWU8q9nnm9uzXK/OQF4SncVyTwgWG
	qM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w6x+i3ktbgIgK+924bsEn1MdMWP/5d46GOGtvIdKF3k=;
	b=Lgm0UnTEWBMr3n7exzQSiTscH4OxPNeIyYVnji8rvRnHFtgbAAHUm8PJXsFV2uOLbj
	h1aZOB7XZkhpcPCbtIV+i2gfLBGzTfuvBcufqwyUnBs/5iFHMTiyfbFk1kVBOs3QM92W
	n8foRz3tnlcCxAsqxs4lqwSWcuKMBTRTz+AiuJb2JmjrLHy9xb+NqzeXcoMv1ewAlB3h
	zj56YY2X3TMuP8wUG7a0T6ImwUOqwxwnzy1ggYzxiVoKmS8+Ttk6uRiZEWovaO/eo6dF
	gQv8nSv2QgF+ui0HHdyFpMpikbInEJMA1tsZr39isHyb6WQVAjn+XqqbLuvC5TrEQlmI
	oTIg==
X-Gm-Message-State: AHYfb5jbFhWnJbuDMYgAnbPnJ+XWRBkz9q4eyaEK1Y0bArCWz85nM+IT
	MkP4meDlSm9iNR7hXssH/w==
X-Received: by 10.25.17.93 with SMTP id g90mr733496lfi.222.1503488787544;
	Wed, 23 Aug 2017 04:46:27 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	g25sm230848ljd.25.2017.08.23.04.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 04:46:26 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 13:46:02 +0200
Message-Id: <1503488763-1554-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497880906-18170-2-git-send-email-kristian.amlie@mender.io>
References: <1497880906-18170-2-git-send-email-kristian.amlie@mender.io>
Subject: Re: do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 11:46:27 -0000


Ping, third rebase now! This is related to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11688.

-- 
Kristian

