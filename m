Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id B0BE4609B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 17:31:04 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so469884ykp.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=I095QBvALqNmRUIVZx82N11Rhv1nJGsrZFnjsE+Rw2g=;
	b=xA4S0F541TH9kmNzP1NMUv1QjVbnnjKgnVdLoeOQ1tvsFckvhdVq6HApLEbwJHlXWf
	OkK2f0d23NYvCC+vfMclq9o3tYq+vYIuXCdkTwlH2k6FOHWrThRpaTy4kbrt/hgLfLnt
	vRxtFvmrJ9q+Kn6jZbJu4Q9IGoDnRjBxNpheG8pywFdTvy7OGyJlqSn0uDrRa3kVpRSg
	0Uc61ZtKU636M6yesUXGaJH83ziqt8xdaIQYHsVLWGGy47GOh+XQHivF3wlfgpG0GCxV
	B2YnsFM7TMS0fyRvvN6AcqevWYbuSnAcEvXQ8/vy38bkfdjHjTkkREgOlGwySDhZ86dJ
	IVFw==
MIME-Version: 1.0
X-Received: by 10.236.101.51 with SMTP id a39mr16649690yhg.78.1398792665233;
	Tue, 29 Apr 2014 10:31:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 29 Apr 2014 10:31:05 -0700 (PDT)
In-Reply-To: <1398770975.16672.421.camel@ted>
References: <1398761378.16672.363.camel@ted> <1398770975.16672.421.camel@ted>
Date: Tue, 29 Apr 2014 14:31:05 -0300
X-Google-Sender-Auth: a-Q-UoDCDW56bSszjG6edQ1ywKo
Message-ID: <CAP9ODKrFSLuAuJBrycV__kteTJtcGQkjSEa_AewM+6NaUxbuMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status Update
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
X-List-Received-Date: Tue, 29 Apr 2014 17:31:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 29, 2014 at 8:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-04-29 at 09:49 +0100, Richard Purdie wrote:
> contains - I also have concerns about the contains() changes being a
> touch too aggressive and needing a little more soak time. I had assumed
> they just standardised references to the function, not removal of the
> functions themselves yet. I'm therefore holding off some of the bitbake
> side of those changes.

Could you add contains_any patch in meanwhile? I understand you want
to keep it rest for some time now before dropping the code of
oe.utils.contains.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

