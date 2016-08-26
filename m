Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA5B73199
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:38:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so10790286wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H5TqhfgysNSiJjT5701ScCME2TTV7BkDENE8FkdQedc=;
	b=Ntih5Qc8dFLjBl5lG9XBRQSt8OzHahOtvOOTCthAEcXXmRvpbDczCTXjt0hnN+5Foh
	S8Y0eGiQG8t5Pk8JYlC4VfzD7mQiU7ZzRPerfeNRgWG+8vPHRpzyrZxow2CFSAjC0Ard
	zl+0J10EEEU5eOFmhKogqCVeDewWBHTgm1qTOXOwvbSVn716qfLnfZrkmHnqXAef8P6/
	fDI4++mPMj6XJXEhYpEVJKlsq/nOdgXFhZ9WR/6c2xOWujoOUN75/NgVwLfaNX6EQXJF
	9GBZzKIAEC/F4pQnbhwcP62bmkRnNp1/yJddqhW/5AMRYLGp6Bq/896Z0V0UB9vuhk2j
	qFSA==
X-Gm-Message-State: AE9vXwOpqlQPnShsEs1ODewiFtDhW4kROiVvkSXHTUWTrGhlWtwX9HmrKOaJ1Kb69S/uiQ==
X-Received: by 10.194.27.202 with SMTP id v10mr2907072wjg.140.1472207938516;
	Fri, 26 Aug 2016 03:38:58 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	q137sm43052506wmd.19.2016.08.26.03.38.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Aug 2016 03:38:57 -0700 (PDT)
Message-ID: <1472207936.19220.11.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 11:38:56 +0100
In-Reply-To: <20160818075626.15973-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 0/3] fixing kernel module cross-recipe dependency
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
X-List-Received-Date: Fri, 26 Aug 2016 10:39:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Do, 2016-08-18 at 08:56 +0100, André Draszik wrote:
> In a situation where multiple external kernel modules are built
> from multiple independent recipes, we currently don't generate
> correct runtime dependencies of the packages created.
> 
> This (small) series of patches attempts to address this.

Is there anything wrong with these patches?


Cheers,
Andre'


