Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 331BA7C6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:07:26 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id v62so7827784otb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3si+070zM5jLH13143sMVqPC00XrfzBlc4z12PbJjTs=;
	b=lHKxsMeEMrYLDqvLTmUT5ypIfmIk+0MIpeVH9PkVADwdCC1yK15SMGpNr8pEDNmfND
	o3McpZOs4DBPXVnwSbdpHLcsq5WCOJMlZQXkp8kCV4nQZqYEcYVuARa3KvAPD55BodFY
	bpIq9AjkAWaGSWKJ3B2xSJ48RxdQeBEsYIQpWtg5TDq+/qaepZDSUJDFBQ7DpwtTwi6b
	vhPEFZz5t3cSl/JowwY3AmPScd9Gw5o7cKmSHtLDEJZ+Lz2mAbyxAxB4NwHt7k0lR4ZJ
	LwCiZ2H/Y0CxONaJpWuyv8vQYEK3CLrRt/4RN53kZfwz8zqntfD1Jl4JXFOepnAQCxDS
	ST5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3si+070zM5jLH13143sMVqPC00XrfzBlc4z12PbJjTs=;
	b=puXl4HHyZE0pgCax8ksIZKpRNInClUMc2siYiiGjcuaRAGjUIr+iv6G97djqVJdUKn
	FLQXTD7OU4VhnbYCsjPp2js4sNTvozakbbQvypaOaXk4TQO2JkS0eOkXbSTAVcdd6h/I
	MKnPBj5T6NcGldbU+jAVPFF4cU0nyWXse5ks2aqEeExfLrNfNCX01ARxgpd9xRZqrtU1
	pKVCS0BfrV0bfCgOAArLpfOChPS3gVnPFxlvYBcDcNKX0X30nrwuFYsf4AvvBqETDnJz
	jftsadcVt1rGqJuLJt9kiTbIGY5QSHKIq4XXmU5a9INTwBFgB12ydOFckYVXwj5i+bju
	TLKA==
X-Gm-Message-State: AHQUAubAWpsPmRab5wOiUQ6145mOXwgypgtXZsGuY5zbJRD5Tiquph10
	gJExLlkv6HtANmtaRi8yG2/PD6X9q6POvcg+kfU=
X-Google-Smtp-Source: AHgI3IZC1gYW3kmwlRWIDBA5CTg/7jLlacAe7WF9WzkiQKQ3ZLroWAvrlHQtiF+0rgfTEcViLT1umOPlql3K/420eAA=
X-Received: by 2002:a9d:7544:: with SMTP id b4mr4863058otl.326.1550239647155; 
	Fri, 15 Feb 2019 06:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
	<CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
	<CANNYZj8-i-HQFyHoiHaJj9XW_pMSq2muP9g=vhkN9ukZXh-dBw@mail.gmail.com>
	<CAP9ODKqi+bcaFt8+7xEzCSZ+=pPFJA8nPZz05WBZL2+hNq5VXA@mail.gmail.com>
In-Reply-To: <CAP9ODKqi+bcaFt8+7xEzCSZ+=pPFJA8nPZz05WBZL2+hNq5VXA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 15:07:15 +0100
Message-ID: <CANNYZj9Yui28g_Fcth8=MZFgfrdQ=72qECGAXrQAdP6kq_4nBw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 14:07:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 14:59, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

> > I am not going to do it: this split, when done properly, would require
> > separate rounds of testing of the commits, and I've already spent more
> > time on it than I really want to.
>
> When I replied first, I said I was going to do the upgrade at our side
> and later you guys could convert to meson.
>
> As Fabio pointed out, there are more changes and issues to be fixed
> so, we will do the upgrade here. We then can you guys so your changes
> can be rebased on top of this and we avoid duplicated work.

Fair enough, just please do so in a timely manner.

Alex

