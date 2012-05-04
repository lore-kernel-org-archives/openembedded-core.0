Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQQjv-0002or-8h
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 00:12:39 +0200
Received: by lbol5 with SMTP id l5so2230120lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 15:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/9Zt1SDAU+whSXHtlhAnbn13yP58hNd7ty+U2HLRdzE=;
	b=mcZCOYKRpJRjCDLCG0elIOKzdFr+uFN2OKjvb1Yk39NmiuprDHswEcCVarpnpkaQxC
	5Yh07XSTVS+Jhge+zyErZcA88lmZL5zWpNthrwavJG4Bf47MYXhM/tViCahTnl45ZtdG
	fpYlcpbl2WUCwHHUW/JbHXReWGaCxJAwXXFUMOLa9umWeP2t/GpHX+B82qLv1ySMoKsA
	jeC3RAig6bejJAfJbpr3cg+aDdS6e/8Iat59GT9sQwRDiQpl2tCyB0TV2iAV5BOa+3C5
	vs/WDsk9NORPDe0px/uK5wxQHSbFM4aS7FwocbVXh+t93Y9vA5QXrhi9h6q/IIEomRhy
	Mipg==
Received: by 10.152.145.228 with SMTP id sx4mr7204614lab.45.1336168971978;
	Fri, 04 May 2012 15:02:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 15:02:21 -0700 (PDT)
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 15:02:21 -0700
Message-ID: <CAMKF1sqAf-6oH=d2mG8v0+XPtU_rmu-7vCcA1sSdo1zFvS37_Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/40] mostly automake 1.12 related fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 22:12:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 4, 2012 at 2:30 PM,  <nitin.a.kamble@intel.com> wrote:
>
> With the automake upgrade to 1.12 many recipes started failing due to
> use of deprecated features. This commit series addresses many of those
> recipes.

Nitin

These patches should also go to respective upstreams too I guess

Thanks
-Khem


