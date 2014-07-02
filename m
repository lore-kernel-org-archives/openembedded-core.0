Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9C0B65CA9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 17:38:14 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id b8so7182333lan.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=81U0IrhgbMIWWR55jT2j0a1nwvKtTupNjo29Hen+e98=;
	b=lYc9ctRrCNnWQGEK7iVHqgsCa1SYvB4kQ+Pal6bhkwJpRnG2XnFF4hVAaBHGlMeWrp
	Myyx+bnC/exbB2F1gLX89ifk4SMi4/0JSYnsv10LgUV4ix4sd5GLlVbYCllCe1q1XC98
	+W4XkzIitSWlPUzeycqX1MbSyKjU37jU+uDuVGPfMh6OJQ/AVTOiOvyNngcZ/+MMSTeD
	LIQKDJ+5BCAMeAw3xcvtJnvz3ZXCBjxiahI22oVvMCDn5Q3SCePwzL4CJa3i7ZuCbAv+
	v8CnZcurguc0qoLjlxhHTDW5ZZjfYE+vpu/ifvynl9olDrO4qk2QcYrnrKY7WVmqSH43
	SAkg==
X-Received: by 10.112.53.161 with SMTP id c1mr3054lbp.86.1404322694446; Wed,
	02 Jul 2014 10:38:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.31.165 with HTTP; Wed, 2 Jul 2014 10:37:54 -0700 (PDT)
In-Reply-To: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 2 Jul 2014 10:37:54 -0700
X-Google-Sender-Auth: Fu6FySEP5yq03leVzGKQc8ICBo8
Message-ID: <CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Wed, 02 Jul 2014 17:38:17 -0000
Content-Type: multipart/alternative; boundary=001a11c3a08c5a467f04fd395b5b

--001a11c3a08c5a467f04fd395b5b
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu <ming.liu@windriver.com> wrote:

> Add usleep in to support sleeping some number of microseconds.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>

Maybe it's just me, but initscripts seems like a horrible place to put this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3a08c5a467f04fd395b5b
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu <span dir="ltr">&lt;<a href="mailto:ming.liu@windriver.com" target="_blank">ming.liu@windriver.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":2sk" class="a3s" style="overflow:hidden">Add usleep in to support sleeping some number of microseconds.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href="mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt;</div></blockquote></div><br></div><div class="gmail_extra">Maybe it&#39;s just me, but initscripts seems like a horrible place to put this.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c3a08c5a467f04fd395b5b--
