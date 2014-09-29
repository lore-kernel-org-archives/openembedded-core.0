Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id E26D16ACFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 00:51:16 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id a13so1888172igq.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 17:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=PHtDD725KIZLZllHSnrW+4FIOhF7fFVElWk/tsP0FtI=;
	b=fnLT9oL0PsOJPKJKWRN3wjii8zkXvm7OoPW5YXC3krqQ0xptJedGSxwflukJsbmAoo
	a2UEt5Tna7KZiubl6DH611P7d+dfugWhpBbweeAtiwF4g0ZGofpNuchch+KQQDlHksIA
	z8yKgRuCk1Y66wgwFO3G1/W95GSXCs0ix4/w6QjhrClG4IpbbUFVsKNY4uS3JHGgBT7L
	l2w2WmM7bdQXnjLfGoAHLOu/3NbQVVZEnx3uWqqC1OiKh+XjvMes2F8mTs12d8sWwvBI
	dHAS6A9BotCjl92zpZpcM9v9vEwuvMAt7eOmZgqFN6VlQljIbTFhqbS1jD7j4/8sTle+
	yKbA==
X-Gm-Message-State: ALoCoQlirTIGr4n8uCz+WBbpRAu04vccog4fKBKrJ7S0kR+lK6eBwMCiff2NMI0A+kFNWAOhd0xE
X-Received: by 10.50.32.10 with SMTP id e10mr48923182igi.7.1411951877856;
	Sun, 28 Sep 2014 17:51:17 -0700 (PDT)
Received: from [192.168.141.122] (dsl-173-248-233-100.acanac.net.
	[173.248.233.100])
	by mx.google.com with ESMTPSA id ig9sm8633151igb.13.2014.09.28.17.51.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Sep 2014 17:51:17 -0700 (PDT)
Message-ID: <5428AD04.6020006@linaro.org>
Date: Sun, 28 Sep 2014 20:51:16 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>	<540896F8.9040805@pabigot.com>	<lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>	<CALbNGRRTcV8bst1tQYNZ-z6w7_aSXT3=pVMVLRQncDw4TwQEow@mail.gmail.com>	<lyha0nb5cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LY9RwZzJ7KhON4EHq-PuLC7z3jcv4_B-u94EZUJWUYvgg@mail.gmail.com>
In-Reply-To: <CAJTo0LY9RwZzJ7KhON4EHq-PuLC7z3jcv4_B-u94EZUJWUYvgg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Mon, 29 Sep 2014 00:51:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/04/14 15:12, Burton, Ross wrote:
> If someone knows a good UI for blame-digging then please let me know!

http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/
http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

