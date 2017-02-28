Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3828A60053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 18:00:37 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 203so83423186ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Yq9czT44UqOcWPuscMt1GQJ/pOUemPn6KyKiB6yoznI=;
	b=Rutej8CsnaB2phzhyObr2rMi+oxHcW6A6/vY5Xs2Nf/QEN9RrP34d0f3p2RhWyCNpu
	AWr05YTULJfABW6RPnk4Jona3OvDjTX7HHpLkTAOQNFx3x8BJwTFTI0L1ZkX5+yPqWfR
	aGfzgMQaOqNApcpFlAQ7eteEjX6NrSaHfjOqsiNt/qJ1nQn0LBrj5jGfvz6B6X1YEQHb
	N4KCG0q2z48/3AKiywqpqcV3HHq67UrShigZ6sNoL65InHZLwva8uS6b2cptcd+2fYpH
	UwJaYWfl4pb1D5RulePi98HKQlERZO8Hl5J83fPmXR51EAIZLnuMfBjm/dyt3c0UB9vj
	OyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Yq9czT44UqOcWPuscMt1GQJ/pOUemPn6KyKiB6yoznI=;
	b=i1BwEdkpxTG5XTS2E0wpkgrtzno5QQwnTK8Itl74z1432nUx8KNJY/yCVbPEagRBzs
	CH1Qy8kJnm/Lw73yoGF5txAT9l6vxdCfsz8N0lI2jMkbCKC5+JbB81Pvi12K6K1uVEgb
	vAMAqWYv2kn3vPQa7v6fdgC+fONLWZLbq+JQ3jSn42b1wvUhh6fJCZAJQhzRN0VLF/iR
	QXrw1rcToxs1i0cq5qg634+PSYb+SNCa8hTWrS/ZwYoIRsv1ttDAAHq0zaBp15jfKSF4
	ho2nWio3tgJCIjWSt0/XFVx82PY3arOkJ7Q8rrJ1W02uaK2QEGlNNnUbHXXzQv6gIe62
	YDTQ==
X-Gm-Message-State: AMke39kCeG1p+wnhjqlBPVzTW6kYxlnct4mLZ99YOBDd/n43TIRxCjL/0w5dbvmjAS8aew==
X-Received: by 10.36.3.68 with SMTP id e65mr21152128ite.50.1488304838824;
	Tue, 28 Feb 2017 10:00:38 -0800 (PST)
Received: from linux-uys3 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	i96sm1065603iod.33.2017.02.28.10.00.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 10:00:38 -0800 (PST)
Date: Tue, 28 Feb 2017 13:00:36 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170228180036.GB16277@linux-uys3>
References: <20170228045004.GA5913@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20170228045004.GA5913@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: npm thoughts
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
X-List-Received-Date: Tue, 28 Feb 2017 18:00:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Ideally "devtool add ..." wouldn't choke and crash when it encounters a
LICENSE string it doesn't understand. When parsing license strings from random
places on The Internet it's inevitable odd things will come up :-)

