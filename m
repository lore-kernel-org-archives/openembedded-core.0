Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E3E906C8CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:31:46 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id tp5so9606931ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 22:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=z/bFdm+0Kz+1WzfOGJI1N9wvD/JC0B20JC06DNNym5Q=;
	b=TVM9gJWOgU5HzS/bGeG9cuSfZqSVaLLHIw3RthWGtneVEPdyswmsPLROayNd6+o8Rm
	BbT6xQuPcKny3xPdr576oLMILOipfT8G14Mb8hFJQspnhdBjGKN6sL8gPYM4Ed2rCUE1
	b/aGmc0OuKlboCxfGRNzPnhBg+/6VPBEsR86QMlYeWjFZqwOg89u+a9MHupGQIJaMkWE
	vWxE8iz6ru5Wb4ti6CQjsRdQ0jC3F0CCl4vb5xUWMSb7lgNUNELyBVcmcvgLdFTUEPoX
	KPUTtS8xA5Pqna0cq7D8bJC3Xbzd88cDwJ1TO+1F03rX1Pvjx1UL0+Z5L5h3dk1ahtEj
	umXg==
X-Received: by 10.50.118.105 with SMTP id kl9mr397025igb.3.1379395908696; Mon,
	16 Sep 2013 22:31:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Mon, 16 Sep 2013 22:31:18 -0700 (PDT)
In-Reply-To: <5237E49C.7090608@windriver.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2013 22:31:18 -0700
Message-ID: <CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 17 Sep 2013 05:31:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 16, 2013 at 10:11 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> Without patch:
> real 76m1.646s
> user 86m36.704s
> sys 38m39.103s
>
> With patch:
> real 63m36.193s
> user 86m9.274s
> sys 37m48.431s
>
> It seems the link option doesn't increase the compile time.

on the contrary its reducing the build time which is kind of
interesting and seems a win-win. are you able to extract the failing
link command and just run that with/without the linker option to
discard memory ? and measure just the linking time on the host where
it already builds without this option?

