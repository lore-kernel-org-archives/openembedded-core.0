Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 833D6758A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 13:21:36 +0000 (UTC)
Received: by ieclw1 with SMTP id lw1so34090169iec.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YkWb3/vLjrV4YoNQ09fv0bjU4vzG1+u//202WBl1qMw=;
	b=Fy3cR27QWNum+gFb1WxLe/eyXTNC/vXFq2F6EY7dzFWHF7+f+wxd3Djnqmre5uWUEh
	jFLq/J4t+wDZELl4T1j88olWXblfiWsnQMIWE7I6LMVPsbBNGiRTx3mGJPMDmpdnYXAe
	tSzoI/lMaaZnuwW+8fqqghz/QxMCp/C9OFx966iwdclLvIxGFzgpLlZxyHALeNubKIoF
	pri4Fm+xbr6ZOFHcQOjRIOiS5bVO6DYoBliry9ZhoNcoT2IKAT8Bke6hsbySUxq7BrRN
	HB3TZeVkXMaRV0vYjcGAtAj1fT+8JaUgs4QgBjdC6Dg4y96cc2QNcQyqAq88WjNNPvWS
	CDHA==
X-Received: by 10.50.30.105 with SMTP id r9mr27899780igh.11.1433942497910;
	Wed, 10 Jun 2015 06:21:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Wed, 10 Jun 2015 06:21:07 -0700 (PDT)
In-Reply-To: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
References: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jun 2015 09:21:07 -0400
Message-ID: <CAMKF1sqbdiykJXaR5DboOHqnVqgnhygRPfgpFmKziQFEu5BUEQ@mail.gmail.com>
To: Martin Stolpe <martinstolpe@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 13:21:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 10, 2015 at 9:07 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
> -BUILD_CPPFLAGS += "-D_GNU_SOURCE"
> +BUILD_CPPFLAGS += "-D_GNU_SOURCE -P"

We have fixed this do we need this ? whats error.

