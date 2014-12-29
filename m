Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id B915F7267B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:46:06 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so6439896ykr.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Il5fwmekv/3tDv1ZFnr35P4WNOOcOUSk5jnI9C6KCqk=;
	b=cZVUrvaJhmeDFmmwpq1/UKO6PzUpd6rP6eS9jnM6rS1HcHYWZDlNRiLFZKEzN/3w1R
	LnMxjm93MZs+274mPzeHIHaifa5205lLZIU5Uu4MnNJmX68IHXh3YK8OMKNloJTHRg/r
	nxjUbwi7Va81ux3PnhA5rp2fPKMaB6t7WUnB6YAUckuek5bDxTaSQuOPTxjLPbWMv0b4
	jazSUIEzuEZsRuHRUyqwRvtBUw5AQUyOk+VvPmKQQUqhwUKUuMri855U32r0tRWNfkhH
	rmMZ5fn8Z+vcRVs/cBCCF/l03ksxD8NnLterak3+nMYgyhmYSGGBFM5yMGyKZKZvXX9j
	xtnQ==
MIME-Version: 1.0
X-Received: by 10.236.39.134 with SMTP id d6mr15813853yhb.90.1419857167061;
	Mon, 29 Dec 2014 04:46:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 29 Dec 2014 04:46:06 -0800 (PST)
In-Reply-To: <1419844544-10137-1-git-send-email-b50113@freescale.com>
References: <1419844544-10137-1-git-send-email-b50113@freescale.com>
Date: Mon, 29 Dec 2014 10:46:06 -0200
X-Google-Sender-Auth: yWs7Qv1QdIJCJL5M5nWBlRomuvs
Message-ID: <CAP9ODKqerqox7aFqgg1PjB7-P_tar_9rJhDkCPj7X5DegjUvuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Zidan Wang <b50113@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add patches for gstreamer1.4
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
X-List-Received-Date: Mon, 29 Dec 2014 12:46:14 -0000
Content-Type: text/plain; charset=UTF-8

Hello Zidan,

On Mon, Dec 29, 2014 at 7:15 AM, Zidan Wang <b50113@freescale.com> wrote:
> Add patches to gstreamer1.0-plugins-base and gstreamer1.0-plugins-good.
>
> Zidan Wang (2):
>   gstreamer1.0-plugins-base: Add
>     taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
>   gstreamer1.0-plugins-good: Add decrease_asteriskh263_rank.patch

Thanks for preparing those patches; both are technically correct but a
small improvement can be done.

Your shortlog cite the patch file name you are including. This does
not communicate what you are really doing, and you does a much greater
job describing it in the long commit log. So please, write a proper
shortlog for both patches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

