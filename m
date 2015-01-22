Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56C617251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 10:45:26 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id t59so345529yho.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DXJkB7pEnSPMZqHq1LVqrSkkwIY9dWVdGXRTcveSHnM=;
	b=dymn3sOQLehE/j7wRtX1qOo7Taj970HZIR4H/D921ygDU9DyI0SWyJlkygGmTEpDy9
	uno0F8vhzMkThQktBqtm7btOZ7o2PmiCGxrixaaHzbPURb/K06LQQFP57zrX5eJvlYLz
	t4ESVXJzUan5TP95FSSD0s7N4kgE99o6wzUqy58Q5wlLRhM60wAk//td1JFCGYStEBwN
	jLZ6x06RKkZN+PomCRULosWUWjUWEgTyOuF41YIbm1YfYOvZoHPIBxANg+yXTo2wPx6I
	0f5qZQP6meIg42JGh1Z8+kChl7iCA6N6rBVHYWEWYvfVwAHG8nPrSuF00xfzyQHvPsdM
	mCjQ==
MIME-Version: 1.0
X-Received: by 10.170.154.195 with SMTP id v186mr450657ykc.22.1421923526657;
	Thu, 22 Jan 2015 02:45:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Thu, 22 Jan 2015 02:45:26 -0800 (PST)
In-Reply-To: <54C0B644.5070707@topic.nl>
References: <1421915352-8485-1-git-send-email-Yue.Tao@windriver.com>
	<54C0B644.5070707@topic.nl>
Date: Thu, 22 Jan 2015 08:45:26 -0200
X-Google-Sender-Auth: AYw7qsuSFR_MWUjzHZhgo1KwW3c
Message-ID: <CAP9ODKoqjPYkprTyU0aVcBiBb1_QxOWZD4Py3Yq=U1Ar56Pu7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: set the optimization to -O2
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
X-List-Received-Date: Thu, 22 Jan 2015 10:45:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 22, 2015 at 6:35 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Wouldn't this cause build that use "-Os" (or -O3) to be forced to use "-O2"
> for this package?
>
> Using -Os makes for serious flash space savings on the MIPS settop boxes, we
> found that the code generated with -Os isn't just smaller, but it compresses
> into a much smaller filesystem than -O2 generated files. There appears to be
> some synergy there between the compression algorithm (gzip or lzo) and the
> code as generated with that option.

Agreed and this is not the right path it seems.

I think this will be used when security_flags.inc is in place. So the
fix should be there, not in a patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

