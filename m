Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SykoY-0004qF-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:31:18 +0200
Received: by ghbz2 with SMTP id z2so2004614ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cffshyYOtNJEBZKlGq7f0l24aY/AOdG6BGrMDs8bpHM=;
	b=fVEIdV8e15Fbr5xBMmc4qQh7lPknNcVUvxMYj65n9kfvzQJJeXsmK6olBnBNCSqZpi
	/Fuu+z6bDIlIjTEgf6bK6qOTWWsU/raZAL0mwGnnrK5mMGiw7JjyGwsaPGGp3lySKoP0
	q7UqlrBT4ZLZS3ZGgGhm0TwZVeWa4phGF1CAmB/pVaaOyqCHm3UIPObWYK95AjzwDTY0
	uEdq0f5lTxjJKSa0uTcrjV78lHdacEdADlnn3AlN1Mvhwa93iykEDtUxvv0cJAkOYKLZ
	tSYmtI15EsQZhfaQcKBI1ffSIZiWfFpSmGpfBis0ZROhKDbgynfrtC40LQU/ZsCWubWX
	/YmQ==
MIME-Version: 1.0
Received: by 10.50.213.39 with SMTP id np7mr8781185igc.51.1344349171886; Tue,
	07 Aug 2012 07:19:31 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 7 Aug 2012 07:19:31 -0700 (PDT)
In-Reply-To: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
Date: Tue, 7 Aug 2012 16:19:31 +0200
Message-ID: <CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
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
X-List-Received-Date: Tue, 07 Aug 2012 14:31:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 6, 2012 at 3:07 PM, Radu Moisan <radu.moisan@intel.com> wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../pango/pango-1.28.4/noconst.patch               |  408 --------------------
>  .../multilib-fix-clean.patch                       |    0
>  .../{pango-1.28.4 => pango-1.30.0}/no-tests.patch  |   14 +-
>  .../pango/{pango_1.28.4.bb => pango_1.30.0.bb}     |    9 +-
>  4 files changed, 10 insertions(+), 421 deletions(-)
>  delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
>  rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/multilib-fix-clean.patch (100%)
>  rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/no-tests.patch (33%)
>  rename meta/recipes-graphics/pango/{pango_1.28.4.bb => pango_1.30.0.bb} (49%)
>
I don't know if it's supposed to, but it does not fix the pango module
issue for me {1].

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026919.html


