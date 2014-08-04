Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D35C6FE5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 20:14:14 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f10so4641891yha.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=GxsYz5uJ8U9oNanvGwkkaiZiTr7GgOi1Y2kTDid3gwY=;
	b=UpscFW3t/rCYFwmRfPIUu9WBDepbfxG1omoh2H6lY5EbEdHCRRwGCj6xrxAV1caS3a
	z3LJmvvF0ZOUOEzxVIxnc4m1MuTJtfL/lwdZhC+OCANiFtFc86o6xOeEtWWy+q2aI2Ne
	C3ejVwAngrii/SXGDeWv89GaQbLUmnMoxRbf1cJ07SQ7GQFAn83YjG2wyGI23HpEt49J
	PVq+7eYXM/3hE2hOcZnkq75vZsjwlaF3d6e8H+UqoQIjn7n/jhlYEUConTtbrPM1CsxM
	eT8QVmftKAgzsaPk0MVwX5F0/MU0vvnzvQiJmzeVc+souIz96M7tiCcV3f6g7vB7on8J
	2Bww==
MIME-Version: 1.0
X-Received: by 10.236.29.171 with SMTP id i31mr42798214yha.37.1407183256436;
	Mon, 04 Aug 2014 13:14:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 13:14:16 -0700 (PDT)
In-Reply-To: <1407122473-16439-2-git-send-email-b50113@freescale.com>
References: <1407122473-16439-1-git-send-email-b50113@freescale.com>
	<1407122473-16439-2-git-send-email-b50113@freescale.com>
Date: Mon, 4 Aug 2014 17:14:16 -0300
X-Google-Sender-Auth: huU90SHqjjMCcxgL9j246_XnQag
Message-ID: <CAP9ODKrYRA26PKG4h_uZ=Ja7-WPkS1YwYFkyFOJU=RkdEoCxaw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Wang Zidan <b50113@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] alsa-lib: pcm_local.h: include <time.h> to enable CLOCK_MONOTONIC
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
X-List-Received-Date: Mon, 04 Aug 2014 20:14:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 12:21 AM, Wang Zidan <b50113@freescale.com> wrote:
> CLOCK_MONITONIC is defined in <bits/time.h>, add <time.h> before <sys/time.h>.
>
> Signed-off-by: Wang Zidan <b50113@freescale.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

