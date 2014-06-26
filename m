Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3B4601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 17:25:33 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id i57so2351431yha.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5vBRc5/kiKaGtrJAznxsZW4JFCU16JY/IUQ0V0z1wQ0=;
	b=YuszbKWCaCjdNGxmF/0X6ltLcvrXZlm6QDHjkYyA/RLzGTPfRJGJZWnDEAV3yy7tBz
	nKgixQFHgbB3M/2Ros9Wwt862zwcIDtIR4UuQqJeQnXbhdsy1t2K4VHM0rtvXw3LOxlh
	1WMSFfKaht2bwKX3vBdGZfIUcn0pOgIg5nSgkvMtj+CPrKPBrXFbDkjEE56joxwhgajZ
	q6tMMEEw4CRorPGxL+W0fQHQmmFiflA7x/Jlyo5y+Ia5WB41qrthqrHxB7IRppBXD3FG
	5ZM+eHQoptGqENOQLRQjviXHu17pG80blmtxfJMBTekt8SnDQfXEb1y53Wq5JwReXou6
	DjKA==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr24571825yhq.14.1403803534672;
	Thu, 26 Jun 2014 10:25:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 26 Jun 2014 10:25:34 -0700 (PDT)
In-Reply-To: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 14:25:34 -0300
X-Google-Sender-Auth: T8kNNjIh-N0JDT-bS5U8iDhRdFE
Message-ID: <CAP9ODKopjX4Jg5rTDLunZnV4xioqP7dCP09o-GB0t4yJxE-L3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Rini <tom.rini@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Thu, 26 Jun 2014 17:25:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 26, 2014 at 9:27 AM, Tom Rini <tom.rini@gmail.com> wrote:
> Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
> that we evaluate it fully before performing the live and vmdk logic
> checks.
>
> Signed-off-by: Tom Rini <tom.rini@gmail.com>

Do you have an example how it used to fail?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

