Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 398FC617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 20:13:37 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id b6so4631136yha.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZChf0sqbOqOU1ab3hBL6Ir536uLndEfNAtAm7oNhzSo=;
	b=WR0UtOJkcmdOW2L7QDh763wVuJ47YXkeCw4Nb2mCzJ9jQTY341gims/XqowQyuAkO7
	RlOAm8uLYLvZLtudhKIzoBlhv1k4SWUy0d+i3/Jx5WndbgdKGg9beHnHTejOTB4dn9sZ
	u7qAdFaftxoOJHuMogHX28xf4AtTeb9P8vSs07JEGXKgdxvSdEmofBt8BFZ0loWP8V/B
	WdUX5cspXsW5CBGgYzidomn2RrlxggHDEUNbgwUG/+Alz4sf7OYfm5aFF8+EtYMVZnU1
	n2C/KTedB0ZtGki+dRJ4ffQQAdE00t+FRf9xDFNyLdvX+2AwlpA6BSqQw1qso8du16x/
	qcIg==
MIME-Version: 1.0
X-Received: by 10.236.31.135 with SMTP id m7mr42106058yha.104.1407183218390;
	Mon, 04 Aug 2014 13:13:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 13:13:38 -0700 (PDT)
In-Reply-To: <1407122473-16439-3-git-send-email-b50113@freescale.com>
References: <1407122473-16439-1-git-send-email-b50113@freescale.com>
	<1407122473-16439-3-git-send-email-b50113@freescale.com>
Date: Mon, 4 Aug 2014 17:13:38 -0300
X-Google-Sender-Auth: R5_b8PLVCJrpioRFjAuF1pO3L4c
Message-ID: <CAP9ODKrytQc3PXWPvkNGxUqfobgfgFDfFFEfW-9vyhULDYrKWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Wang Zidan <b50113@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: use get32_labels for multi-source
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
X-List-Received-Date: Mon, 04 Aug 2014 20:13:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 12:21 AM, Wang Zidan <b50113@freescale.com> wrote:
> The PCM route plugin can assign the destination value from average of
> multiple sources with attenuation. This requires the read of each
> channel value, sums and writes the resultant value in the requested
> format.
>
> get_labels gives the value as is only with endianness and signedness
> conversions, but put32_labels assumes that the value is normalized to
> 32bit int and it shifts down to the dest format. In addition, the
> current code lacks get_labels entries for the 24bit formats.
>
> For fixing these bugs, this patch replaces the read with get32_labels
> and use always 64bit int for sum.
>
> Signed-off-by: Wang Zidan <b50113@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

