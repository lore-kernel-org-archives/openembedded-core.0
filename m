Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDA372A78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 12:10:33 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so60488423igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZEhhnnYDbE7sPVozdZgBM512x0tcKwIK8LtYuOZpjnM=;
	b=S845EIkZi2rotrBWdv+CXexzg9eUHQgUf3HSpCEh4HT9cevvkdBtzlldb641UfaPyM
	UgLJz++oDr6SL3zU+4y6Ld+BW0NAe6JKqJgldXpJ0/kBjY05396rJpLsTVB8tHtcoMHd
	QiY8ajL9ZxRTnBWenUHhvltDI2A5u65wzStBJkkCE5NQHmDKhnoOHUFrom3YXjwyS1qC
	uT0lpM32wJSOaVlqiIce1xWuWFlflB1sCkwJnwaHSYHV38AC+Jnv7pOBQ8H45+fB7xZG
	DpluNXWyM4FmTJYKPDsMpHha1FMivSLJRf1QmwWcDgoq1bs1M/pnxqXD2DnwtlbmrieQ
	4Bpg==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr11783569icb.30.1430136634506;
	Mon, 27 Apr 2015 05:10:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 05:10:34 -0700 (PDT)
In-Reply-To: <20150427110426.GE2379@jama>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
	<20150427110426.GE2379@jama>
Date: Mon, 27 Apr 2015 09:10:34 -0300
X-Google-Sender-Auth: 2-9AoZ6FIyPlt0tJTTgqL348vl4
Message-ID: <CAP9ODKp+aLJfqSmT_ghqHvn4NmjDn=Bmiu-yNFKqNtj90iXwfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [fido][PATCH 1/4] elfutils: fix build with -Os
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
X-List-Received-Date: Mon, 27 Apr 2015 12:10:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 8:04 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 21, 2015 at 12:53:37PM +0200, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ping for all 4 changes

Ack for all 4 changes

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

