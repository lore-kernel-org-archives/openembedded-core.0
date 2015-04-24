Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 07EB3605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 14:40:27 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so85017923ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fUHmlgMsEb1UcWoIfVWb/6ZwWi9T+uNPdcaM+m6v8YU=;
	b=0tEwBZ3TgFlcTe71FvjhEI1GuZtf7y7mRpqLRq9mcxRo11hvZcAENPinITC4I8mpTr
	gveGLe2GxNYJrST+cH3KMLtEx5R8zVxhNwbWfLC5i25Yxuo/9394vVhvcNq/k9GVp/8b
	d3yTGQFuPb9rcTCO+6UgaDbg2Xv57+hurGuY6UDyZ7dpF3PVJQszyDHIlfvNTPOeBzds
	AMtIw45fHWzwXK8w4LnKnKL6/U3iF5/cEJyvkMLr2NGGWipkOOc8oo7RJvSH+7zZuknd
	8F6krxct7cZc9BL1a1zJH2qE0dOOgbDSSy6VFnzGpOto56AdlqjwqTyNiPRMA7ZwBS89
	Q3UA==
X-Received: by 10.107.136.89 with SMTP id k86mr10788245iod.63.1429886428710;
	Fri, 24 Apr 2015 07:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Fri, 24 Apr 2015 07:39:58 -0700 (PDT)
In-Reply-To: <1429870640.26983.131.camel@linuxfoundation.org>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
	<555d7daead4c2ae18ac487b6b8ac0ad88b5ee476.1429846255.git.raj.khem@gmail.com>
	<1429870640.26983.131.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Apr 2015 07:39:58 -0700
Message-ID: <CAMKF1spe7GA=_unkO03b6E3vs6WgPME84C7QK_Y_QBe-JR-jfQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/14] insserv: Fix build with gcc5 and clang
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
X-List-Received-Date: Fri, 24 Apr 2015 14:40:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 24, 2015 at 3:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-04-23 at 20:35 -0700, Khem Raj wrote:
>> Kill 2 bugs with one patch
>
> I don't mind the patch but does anyone use inserv? Should we remove it?

I had a usecase with daisy but it ended there. So I am ok to remove it.

>
> Cheers,
>
> Richard
>

