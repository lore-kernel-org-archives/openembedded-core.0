Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 28A646011C;
	Fri, 13 May 2016 13:57:10 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f89so133179796ioi.0;
	Fri, 13 May 2016 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xDBtc+l8a8RIg5sBcv27MuZnS7H8NRJQuYRt+/1PlfA=;
	b=z6dbZ9VjymE+/c5dccu4Cl+msu52D/NiQ071KO0gJrRmNK2J44G0KHmRgFaJJ3Tidh
	e9tA3jrCqYENa1cj54vETiTityl0S3KtTb/QNLXJNtmcbDY2gv661KQ5JnYVnuuW94Kh
	OPn4SGn4AN78X1xptvLZe4TYMjOzU2aSN5V8cySF6Ic0Gk5LM6JJLqfXaVPhpshApihy
	3DwRsIg6YGr5Z4j8zBpyq9pcasb3NaBNzF48W+/eQ7s5m0apCP6lLfyIDGwL22VPiFS8
	a3kZbKXHwqQBbN8AcNiaxCP/tvRgsDVcW5H9BV8MZVX65aNw3mx8g5qvuwMAovjXVJhg
	A19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xDBtc+l8a8RIg5sBcv27MuZnS7H8NRJQuYRt+/1PlfA=;
	b=adH7Fcjsx9+M5RYxxUDRNc3IokaSz2sSFRFPMtdfS/DQBiRqT3A1eJcXM/wFOGpHf+
	/1w537kgDsgKGrVXN3Y6EXXpCICqC/KV+li4Mvpa7dR+SCRbGX910XoVzda+OM/X1ke4
	9rMpofVj01DMMxmtmgBGkQTxzyKqUhbY1xMoMmzr0FBjuwPpB/yH1jdJupUg3mfopi5r
	MHaE7h5pveGWAU47z8oNsHzI8wGNURPocFrnZa4tQ94/KKFp8UjpMYy2dD1cU+UDgx81
	rlISMg00I/VZUlNIlnTMBlbXNK4roooK02jrtjWCOYulVAjWrl+NRMKXwWxQzlS4CeaV
	qzbA==
X-Gm-Message-State: AOPr4FVcrS/UVNRva/ezQ8xoGbTzyM2qiOFdnH7PccHnw8Clcuh81hLprFyQYUVkFAmjFQ==
X-Received: by 10.107.8.19 with SMTP id 19mr12287241ioi.60.1463147831244;
	Fri, 13 May 2016 06:57:11 -0700 (PDT)
Received: from linux-fl6i (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id k16sm999765itb.11.2016.05.13.06.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 May 2016 06:57:10 -0700 (PDT)
Date: Fri, 13 May 2016 09:57:07 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Message-ID: <20160513135707.GA30983@linux-fl6i>
References: <CA+YB3rZCfCiLQEg5Br78ZQ=6QJQiXnh_pGTr0-XFQZFkwniYLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3rZCfCiLQEg5Br78ZQ=6QJQiXnh_pGTr0-XFQZFkwniYLA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Please help edit OEDAM minutes
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
X-List-Received-Date: Fri, 13 May 2016 13:57:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2016-05-12 @ 04:32:01 PM, Jeff Osier-Mixon wrote:
> I admit defeat. I have been "trying to get to" the OEDAM minutes for a
> month and I am clearly not getting to it, so I am now getting out of
> the way. We are crowdsourcing these minutes, because collaborative
> effort is what we do best.
> 
> My raw notes from the meeting are here. If you were present, please
> help edit, fill in gaps, etc.
> 
> https://docs.google.com/document/d/1rPvy-QQkP0Z4a0PGOBkljfzGGzFVWREDz18vZzWyL9s/edit?usp=sharing

Ok, I'll take a stab at some formatting and stuff.

