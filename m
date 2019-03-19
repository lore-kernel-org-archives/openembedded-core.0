Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4F137CE4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 18:11:03 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c18so18555777otl.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=IKgyjntzAHyExij0sjNqDEYzCZo0Icf5n0czhfFBjE0=;
	b=S8MBER8xPo3TRpCI3Hc9eIEkg/358KEavZVh7gtAWszTo34emSL7PTLswOaxJUC3KG
	yd37eyMdvljGW0at1eKumtNMQJPWlW+/MSzPo9IAbHYwwYrQ/yTvbhEyH8nhfxEotJIz
	fwZdOyf46VYL0LvxW2mQD1P/M2XkLRM8SFsrNAADLjERddIwvmCoyvm+UMQ/sFSJZ9oD
	8vYwBIws9wOLFKnyPBis5DaXod+FcvLvRbD5IXwm83j2iuR02HZj9kVk505M3U9aXo9K
	QHxIWm4QflDNfvP/+gYm7JA3UuaBk+WnvP35l/+/8YuaBZPyTSOVChFG654Yy/YADW2P
	gQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=IKgyjntzAHyExij0sjNqDEYzCZo0Icf5n0czhfFBjE0=;
	b=IUbOmaqrVVYubpca8T8t0s1/WUO9uR8q85Xs2XhrSk8AqBQ1nmHppPgdC9AsjPJVqe
	WLMvgPAb4nDnOQhMKTYgzQRzX0HyIwHgsWI5o5yJeFJV6q0C1sMl2L1x/9sFkP417c6r
	AKCNJwTlvmzRUfpmNmiLGPV3/Q1bcdx1ZohmsRDyHjDd/Q3FgSqSboR4mEXvWZNFgx/Y
	wFDH0zMeYEUT37wPS9xDgLriptrr7lty+lBYSnVzbXMM7QR7o4rJzin4QLopUQkv8r+G
	MbQWWIRAPbwCBxNaH1SZNr1y71CIy4Ep7DwXGIXDEaheh1Hba63C/pJY3nMGxoxJYT2z
	NADQ==
X-Gm-Message-State: APjAAAUUKu2riU1VRqEFxt0Q3kOuuR9RUHqBABC42jmKpsLpim7ey7GT
	nNjPZoLWer6L6DXxIz6CgNl0MVWgBgewRQ==
X-Google-Smtp-Source: APXvYqweegnyi6kzPEp4Sbho25YOq5LEl+ETFg4oHCSdMhsIqYCvRhjFzmnsAgploqfSW8PPzI0+rw==
X-Received: by 2002:a9d:704c:: with SMTP id x12mr2759863otj.28.1553019064357; 
	Tue, 19 Mar 2019 11:11:04 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
	[209.85.167.177]) by smtp.gmail.com with ESMTPSA id
	m65sm5494539oia.15.2019.03.19.11.11.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 11:11:03 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f177.google.com with SMTP id y84so4379407oia.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:11:03 -0700 (PDT)
X-Received: by 2002:aca:ac45:: with SMTP id v66mr2170386oie.134.1553019062907; 
	Tue, 19 Mar 2019 11:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190319135727.31246-1-otavio@ossystems.com.br>
	<CAJ86T=XEpJ2AB_3azYJi9+Lm=RnVxQMHTrOg4NL941850zcH3w@mail.gmail.com>
In-Reply-To: <CAJ86T=XEpJ2AB_3azYJi9+Lm=RnVxQMHTrOg4NL941850zcH3w@mail.gmail.com>
Date: Tue, 19 Mar 2019 15:10:51 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrcLgW5UBxzyw5g=PsnzfV4HJiwDn1FL6ck1Z5yfKRCAQ@mail.gmail.com>
Message-ID: <CAP9ODKrcLgW5UBxzyw5g=PsnzfV4HJiwDn1FL6ck1Z5yfKRCAQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 18:11:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 2:38 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Mar 19, 2019 at 6:57 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
> >
> > We had a c_rehash shell re-implementation being used for the native
> > package however the ca-certificates now uses the openssl rehash
> > internal application so there is no use for the c_rehash anymore.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> > Changes in v4:
> > - remove perlnative requirement
>
> You actually removed hostperl-runtime-native, not perl-native. It's
> not really correct though - the hostperl-runtime-native dependency is
> there to ensure we can run the openssl Configure script, not because
> of c_rehash.

Yes; this was fixed on v5.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

