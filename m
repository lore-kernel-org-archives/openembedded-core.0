Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4B93C615E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 18:50:29 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id d62so3532226oia.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 10:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=SLzoYDFDcK49i2KZtg1Qw9Up2hYKt9CLPcz601k/aWM=;
	b=AErEuB+/08lfYbVTbx6j3IMV007Z1+5igyLFRR+kC+OaKgpkcldoTjkoXo4geQuJv0
	QxkBzlXwjduRPxnIYR0+AYeOE7y8hCBBMWiW9bF+k5cyjtunFoVYaCsEQY7NbN8an+V2
	0sDg7E2tFBBK12+cPGlYpUj0VOhnz0H6ipu6GLMYAvWhAXKHdmEbDvwUeopHI9TvMWJY
	fuOzM8Ajku0uliZezlYJ+JSEJlt7P81xFqO6nhypKTSFrnNjpGktGK/TuSZNcD2rjVRS
	XNZN28InomXM9uT8u1rq8DH20FoshrNaRIuy21uw/pjl3RjGLycH85gVr4OOQhmwkFzh
	lB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SLzoYDFDcK49i2KZtg1Qw9Up2hYKt9CLPcz601k/aWM=;
	b=aFiwJaPxxLasA7x1ZYM8PUZ2/Yluczcd6ycS6XqK+ma8LEvUTGryzK+GJj9p9eTYWf
	lzp3ArDIo454lBZgkfqRiTO34YZ1OV0FNPgghWmzZ0d/qd3mc5glPSO2p17P3qikQpZB
	e6mgu7aK/EjHPg3gVCHyNudcFHR8gGVB4mzpuRn+jeY2x9t8S+4U0FuQ3f3p7PmV/+2c
	VLYGltpCiWvTttzrEHWGE1EKl6WjSttEkepw9gfBNWSaU2CM+LoyEO71Semq5lP/THtv
	qvAKp3pKHXgAZSE/x59RfonEmE/eTYy+8iUlxwWJ6BMZN9psdNSS0NpQ+kBKjMlflpe+
	wRTQ==
X-Gm-Message-State: ANhLgQ2R29Eg17mtO6y4LsincLZI5JlU+ex0mo3jX8f0ojJSc37z9dzU
	sctGX0LfMW/nKW9xv1qiSvRXWRIw9LI=
X-Google-Smtp-Source: ADFU+vtKfS0CZ6xneqW0yBBd16APvuOubVLopUKGBTsMvWeWHF8nSKe0YJS8cT4UwgumWjTAT1oBTw==
X-Received: by 2002:a05:6808:a08:: with SMTP id
	n8mr3710046oij.91.1583520629677; 
	Fri, 06 Mar 2020 10:50:29 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3?
	([2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3])
	by smtp.gmail.com with ESMTPSA id s128sm106957oia.4.2020.03.06.10.48.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 10:49:10 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
References: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
Message-ID: <30ccd839-f804-881e-cec8-e667961e8c04@mvista.com>
Date: Fri, 6 Mar 2020 10:48:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
Subject: Re: Multilib conflicts in man pages.
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
X-List-Received-Date: Fri, 06 Mar 2020 18:50:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Anyone have a thought?

On 3/3/2020 3:22 PM, Jeremy Puhlman wrote:
> Is there a preferred method in oe-core for dealing with man pages that 
> conflict due to differences
> in multilib pathing.
>
> For example an application lives in /usr/lib/foo/bar for one abi but 
> /usr/lib64/foo/bar in another, and
> that kind of information is encoded in to the man pages.
>
> Some things i have seen done in the past, is move the man pages under 
> /user/share/man/${PN} or
> use something like mutlilib script to deal with it.
>
> I am just curious if there is a canned, preferred way the project 
> handles those or wants to handle them?
>
> xinit, xserver-org, and groff each exhibit  these issues.
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


