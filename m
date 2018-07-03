Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F71177D01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:42:12 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id d189-v6so3451558oib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=S9fFGHOe8riVheyzNSz7b0CCObAD49h73DenYZKcpF8=;
	b=EhhHcxYgvGETSTX6FUCnnpCUYQKXODwc/gJh43SNu6mjJ7Qq9N+TVdNBKWAGR/8wrT
	0nGixM70FBQ+WdZig1gK7RX2zQOYTD3yMUJrrJKdu/POOvDcu1Ss/ihx8ugafx1VuUTW
	ahE9PRbGg/T5hbWBfIXpoJl/h5IoFm1zAe6yIv/XxzxOPe/G7wJbVqqRjmE/BBjruNyM
	7ndkCPNJwiqcWBDtDXihBHf9NLewdA9LAFlmsNFxtbmDDwXRF2I6zVHPKFdxMFZFOF4m
	3OhTn+dvVh+ixmUJ+D7juBPcw6RjfryMwPnFooOv4gVBN1GVL6CKpdSNZOLxIgOCP1xp
	m0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=S9fFGHOe8riVheyzNSz7b0CCObAD49h73DenYZKcpF8=;
	b=fRrt200EudYe9nb7vBSVhojIqvkPjxXfGm6k2RbwPsksktAhPBn7dRFHunSivhCvju
	zPPmttSW/rviFja9mSojO16//c+rVLAswL/Zmoyo/RjrMTr7RUGishkwOKL3FtNlh6wb
	lbzFq2Ir/z69SKv6/NSHeLhAnfb6RdhztOVHkf0dK164Bv57B5fisNzR0cKwh3ypKT8F
	Wtn6L65nSpfAaRn5oq+TbGgypFU6IGNJg3uU5S3Xw4+PbAf3WSugj8Um178bATd2i+w9
	UHIQXAVHrZliJZZWTJByX9kSzyCoUm6dmP2nzTh5wS/2NgCVQoQbpWFaaEgjBk+u+0rX
	lesQ==
X-Gm-Message-State: APt69E0K3hhOfGFf76GyjNm7drKi1/rpZpktYJweDFKaBaE4ewFOSiU9
	Pjq1IiwtPbTt0ZJiXn+URN676CE7
X-Google-Smtp-Source: AAOMgpeanrW8bIm26eWPlJHAtiftGM+WbMncGqv+eACyXPLPWJvII02Ry/O5tqbMRAKxzowxhhdJyw==
X-Received: by 2002:aca:5e07:: with SMTP id
	s7-v6mr21084975oib.353.1530621733096; 
	Tue, 03 Jul 2018 05:42:13 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	j29-v6sm423064oth.60.2018.07.03.05.42.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 05:42:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id m2-v6so3427066oim.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:42:11 -0700 (PDT)
X-Received: by 2002:aca:494b:: with SMTP id
	w72-v6mr16432757oia.293.1530621731113; 
	Tue, 03 Jul 2018 05:42:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 05:42:10 -0700 (PDT)
In-Reply-To: <6e8cddd54499f46e091ddc2387d499c2138f81b4.1530591075.git.liezhi.yang@windriver.com>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
	<6e8cddd54499f46e091ddc2387d499c2138f81b4.1530591075.git.liezhi.yang@windriver.com>
Date: Tue, 3 Jul 2018 09:42:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo-C1qEh0-6=8cG37g9ZXTUicZUBKj6dLEM9o=W7nxd_g@mail.gmail.com>
Message-ID: <CAP9ODKo-C1qEh0-6=8cG37g9ZXTUicZUBKj6dLEM9o=W7nxd_g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] git: 2.16.1 -> 2.17.0
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
X-List-Received-Date: Tue, 03 Jul 2018 12:42:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 3, 2018 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> * Removed code for "${D}${exec_prefix}/lib/perl-native/perl" since there is no
>   such a directory now.
> * Fixed perl related code.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Latest release is 2.18.0, it makes sense to upgrade to it except if
there is a reason to avoid it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

