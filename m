Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SINcx-0002o3-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:16:11 +0200
Received: by qcso7 with SMTP id o7so1392406qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vRfFQBhnFvEO6Fqrht0ZxSIj3LtFk8XYAarStVY4tIM=;
	b=FbeQRVDe3I+CjdsAJS2nHf6lEOpEuv3WfPxLvgvPvy0kR5q0Erw9hA58JsGDl14aT8
	RyUINqSCIFduUg2AzF3SqjwLycO3kXGhWQd8WvNUz5kilXVt1l9Fg7fKAy7AwPEfhutB
	sE44fX7E2YNLJytY0tZd4Vt31mSH/F1SBSOE2MsquKJOYc+BaJM/bvz3XXkvI0+EXvrp
	25sxuS99lZ9gn2Ac2FFtzWQ+bxXE1FnL+RB9LFY0+2VcjBy9405fYRkeRSzATq8oXfiv
	NdzlBJP4ugh1lJTEHjvauXyDmOPfyqu7TXSbndvVUDW4o0NpfNidEeP/GaIOmbd7Gey9
	qrpQ==
MIME-Version: 1.0
Received: by 10.229.61.66 with SMTP id s2mr1365911qch.30.1334250411262; Thu,
	12 Apr 2012 10:06:51 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 10:06:50 -0700 (PDT)
In-Reply-To: <1334246884.7309.40.camel@ted>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
	<CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
	<1334246884.7309.40.camel@ted>
Date: Thu, 12 Apr 2012 10:06:50 -0700
Message-ID: <CAGDS+nk+yTmthqFi+EeC9FZY49Fyiuyis1F3B-1+daa_tYpBEw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 17:16:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 12, 2012 at 9:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> For what its worth, bash here does Provides: /bin/sh so I'm a little
> puzzled about what is going on here. If its not doing that, it would
> certainly cause the error you're reporting...

Hmm . . . while I see:

Provides: /bin/sh

in bash.spec, it is a different story in the pkgdata/runtime files.

busybox has:

FILERPROVIDES_/bin/busybox_busybox: <snip many filenames> /bin/sh
<snip many filenames>

While bash doesn't have a FILERPROVIDES entry at all.

Could this be why rpm doesn't realize bash provides /bin/sh?

Steve


