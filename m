Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3724477D08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 18:02:14 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u205so7660957ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CE6LJ+fO3yHAzd3Vmahtqk4GreGo/rNuuuD0bXUqee8=;
	b=Rn0X31snb4wr4GDrXQa+10ZqORymsS37lFRlFK1GVdJrVb+lwvbgYqCKym0Q0WaBbF
	eOSRToDPRfovN2P/TMOZAqEYG99bvvRYNScCerYOfRHL4MpilfmGGC0VmCwy4jRKf4hm
	wAz0jJM3ojF03OK4HRh6hnfOVBJ3/gQpH2p2jAnt9uUdrYQ/4zMNCCeuXp7z8jCyL6tP
	+NNRj73DZd6kFUhD3DwpJmSnphCbQ6UiQzQD6O4wHYwaZ3WWqHLhWKTqxr3nnFIrx764
	B/1HqmHXNCXC+FKf/kv5CvGURKntNhc96s7FbOwdcMa66OwAV4vgpZvU/JFtx2blA11J
	L23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CE6LJ+fO3yHAzd3Vmahtqk4GreGo/rNuuuD0bXUqee8=;
	b=fv19wJruANaKwQd2qwhfjFCr9dMrjYgZpNX++eWZTzz0ebFgR58nt+qVvK4c1Z8QOg
	ui5odQHhdLZZh5Ho9QKf9Rz8tFH3AX1JA9VhgPwTtc73P+22654KtDmoNPcHucqYFm1U
	p2bo9mlb1LITZlVGZa+VtCXVupEbu5dDe8f2K+wBRPQANduQZPMQO+fDoryDJuVb/X5j
	y/7FBIMKwiJC7hhzwjvEJAB2p/yFTXh/gkJ264Z00tBF2nSp/mC530dNhyMf7Pj2q9yi
	CKhOHIhGuig5WwkQgxaXTC3qvoUu8ivRzwutjXojb6XbR2uVuEjdPEf0unM2MW584xIC
	r4FA==
X-Gm-Message-State: AHPjjUgGvahstCFQS+tX6KfIx9kmvjkwR2D4VetruqdQfTRR7lNKTmUl
	Fz44s9hL4s1amC0aBOrsbsDVArtr
X-Received: by 10.129.71.133 with SMTP id u127mr7429040ywa.86.1506448935796;
	Tue, 26 Sep 2017 11:02:15 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	b11sm3630020ywc.72.2017.09.26.11.02.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 11:02:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id i128so13139343oih.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:02:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDeh60RL7KmHFVVYA7lKdlDEyt85OSj+kaxZDxuFr1BY3BBPVdrTKjrGfcUE4vyOCayUqcDDvo0FGuJqOxN/7Q=
X-Received: by 10.202.184.69 with SMTP id i66mr12843632oif.241.1506448933245; 
	Tue, 26 Sep 2017 11:02:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 26 Sep 2017 11:02:12 -0700 (PDT)
In-Reply-To: <CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
References: <20170918134356.16124-1-willn@resin.io>
	<CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
Date: Tue, 26 Sep 2017 15:02:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo+4WEsjPNLp7+t4nnTKYVTRO=EeyM0ExduTDVmB4kfsg@mail.gmail.com>
Message-ID: <CAP9ODKo+4WEsjPNLp7+t4nnTKYVTRO=EeyM0ExduTDVmB4kfsg@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Tue, 26 Sep 2017 18:02:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 1:36 PM, Will Newton <will.newton@gmail.com> wrote:
> Is this change ok for the stable branch?

Fine with me.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

