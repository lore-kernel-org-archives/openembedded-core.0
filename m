Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T3YwZ-0005zm-87
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 22:51:27 +0200
Received: by lban1 with SMTP id n1so3261618lba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=159FD3Y2ExlNFVjwRbpFGy8tfY8ztr2iv9RNsHSwrQg=;
	b=FjPNa+8T5XI1Rzq+6Y4HS+XVnLqZs2F2BMt88m3J5g7BXelLjR534oRahPaz0sFFP9
	PA8POd5mfumf69sfEPuj/YAq0Nn60cjG9iI7Wnh8Bd+fgp7Sq0VExZ8yjRaa8NmpNOTl
	K5md6A0whAIi9vBwi6ILi/dRlTYOQsisnKde/845D4tKlSUs5dWCFF1CSs0ixwj4ZblO
	Z09AVKAbs2exav5d/FvMdNJLoKi0zrVHMRttVLOa6PQJII27NIRgxZAScrY2zABFcnQB
	J0rCPtyer1xf5x5VXBoYFEYrR75yTm+DFVsekqx4T131qSywDFpH0FpC/hLK1qXq1gqW
	qDXQ==
Received: by 10.112.85.225 with SMTP id k1mr6636547lbz.38.1345495164242; Mon,
	20 Aug 2012 13:39:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Mon, 20 Aug 2012 13:39:04 -0700 (PDT)
In-Reply-To: <1345488563-30901-1-git-send-email-msm@freescale.com>
References: <1345488563-30901-1-git-send-email-msm@freescale.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 20 Aug 2012 13:39:04 -0700
X-Google-Sender-Auth: cQTFRvEshFgdDdTr-wNnvGKmHL8
Message-ID: <CABcZANkBHvrsu1237BaFYOC7LMHnFn1LnS_Qe9-qv=HKXMrMsA@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 20:51:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 20, 2012 at 11:49 AM, Matthew McClintock <msm@freescale.com> wrote:
> Keep in mind this is ONLY effecting the native builds and not what is
> being shipped in the root file system.


s/effect/affect/ ;)
-- 
Christopher Larson


