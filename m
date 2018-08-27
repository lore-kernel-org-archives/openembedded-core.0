Return-Path: <tomohiro.komagata.aj@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9B078EEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:55:41 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id m3-v6so6721503pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Kk596+kvbwImsqKccUXNXd42CoB3kkz6e5Y9HhlMJq0=;
	b=KdN4IXHUttIFE62uKuxkAlsP6FgwXMhid0Z0V4LHozQcJp0GukwkhCo2xwKqRbcPul
	J06lYJfarWmEsbNakYzoW3He9SFjbEBSM8MSzF3Nqf4cp1UwVimAYyqmhKxYpmDUEi7I
	dR1RWqR3OszXB/uWqLfw2BLJuJFNjE21/pik2e88pniQos84vjhyvqvLs7PUE3W5weM9
	JxiiUJ4EmRgJ1b8oX4iDbVOj5pew6YIt8rfEUREoDdzeP2aftEmhVOmGZljbcLfBegtn
	q59DuUERy+MUC7k+dMEE72bE/Xp+EFLOa2MqdqTmXvCIOdlsY4b2QQFggF6l3x52PC22
	QFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kk596+kvbwImsqKccUXNXd42CoB3kkz6e5Y9HhlMJq0=;
	b=deBhCaV3X0QQXpYeZ2mnBumVuidtfDvdnPkpAyrXwyLECaAgHHREemUoUPK6awj/k0
	Sc5C9m8Q4kwruX9D+zec+f/eaxdNyVrsVBtzBFDegUn8O+6VeGKrT64R53AOMtelLjDN
	Lg92bbSvfCp4VPvEN2rVkhQ5DYWbYsnwhYhaj9oO9TSEYyZ6N/nFpZWgblvi4yJnaY+A
	FdsN81AIA8j4ZdILl9qSe3jsRSSHBK5YYLwSwFJhDF9WljacRxOyk35GDJl/UXd8yzt9
	HlRByq+j3oiBr3URr3H7tOYm7mBebKiYbRkQT4MVjLfjlsYRFNhG4A7rXDwjaDFuYjvq
	jwJA==
X-Gm-Message-State: APzg51CWOeD8dLW0cCHUO5EElvEDX36uoI9LmNLdiRd3OqXhbsF6WkbZ
	xOvWeYCs4DDD5vyDgMaIs+M=
X-Google-Smtp-Source: ANB0VdZqdV+xw8nAyF5g4ORN0MNNyJ1uxeT5DoJg89huob2kyvjinp1HQ4iEvo+4xt+g5Wx98vDkrA==
X-Received: by 2002:a62:9349:: with SMTP id
	b70-v6mr15113900pfe.193.1535385343356; 
	Mon, 27 Aug 2018 08:55:43 -0700 (PDT)
Received: from ?IPv6:240b:12:4260:6a00:50ac:d6c3:482a:6007?
	([240b:12:4260:6a00:50ac:d6c3:482a:6007])
	by smtp.gmail.com with ESMTPSA id
	g184-v6sm24852816pgc.22.2018.08.27.08.55.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 08:55:42 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Tom King <ka6sox@gmail.com>
References: <6da833d1-a532-779e-8116-cb8b950bc8aa@gmail.com>
	<CA+chaQd0nDr4x1AdJW=4AGDSeRDA03_svGyA+TsL+poYSgzJkw@mail.gmail.com>
From: Tomohiro Komagata <tomohiro.komagata.aj@gmail.com>
Message-ID: <70c54c3b-d6e4-4307-61e4-a4fa42ade473@gmail.com>
Date: Tue, 28 Aug 2018 00:55:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQd0nDr4x1AdJW=4AGDSeRDA03_svGyA+TsL+poYSgzJkw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Q&A] "http://sources.openembedded.org" is unavailable
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
X-List-Received-Date: Mon, 27 Aug 2018 15:55:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Thanks!
Today, I could confirm that the server is available.

On 2018/08/25 18:15, Martin Jansa wrote:
> The server which is hosting this is I believe in transit and should be back online in couple days.
> 
> On Sat, Aug 25, 2018 at 10:50 AM Tomohiro Komagata <tomohiro.komagata.aj@gmail.com <mailto:tomohiro.komagata.aj@gmail.com>> wrote:
> 
>     Hi all,
> 
>     In this week, I have failed to bitbake,
>     because "http://sources.openembedded.org" is unavailable and it occurs the fetch error.
> 
>     Does anyone have any information ?
>     When will its server be available ?
> 
>     Best regards,
>     　T.Komagata
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

