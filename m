Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 66160797A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 10:25:02 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id b15-v6so39044797oib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mohp1pcGgGqznIknfceBZH+ZPgI6kyzz5/rkv/JszL4=;
	b=a8W70PGPJ+9Y+MZizCFRuGQY+bUEI1CCibuLFlwL938S/ZnovFRZ/ouLuSG/YTeBqX
	BqsYSSgKg4Zr0hal1ilRyuAoAjmiX+DBCf/82bNVWiRyGaU/mpPj6nQMvm4VdHYGiIyL
	rHLvgYwtz2UZRZvzcRHm9665m3jm58t/L5qLJkm/Nx70gaITK3CBTAsHDzCB+8KuysUh
	/rTBBEkGs2A9SJfgSIE4zfsNIL3NFgFkQD8IIXEL9NX2T6uLQNp5wn7tWBnDk4Ta5bKO
	wf3O7szWTFqYGv4I4e5DIs4RV/yqqvR/R5SzeGn7aqh6lBBJ76o8CMUV5y1BIPmub2qv
	4SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mohp1pcGgGqznIknfceBZH+ZPgI6kyzz5/rkv/JszL4=;
	b=YJDkTHj2F3V2e6dV5ZTB0HyJxNMUErSN00sYV0/zKFBlmahUPeGDJIpHAAEhVlc2UE
	CQSAo7RvhabvkwhZ9UfvCXhILJac4+gwXs383eTvmrC6CMAc3tO9nYSxw9M1aU3eIArh
	sSBOJPyLqegtPuC2zwv6rWGTJUwLgD9bB/22zZ6Wv6mj0OZuSmI7ezeybtvyL4knSpkM
	+S5jdrPvHGrp95w41k1AlVK5IWAS7qqSuUKXhL7k6b+Mdn33QCnt/saVaITAJjiu1Rg8
	2uircsTcrlI2h6lkRe/8heiIxKm4De/NfzDvyLh5Wr7D0N1sjwHLNlv8nSi75ouBb01P
	/nAg==
X-Gm-Message-State: APzg51CfybryPmELg1VJGYqrogNCtPZ7saXfKADbbwop0TLh55gSKfZj
	Cm87LgB4zxA/3johK2xwfiBXGcnXCa1FFJ/k65jZ0xcK
X-Google-Smtp-Source: ANB0VdZKIsO275298nOBUQckU8n2orW6WCj61jxXl0OEzXbrjS0CGZAYzkv41AAGOkpwp+GYvErYB8TKqAaf81b/qRM=
X-Received: by 2002:aca:55cd:: with SMTP id
	j196-v6mr284459oib.202.1536575103396; 
	Mon, 10 Sep 2018 03:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Mon, 10 Sep 2018 03:24:42 -0700 (PDT)
In-Reply-To: <d5a1d1701202d4323e15cb31c7f9a3afca88a00f.1536573689.git.Qi.Chen@windriver.com>
References: <cover.1536573689.git.Qi.Chen@windriver.com>
	<d5a1d1701202d4323e15cb31c7f9a3afca88a00f.1536573689.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 11:24:42 +0100
Message-ID: <CAJTo0LZiPj8qNgTVUkvno50LhizJ57VKGCnnQqiTuJUyGNmNRA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autotools: do more cleanup when in do_configure
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
X-List-Received-Date: Mon, 10 Sep 2018 10:25:02 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 September 2018 at 11:02, Chen Qi <Qi.Chen@windriver.com> wrote:
> I met the following error when compiling some projects.
>
> | configure: error: `LDFLAGS' has changed since the previous run:
> | configure:   former value:  `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
> | configure:   current value: `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now'
> [snip]
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm .././config.cache' and start over
>
> I think when some recipe inherits autotools-brokensep, it should try to
> do more cleanups before configure. So also do 'make distclean' and remove
> config.cache just as what the error message told us.

Does just removing config.cache work for your problem?  I'm concerned
about running a distclean because some upstreams abuse that target and
then can't rebuild.

Also obviously the proper fix is to not use autotools-brokensep in the
recipe in the first place.

Ross

