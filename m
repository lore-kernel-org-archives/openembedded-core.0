Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (unknown [209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC7D65E37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 21:12:08 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rl12so2833848iec.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZNLkr0EQsa+xdjgHxCpNmRP5/t0sW9MvXLk8shzMo0c=;
	b=Wix7D5JZrA/UCu6XTkwwyLmTVEsmkjjip2E043L27hmJYKkq5oM/LdPzqpf0/CI853
	QUe3J+fYLaIyctj3QjzNT4HI759RSbbgSG8q2NrMleQJsNaNHOOyw+6K0Nv0DDZz2UbJ
	OiIwuXL/eriXIIrP1/LAuuPzo/R/O/PtPyhtJLCCBQuR5CE+ghoRRZTODSmvPm+5e8Bi
	/ieQtweYKApTolnIho9VgV5U8wihjFmRQTeZs+NGkMPtxVcCSVy9TXchRAz0p5WPBLAp
	ZHEG3bqL1j8nRBD57k5OF2tJmfknTpk9NC6eZYMBymPPstOA+IUBvCm4MDnz1OYwQ3QG
	mh1g==
X-Received: by 10.43.62.204 with SMTP id xb12mr35267383icb.51.1400533930097;
	Mon, 19 May 2014 14:12:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Mon, 19 May 2014 14:11:40 -0700 (PDT)
In-Reply-To: <3ca9244054e803966bbe4cccf29a1636b675a20d.1400486523.git.Qi.Chen@windriver.com>
References: <cover.1400486523.git.Qi.Chen@windriver.com>
	<3ca9244054e803966bbe4cccf29a1636b675a20d.1400486523.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 May 2014 14:11:40 -0700
Message-ID: <CAMKF1spDjGZ2mBAQSXQsySNZJ-anqw-zmPOWCtSb+PYdVS+4xQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu-internal: add "console=ttyS0" to ramfs image kernel parameters
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
X-List-Received-Date: Mon, 19 May 2014 21:12:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 19, 2014 at 1:03 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> +    KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"

is this valid for all kind of qemu machines ?

