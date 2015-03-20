Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1141373A17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:53:25 +0000 (UTC)
Received: by ykfc206 with SMTP id c206so43447854ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=utmL2Fc/UZe3zETw8EKG+NuY62I92PdGArQDc1KHDfs=;
	b=NBDnXtvn7n33l7fI7dU9tXNWPNSFB5gneSJ68lL9Mpy2v0Zdvhz1nJqY9McnGgEhVW
	JKdQFfpzDhv7dKSZ96wM8YJi3kCFylYdFkoqcHjs58/VeO0VZU3SnpT3IcC4jDAH9LsE
	BWlxnvjFixtpiSftbUT7QdXOyUzBeTJh1R7cjKpXmOucPZlOkonMV5g76nRlcjFfcjtr
	dpjGFTPGetoNGEaPMg2MdtD2Txw8sGhoHL4T9rMRuw1MJXTYZY7i4Kv05ZDHXtHX0pil
	4iPDDwdx65FWZPXVqdWeiWYVeppyXaMXEz6YMc7q+foZinYeuFlbTvSHtXgmwfAEtiOT
	zWhg==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr82482771yha.105.1426863206529;
	Fri, 20 Mar 2015 07:53:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Fri, 20 Mar 2015 07:53:26 -0700 (PDT)
In-Reply-To: <1426805275-4766-1-git-send-email-sam.nelson@ti.com>
References: <1426805275-4766-1-git-send-email-sam.nelson@ti.com>
Date: Fri, 20 Mar 2015 11:53:26 -0300
X-Google-Sender-Auth: bmbBOB0yOgzT85mt-n2bEFNhUk4
Message-ID: <CAP9ODKrtUp7ti26=S7wk0Xw_sgVK7dzmjmSmJNmV5Jzqf2m70Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sam Nelson <sam.nelson@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openjdk: Add patch to avoid build issue with linaro toolchain 4.7
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
X-List-Received-Date: Fri, 20 Mar 2015 14:53:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 19, 2015 at 7:47 PM, Sam Nelson <sam.nelson@ti.com> wrote:
> - "-fuse-ld=bfd" is only supported in the linaro toolchain verion 4.8
> - This is work around to support the 4.7 version
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

I understand why you are doing this but this should be included in the
layer supporting this toolchain, not meta-java. 4.7 is not supported
in 1.8 so there is no reason for community to handle this patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

