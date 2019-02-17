Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C92CD7C763
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 22:52:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y185so10806149wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=45/7epm+jKZIhqe7ko5Gv3CgomxaDQlVqrpYXCAqkN4=;
	b=VvLaXJgc4pW6jg3+uykVenB+jO8H656eo0f0ULf27AmBxv22dNcLkR11mySoGzO9IP
	ZR9h0MYpwVCnDz7PGMQm1L6pbU8Nwt4ixOJLCyV+IDbraPfbJODBX6roEaVU1SdOmJdS
	mIhTXYqD5KUqcUoF4SpbB6V3wo/f83xtrunUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=45/7epm+jKZIhqe7ko5Gv3CgomxaDQlVqrpYXCAqkN4=;
	b=c0mQUgzO0U5j0J/23XlSE8KTDssqkKmlN9w0cDxCFegLyLNjim1Xs1GMRp82cX0+cs
	686KfGe1NlHppuDTNhdMn2LCnnAOJG8NTHvbo5OPXOz/XeElj1SpTW3goE8aLsjwTVoO
	yW071ErBWVWR1uXvHB6StmLiVXo7AT8li2JETYdNZi5OSZ+lgxmka22r/hONrSRj7rK8
	9iJKazh4ZAZWGjwvFgR/qfEDnS0GSyiVSM6VDLyWgHQOs3p+5KQWs0aoOQXieqISNRAt
	dlrg2gD5koqVNFl5OHQ9q2lNbYltl4LVXr+PjNxJYh+Jw6zYOVx3SF12KmUtSJOT+UGI
	yYDQ==
X-Gm-Message-State: AHQUAuYX+A9y4z0XOmvE6pjKuYhYvh+jqFIWl5yZ7K1K4mAmDvsTLlSb
	T1k2/WiBSmxfGRRKAGRz8zcGlg==
X-Google-Smtp-Source: AHgI3IYdqlBhruhkNGj9y/kCDzcUazah/+JOOP9AoKO3yEylCEY7AGn2SJX5VKEp9lUztMp/YXJfxg==
X-Received: by 2002:a1c:7903:: with SMTP id l3mr14539403wme.22.1550443974216; 
	Sun, 17 Feb 2019 14:52:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f4sm8311511wrx.68.2019.02.17.14.52.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 14:52:53 -0800 (PST)
Message-ID: <eb8026185baf26c376b24633aae735c8f2076602.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 22:52:52 +0000
In-Reply-To: <20190217145107.2796-1-pkj@axis.com>
References: <20190217145107.2796-1-pkj@axis.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] libc-package.bbclass: Correct a few paths for when usrmerge is used
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
X-List-Received-Date: Sun, 17 Feb 2019 22:52:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-02-17 at 15:51 +0100, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/libc-package.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I included this patchset in a run on the autobuilder and its failing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/66

I know the resulttool failures are my fault but the glibc-locale ones
aren't. I'll abort the build as there are enough failures to know its
doomed and I need a results set for other testing.

Cheers,

Richard


