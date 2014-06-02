Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF1965D70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 11:10:33 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so3611623yha.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WIk9mD8f4iLk/SmGp/wN3R+/AQ53dlWrqdVx/zBIdeQ=;
	b=x7AMSbzs2CDvCp7CkrorBHyfpAyBR/r92rxH4BAaMbVlTBx0KVeG2JkgiYP829cDBg
	r4CQ+kD3tjEUN1x6r5uXBLjylCSOM6X2k43+UCr1uOZiTFMwY6uRZ+W68rX0TKcreY+u
	2eMm9d0K+hMZGKpVyd2G2eL9kiuyvT1BCEWcGeH8+DblDAcxI+Shq/ee6Me/eLxOQujq
	bSN8eawgWmokGJwXP9DMLLcnR84aC3ROa5Ne9wOMTbBr1VfUrOKa1o+0yKohpZHYVspO
	GSPxzMcdlHoDNURe4NnZkK7E1cTnQXFwkEP2fCl83qcp/TskF+qEdVaXkiZ7aD3jG4BR
	nslg==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr50951093yhm.47.1401707434341; 
	Mon, 02 Jun 2014 04:10:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 2 Jun 2014 04:10:34 -0700 (PDT)
In-Reply-To: <CACS+7ZSNrb+Q7NkPpd3rz17ky6=DAuQY2mo0iF-2Mc9cUUxgeQ@mail.gmail.com>
References: <CACS+7ZSNrb+Q7NkPpd3rz17ky6=DAuQY2mo0iF-2Mc9cUUxgeQ@mail.gmail.com>
Date: Mon, 2 Jun 2014 08:10:34 -0300
X-Google-Sender-Auth: WN0fp03qqfnA4tO535tPSIeAUEw
Message-ID: <CAP9ODKrppsS9pUWDEeYNygtQOq7ZBxVLag-aV_1Vov=uOqC10Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Dan McGregor <danismostlikely@gmail.com>, Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gzip: Avoid host contamination during build
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
X-List-Received-Date: Mon, 02 Jun 2014 11:10:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 6:39 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> On systems with /bin and /usr/bin merged the gzip recipe may find grep
> in /usr/bin, while OE puts it in /bin. Force the recipe to find grep in
> the correct place.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>

Great fix. It seems like a good patch to backport to Daisy  (adding Saul in Cc).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

