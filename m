Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0D378249
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:32:55 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id h127so43709365ywf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CHqRFfHbyO7lJo1QxF6T6W+n6rz7XiTwc2L/TYYp8kQ=;
	b=np3RgnX46JTD0+GG2aOJuNEn/er2WBGFRJ+7yOMwkDlgVTEHl2T1CXFVNh72s3e2Lb
	vXd6gIYmGlWwk+OGZGlJcM2t5cXGTPr7XuJM9wrpdnAZx930lFLxalXOLnFGjRa+t78L
	V6bdXRpx/2zcJbuV6tR6cjMjDm03j6jWur1GcKHHhDJm/7BR9947t+0zUq9DqYv73TIv
	U7l9c3CMCpsmaFUffsgcP9V7IMp8cBEy+2xZV10v0/P1s5h/BTVzZOtAVXQ0bg0EWm+m
	0KaVExHsxWisl3fkEAzfDKL6hQ9kiv+l6rWS3B3lAajXjGY/LHbf1ujTyuqwDrTWwjzJ
	AORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CHqRFfHbyO7lJo1QxF6T6W+n6rz7XiTwc2L/TYYp8kQ=;
	b=LXoqU9NrpBEgWj+7BliF386c0VQA6nbd/6G46k/JGPTFlMwXr80VFP2dtKUw6eu8sF
	bzVy5ZIfaPyG2NsqzMas2LzXCajJnlrP2FU5XgKIqB6/5K0jI2BMCnWF3+MsFCiSEJbc
	sYgMWgSXdIoALVRT7QHK2fmbJbD9/Oz7YYzbuew99s0LAqq1sXFjA9MFPVif7ksC4lom
	zIHypb6AXNBlDDH56p7srqHF9MYAILkw4m4GNxFEh0IVcqwpb6vlTVU+tEenYQdKHuRO
	1cR46lSBIQcljzHp3dBcP9NikVMfrHYoTRiosQ93TGa3TRt931oH0jmF5QiOzY5k4p5g
	NqOw==
X-Gm-Message-State: AHYfb5ie9vP0CZ4VyQvvNEwjUCCJhkogq0Wq3T0rAtBW+UFUv/J2zefP
	1M65+w11EYOT1rLZt2W39ktFOotzYO+5QTQ=
X-Received: by 10.13.228.193 with SMTP id n184mr1269565ywe.198.1503423176662; 
	Tue, 22 Aug 2017 10:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.66.145 with HTTP; Tue, 22 Aug 2017 10:32:56 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 22 Aug 2017 13:32:56 -0400
Message-ID: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Tue, 22 Aug 2017 17:32:56 -0000
Content-Type: text/plain; charset="UTF-8"

Is anyone else seeing insanely long (never ending?) do_install times
for adwaita-icon-theme? The other day I manually killed a jenkins jobs
still running after 3 days waiting for this recipe's do_install.

This morning I started a job manually and it's currently stuck in

    0: adwaita-icon-theme-3.24.0-r0 do_install - 9241s (pid 25320)

I'm pretty sure it's not going to end without manual intervention.

These aren't the first/only times I've seen this issue, they're just
the most recent. It doesn't happen often, but enough to be noticeable.

