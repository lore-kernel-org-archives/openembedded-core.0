Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E59178E90
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:22:09 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id h79-v6so15299506oig.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2DoxRyr+O22SkXwo4uy7q1vCc7YJKMDS/bc8Bf2QAGQ=;
	b=lI6wGnyLWiydkSzZWNpjHYiiQF9ZhRqSK9HfjQYlP6Gp36KYuzyPAKK21oWpGfMAo4
	mkagWWSzT0Jo0odaeLOVeCP4lN0e80YvynsG6NK4K9290gu9+QixMtAQOL9Q26ZMpUFw
	VdaBW5XLFxhkZP0oBPIRBc0wVWImyMJk0lPhIsIGOJbbgS3AQ5JrJCk4pOdVNS8vF44/
	cQHH6JPk+dvxc4q4Vs+wyoMUhEoistyYfhlxbzBK6P7BreXFYC8ip7SzDUc+bqVuOjSN
	yMuN54Zsb5PmP+SVFHawipB3QoJRpY8jKpQqjVFC4DAXY8kVukVLYLgrsl2YoaUew4dP
	3Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2DoxRyr+O22SkXwo4uy7q1vCc7YJKMDS/bc8Bf2QAGQ=;
	b=uctMT0ZnHwCh6xpUToGH/2znjoChZIzzxwjv12yi48ScgKN1aD989xDUTKtn1HF9Aw
	1GSOmooy9N0LVSW/8DwcjPjburr1UAHSaUjLbXh0n+vbbzGiUp3Cc6I6Z6TZT+kdnOBJ
	xEzy/KbMDnWZSAYbeloHqDCk2jmclYBzKVBjacbLfwlmA4utMUE6TY90NJos9At5rXvK
	J3XYY8bEijN1HrpxiomAAQQhCeufbMkgXnKy+WFbF1Ttx1giwZ9DaPHosx2eHbVwIhY1
	6twwhyQkBgbqIqsEF85FskD//y72HJRPh5a81Eo9i3K4ysHhQ+8HmoYbl6wqeMtKnAhS
	q8Kw==
X-Gm-Message-State: APt69E3olmSRv5CSd7g2H4LQTTtTWtZghJe4bh9BG4s85zkb2sfzpGsX
	KKoGCOnsP7R22CWCVTypukECvM65czRQJ+0nYG0=
X-Google-Smtp-Source: ADUXVKIP1/Q3SGEzn+fhLN7Ic0xKDJrWQhZ5V+hFoxbwTJUWsPTOyKIe7q4SKyr/q2fRGhhSLtyOssDOfZSabMZJjTc=
X-Received: by 2002:aca:47cb:: with SMTP id
	u194-v6mr6541396oia.45.1528615330439; 
	Sun, 10 Jun 2018 00:22:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Sun, 10 Jun 2018 00:22:10
	-0700 (PDT)
In-Reply-To: <1528574447-21755-3-git-send-email-akuster808@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
	<1528574447-21755-3-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Jun 2018 10:22:10 +0300
Message-ID: <CANNYZj8NQb4FQb+pUfgS9koapFfdfQyqFWoC4o7v1yDwKuw=Mw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] selftest: add cmake oeqa portion
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
X-List-Received-Date: Sun, 10 Jun 2018 07:22:09 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-09 23:00 GMT+03:00 Armin Kuster <akuster808@gmail.com>:
> +        bitbake("core-image-minimal")

This shouldn't be needed as the test doesn't do anything with the image.

Generally, when writing selftests please do pay attention to making
them as fast as possible, as the full selftest run already takes 3-4
hours even on the powerful machine (the AB for instance), and thus is
on the critical path for merging things in master.

Alex

