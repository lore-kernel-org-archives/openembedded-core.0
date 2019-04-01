Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 826787D202
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:02:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id w15so1251334wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=HWGAAl7WtaTiZd4Vof15KqNwSVInIF3sVCqEASwCX2o=;
	b=grqphSS0rHEOMaJ8yMH1B4MV6iSmofZjWJH8LUkymO5lTe2Va6Afk+wdT0BZBdTfS1
	FOuvl3bNsr967mI2sZW68S+j84tsAEhad/+HuFBrlvppUZLp9lTXzYSmoWTEqVcrns5v
	7sk7g4BzyoReN7sCZ8aBJfM8nWr9QfWIulAXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HWGAAl7WtaTiZd4Vof15KqNwSVInIF3sVCqEASwCX2o=;
	b=Dol3nCEh4L9+shazVZH40QMZ2vwHf9fYADhSSSnsZ3AueQ+MSejAOuD35aM3leAAEy
	rq3iPsKTIBeTHVunNKQw2d3iqgGxHm2TqhaPuXKBqrpR+p8d6zBOx5lYbk4KfMMjEkxx
	zgI2G0zx9gwuZGXuFbV0AiqlpvdkXH5MNWyvXi0UyKICt9Xuvw+lpSp3egSkhA2cbEIR
	RRW8TfXj5L5w7yJj+R/c4WYMkCph9p3EjUS+cg6Dt2de+m9t6vLCB51iqA42YPgpiE4S
	NJ4Kb24MiHmkxsoUhqZmweStmw/RTE3U4q7eOsHMD86QaK656PssG9Bp1CXQlALXr6K3
	trJA==
X-Gm-Message-State: APjAAAV8FxfzuKOKVfbSDgkR4rEjOeMYItG0wpjtox6SsIcsTV4gmHfG
	hYqNmb/dyPc9BLBrAWrF7xZ76w==
X-Google-Smtp-Source: APXvYqxS+ipspA/mwgMdKKuasDh4SNIVq41UoSYIuz9zAvMCEL8n48d3ah1X4XrN7P5bIsyblSj0Pg==
X-Received: by 2002:a1c:cf83:: with SMTP id f125mr603293wmg.96.1554159737244; 
	Mon, 01 Apr 2019 16:02:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j11sm13219422wrw.85.2019.04.01.16.02.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 16:02:16 -0700 (PDT)
Message-ID: <b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>, OpenEmbedded
	Devel List <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Date: Tue, 02 Apr 2019 00:02:15 +0100
In-Reply-To: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: Git commit process question.
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
X-List-Received-Date: Mon, 01 Apr 2019 23:02:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> Hello,
> 
> I have noticed a large number of git commits with no header
> information being accepted.

Can you be more specific about what "no header information" means? You
mean a shortlog and no full log message?

Cheers,

Richard


