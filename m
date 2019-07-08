Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2E41B79CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 21:16:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id r9so17391101ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=is7/wgE0wQrdPTSVyK9VHuC5kj7lgCOVDpTjfXh45fg=;
	b=E0uj35wY50WF8EJq3qYyfRVEdr8N7G/5tpVE74b1lZAdaF7qwlUDdoW5Wg7CqG1epi
	zADc9S9gFGoj0wyLMsXRJIBbti6lMUdsr2Dn6+fYGSuB15uVDiDUEOxLxrkAbKwGFo9v
	bF5U0yjSUH/4eWzqHYKLFKC0MXSCvXT4TRPgU1v4KIjKmdMmRK3osgaQ6zo/6yNUIpuN
	RVFpD0uABfUo6pN3OV4NQSsNnVueqpzCcfiwZ5PAwxZ2nNXr4eAT+78eb14e58r60Foi
	SG355jWXIZ+612DSKtxq/rm3SFBZ776iIlHWpwzDbWIBQ+d7EB1VxOzp7pdeMiEFHNN9
	8nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=is7/wgE0wQrdPTSVyK9VHuC5kj7lgCOVDpTjfXh45fg=;
	b=rmZKytWBSWLsTyEG4QUN+JNH4xaFEhrd+CqVZ0/O2iTjCfPQjGz7cGzJRwEVP22vSz
	v711EzlXNNrF/jQIk1RhZjttH0wadg8StLnI7h1YSUHNXTwM4Jb3TQBP+YvJJPxioG7t
	5LfhDl17aOUyv+4iwVFf9Xzcm5jxFoM9Njj6pA/jaNcmroUiM5MYYYmRS2upbBsGsZGD
	ak3hyBZeYzl89lSXQu84XnDcYyTAxhX9bI7Zqxrey2BwU8z66BkTf0DsolS0ISKMGIH4
	ysOzLyAwyhBGGtsz3W76ZWZfE0WEvfvdfkkc/N4EtjTzCpu7RIMAzFQ5W9Bv1TIhlrLi
	BhUg==
X-Gm-Message-State: APjAAAXXLwpg1+YIr9z3xf91V6ZIu+8Vzo8dX22R7tYBrdeHqzjGNOR4
	tk1jLAEj1qCeWgGChZGSR6XZukdBGx7zFJGM6R6E6O3w
X-Google-Smtp-Source: APXvYqyru72uWnswpdznVEgFCkiOVGaLKmxOTBqZGYwdh4Fki91hKZpNjvHtqEF6aUSQ1S0YB1xHA4HfDiadFRf+0xY=
X-Received: by 2002:a2e:8613:: with SMTP id a19mr11355004lji.163.1562620605645;
	Mon, 08 Jul 2019 14:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
	<CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
	<CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Jul 2019 09:16:35 +1200
Message-ID: <CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Mon, 08 Jul 2019 21:16:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

Thanks for your pointers, I will try them.

Regarding using curl for sstate fetch, how to set SSTATE_MIRRORS ?
Below is my current configuration

SSTATE_MIRRORS ?= "\
file://.* https://artifactory.com/yocto/sstate-cache/PATH;downloadfilename=PATH
\
"
Thanks
Ankur

On Tue, Jul 9, 2019 at 3:37 AM chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
>
> > I can't see any "log.do_setscene" inside the tmp directory.
> > When I start an image build, it does say executing setscene task but
> > then no setscene task log for any recipe
> >
> > Initialising tasks: 100%
> > |##############################################################################################################
> > ##############################|
> > Time: 0:00:01
> > Checking sstate mirror object availability: 100%
> > |##############################################################################################################
> > ######|
> > Time: 0:00:02
> > Sstate summary: Wanted 484 Found 0 Missed 968 Current 0 (0% match, 0% complete)
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
>
> We have Artifactory serving our sstate as well, so here's some tips.
>
> 1. Try seeing if you can fetch some sstate using curl directly. If you are authenticating to the Artifactory server using a .netrc server, make sure to pass "--netrc" to curl.
> 2. You can diagnose the sstate mirror by passing -DDD to bitbake. It will spit out a ton of debug messages, so you might want to redirect it all to a file. E.g.:
>
> bitbake something -DDD >out.txt 2>&1
>
> Start looking after the line that begins "DEBUG: SState using premirror of". It will dump out the URLs that it tries to fetch.
>
> 3. Within Artifactory, you can check the access log by going to: Admin > System Logs > access.log
>
> Look for "DENIED LOGIN" errors.
>
> Chris

