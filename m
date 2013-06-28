Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 13FFE6ADC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:06:04 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id f4so2913801oah.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ccSDNVnPm7PZz15SzU3m5trWC65H6zFdrZGKk8ds9Kg=;
	b=WqALYTcmZMiBXH2bR8f6CeZLHr+QgJz2ZbmFbDWBZM/0A2ByDVUNNcwZ5aXFx4b+RO
	FDAxNK0+bVTx3njSAqPYvKwAu27flPTYgkS7yymZVU7xXCQpE4CznCQGu+9WqwliHQCX
	7olMsw0RMMTfKA8LWtO1W8nfge8xDPdJQrGVO5h2t2D7g9wDf40S4YroOd2PP/T0qt/m
	vlHzYsYmY9Gjolov11Fr0sK+Dapi952IsTtZDy+Sxt9sP79Qf8BVAs7h+Gt81Vkv4u9c
	xRFl5a2r4AlWHXa5RLS3nEV/YSY6y0FV+dqECqCdQpghh/a1ZtXfcczKhLgt2wcjTE9L
	wC2A==
MIME-Version: 1.0
X-Received: by 10.182.205.138 with SMTP id lg10mr7288247obc.6.1372457164530;
	Fri, 28 Jun 2013 15:06:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Fri, 28 Jun 2013 15:06:04 -0700 (PDT)
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Date: Fri, 28 Jun 2013 19:06:04 -0300
X-Google-Sender-Auth: SbWiJINwWp0VqkIrt4q93JcFMZ8
Message-ID: <CAP9ODKqJuwRmyah=LU5zcTccQWZkdfFJvBbQ81VZpooCMbpHbA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Fri, 28 Jun 2013 22:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 28, 2013 at 7:04 AM, Stefan Stanacar
<stefanx.stanacar@intel.com> wrote:
...
> There are some areas for improvement/limitations right now:
>  - a better way of getting the list of installed packages in a image
>  - qemu is started with the -snapshot option, we should create a copy of the original rootfs instead.
>  - when using TEST_SUITES = "auto" there is no dependency at all between tests (rpm would run before ssh test), so better use TEST_SUITES = "ping ssh auto"
>  - better logging and error reporting for qemu problems (runqemu erros, qemu doesn't start, etc)
>  - more helper methods for tests
>  - others I can't think of right now :)

Did you think about adding something like an overidable set of hooks
which starts, setup image and shutdown the machine? This would allow
same framework to be used for real hardware test.

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

