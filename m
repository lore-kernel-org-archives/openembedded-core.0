Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TB8h1-0004g6-Kt
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 20:26:43 +0200
Received: by lban1 with SMTP id n1so1331677lba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Em8P+ksFfp2pXfG1rtkF5ZRhVlsIBMtY5G94gfdJk0E=;
	b=r5CY7NjtGMtKY3OUQk1Ndy73PdpMt5XOQQzpjLDphdOnDxqHx33byvMDz01hHJubBX
	GcHVBW2qvma2rj61OiGB5+pqMKBTJNMGYaCnldOqgRX3UTFHPBUNoEimk50VAko8Dk8V
	Jj2mCWpBij1T3o8c9xjUX0zsD/qTAQbEiN0NXTqyWkPLrvp3f53TIGWQCGgFRdedTmD7
	WVPvc14uKAg4vCRmB8gOAxR7SXSlcQQREm6cjN2tIEbqdeYSbdT8cpRAS4KCY9BjK3qO
	8PHqQPtPKcL9owjXbxtaNX/cIX6ktxfMYA4sfgh9lZ6iPw+ewm+hRO2mvy4Wj8DhBXCg
	jtFQ==
MIME-Version: 1.0
Received: by 10.112.83.8 with SMTP id m8mr5271561lby.115.1347300853639; Mon,
	10 Sep 2012 11:14:13 -0700 (PDT)
Received: by 10.114.68.20 with HTTP; Mon, 10 Sep 2012 11:14:13 -0700 (PDT)
In-Reply-To: <cover.1347300360.git.bruce.ashfield@windriver.com>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
Date: Mon, 10 Sep 2012 14:14:13 -0400
Message-ID: <CADkTA4MuOWkEuGXOjJZRUriyvEFKyOYGFZmcr3WUW-6g+Wx-wQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto: 3.4 kernel updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 18:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 10, 2012 at 2:11 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here's a small bump to 3.4.10 (32 commits) and an update to
> pickup some configuration changes from TomZ (no impact on existing
> features). All in all, it's a nice set of small fixes, with no risk.

s/no/low/

I'd blame autocorrect .. but I'm at my desk!

Bruce

>
> Cheers,
>
> Bruce
>
> cc: Tom Zanussi <tom.zanussi@intel.com>
>
> The following changes since commit 21816355c00eadb2273d61b456f06239ca300b47:
>
>   bitbake: cooker: fix handling of exceptions during exception handling (2012-09-10 13:14:08 +0100)
>
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>   linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
>
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


