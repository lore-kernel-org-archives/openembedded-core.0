Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82CB760991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:59:06 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hn14so5048097wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-type:content-transfer-encoding;
	bh=5OdEYTiyeaXx1nmogFqucPoWTYAJb2AElltFVuXK9LA=;
	b=EG1MZShQ3lQWesR0h+QM56VGJ+VLPoNaoOY2lSVb+un/rZ7BXHvHCUv86ihzreFd2i
	G8iHmRSn3++hu1ydkJVZw6A8KqZi85hZVbWJ/avgYcxlwyAKpy1QaoBQ+D7wB9TU96x9
	4uBaQThpMmhkUrLHQvw0B+sWPn76ddvTVo4KGeMLWpIRSf7XjD1VcGTsEXAN4NNyiPJW
	ZqxsecT7DndYDe7LnjacHlslJIEkxvtH/hEh4zLuyCcYlQmrHqyHpsmg+vdyJqGfVj/U
	fM7d9S4KABvEHPeAQhuXu6hVtPLdfaz/pqls+m0VfbwyIgzpIoCLMMeAWoG7ItRnoSFS
	Dltg==
X-Received: by 10.180.205.200 with SMTP id li8mr3560386wic.15.1369904346521;
	Thu, 30 May 2013 01:59:06 -0700 (PDT)
Received: from [46.207.127.247] (046207127247.atmpu0028.highway.a1.net.
	[46.207.127.247])
	by mx.google.com with ESMTPSA id en3sm36525806wid.1.2013.05.30.01.59.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 01:59:05 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 11:02:24 +0200
Message-ID: <13ef4ac6c35.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <cover.1369898198.git.pkj@axis.com>
References: <cover.1369898198.git.pkj@axis.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.4.0 (build:
	2100294)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Fixes for makedevs
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
X-List-Received-Date: Thu, 30 May 2013 08:59:07 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 30 May 2013 09:19:54 Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:
> When I wanted to create devices from a package I stumbled upon a couple
> of problems with the makedevs program. Most notable was that it failed
> to set the correct uid/gid for devices created as part of a block (i.e.,
> with a count > 0).
>
> And now with Signed-off-by lines, as requested.

Are these appropriate for or fixed already in upstream, I.e. Busybox?

 Thanks,
>
> The following changes since commit efb8a460d2a977dbd481a0650fba8eb637c65bec:
>
>   package.bbclass: Fix sources contents (2013-05-14 08:52:47 +0300)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib pkj/makedevs
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/makedevs
>
> Peter Kjellerstedt (4):
>   makedevs: Create blocks of devices with the correct uid/gid
>   makedevs: Correct the device number calculation for blocks of devices
>   makedevs: Make the mode number readable in debug messages
>   makedevs: Avoid unnecessary timestamp calculation
>
>  .../recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> --
> 1.8.2.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Sent with AquaMail for Android
http://www.aqua-mail.com



