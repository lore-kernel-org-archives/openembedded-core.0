Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 540AE60C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:42:38 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id v1so2155780yhn.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4F80Rt0sWG8eCc6bD4UzQ1AsaV2O/wscemxUvWCiSa4=;
	b=ZUFZK9ptRsnhDRA+RqfF0Dox3aFDqIQUwlgp8pTl58gaXf5yq/2byY0elcFseoEvrT
	tfSqSODYfINQIqWZvT8hBB51w0uIovgqgaKjof3An4wgG+A/YBCzDIxQPJqEF0M2oBzg
	bQHeRaPHSOaAW+HYpNofVegBB/P4DWsIzPiuYrK2LJyGiMjcRohjqFV8qy6LE/T7Bekt
	obC+1wt6b+5Igm6Dms5KoQLQ7uL+y6IDLdRdlCW7UxGuyCXSEgy3VRwvuOk2gBK4WjUI
	gdYkNOafIKw2AZOauGiVXXf9Fg36L/pan4mTjCOuKlxNga97ZY6+230Q8RtXHM+J709k
	QPCQ==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr50664959yhq.14.1395844959871;
	Wed, 26 Mar 2014 07:42:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 07:42:39 -0700 (PDT)
In-Reply-To: <cover.1395825881.git.kai.kang@windriver.com>
References: <cover.1395825881.git.kai.kang@windriver.com>
Date: Wed, 26 Mar 2014 11:42:39 -0300
X-Google-Sender-Auth: BgrXAyqQ9SYldkNDhlqWAAeafys
Message-ID: <CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Wed, 26 Mar 2014 14:42:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Kai,

On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
> Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.

Thanks for handling it; I was going to address same issue this week so
we could have it upstreamed and drop the Freescale bbappends for it.
This indeed makes my life easier :-) So thank you :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

