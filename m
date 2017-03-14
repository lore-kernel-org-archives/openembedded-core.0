Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 585D5777C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:48:46 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id o24so142124642otb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=LrIXFrQXCm6BkjhN5LvZNgyfX9qqISZDWEwcdOsHknU=;
	b=WIqWduWe1ofL5Vi6NR7PwFDU22L3vMLGx2m3lFE1rwVWd/wjoIv7oZBevzziUNTH6g
	WkMuj7zm5qmPyfJATI+I3TjI1HceqXfbNhB63yavzfa1uesItBQk5ZHAceTXLya2IX5m
	TyRcKPwZ/np3m3J+lNAE6ZoKzzaNP31nlxbqNsoxqiOWgptVDI3I4ZoSvEqAJEc0dzUE
	+vXGs+AhMpKlGgjLSORg3zs6OeMcl3LunaV7JoWbaecTqbHBU+X93hYwSudyuSFTiSRP
	XacV3tkT/5YVLuF/6iCu6Vy3gYNAqYyJYD/GSiYOvsZ2+L+NnmcUuyRDT6VeKArib8Wo
	jZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=LrIXFrQXCm6BkjhN5LvZNgyfX9qqISZDWEwcdOsHknU=;
	b=Lpl69qu0lITSwmiXZ7m2N9eUxIGS4agsM7DxBqs+QB5XogvB7FY9Tjob4HVC7vpgk5
	SDggwBsE/9Om7prftj9vp6R7B7SalQgJTVzT/S5nxGxjCq3Qcds+BEJa/ipzTTsTKkg6
	a0cYrtfpqjCXt1d5IpmYc73Acd0qiTvQe1VmuFA9dGbV95Y7+NgM/jVN0p1hjf/0uK4G
	MDRiDcs2WS5jOrxxkaZMKEVmJoUBqIvwFprA4Pj9oBBnKR6++5+qdW6qGlIiY5aw504r
	yq9tQdHgwhQX+db/uCnLXAacam9kLEe2uA06Ftiod+tBEr73nxGAOW3gulBdOdLybmX+
	hBLA==
X-Gm-Message-State: AMke39m8jXenlN+hT24ZviO9CCEhgZCOsPGHgkXJdk8b9ZRXaxTrL2HJnMj+gj7a/3rNHQ==
X-Received: by 10.202.175.73 with SMTP id y70mr20289061oie.174.1489510127401; 
	Tue, 14 Mar 2017 09:48:47 -0700 (PDT)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com.
	[74.125.82.174]) by smtp.gmail.com with ESMTPSA id
	g10sm2219372oic.16.2017.03.14.09.48.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 09:48:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f174.google.com with SMTP id o24so142123405otb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 09:48:46 -0700 (PDT)
X-Received: by 10.202.78.5 with SMTP id c5mr18437472oib.77.1489510125699; Tue,
	14 Mar 2017 09:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Tue, 14 Mar 2017 09:48:45 -0700 (PDT)
In-Reply-To: <1489504451.13980.41.camel@linuxfoundation.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1489504451.13980.41.camel@linuxfoundation.org>
Date: Tue, 14 Mar 2017 13:48:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
Message-ID: <CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Tue, 14 Mar 2017 16:48:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 14, 2017 at 12:14 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> Despite this I merged it on the basis that I'd rather have this in pyro
> rather than waiting another 6 months to get this in and having to tell
> people we were changing soon and having to deal with any more smart
> issues.
...

This kind of change should have been merged in November, not less of
two months of release. One more time heavy changes been commited late
on release.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

