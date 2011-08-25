Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QwiMb-00012c-Sm
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 00:25:30 +0200
Received: by yxl11 with SMTP id 11so2082209yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=uziWDU2ldROWWdowYDESj8XYPnrbUitJyeJApMRP6lE=;
	b=qj/+tA/pH3ckZLu0MZZqrLYLI3Tn6nEFUiO4Cy5SMuaTUTQVuWRmROTtszUv+PDo9D
	oGCELnf3vWBSk8n2MYTAX0Xk5GUn9z6WNuuuaXnG8Y+t7LTeBI+9khGwYzQvFN79y+rL
	PJSxfPYbjUT4TzTu1SLE60vlvm1Eq8XzpXidA=
MIME-Version: 1.0
Received: by 10.101.139.24 with SMTP id r24mr356154ann.19.1314310840310; Thu,
	25 Aug 2011 15:20:40 -0700 (PDT)
Received: by 10.100.4.8 with HTTP; Thu, 25 Aug 2011 15:20:40 -0700 (PDT)
In-Reply-To: <cover.1314305555.git.bruce.ashfield@windriver.com>
References: <cover.1314305555.git.bruce.ashfield@windriver.com>
Date: Thu, 25 Aug 2011 18:20:40 -0400
Message-ID: <CADkTA4MSvO4CoDyQCT6xpth5mqEXUDfre3rLacPoLOcvqHOX7Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: dvhart@linux.intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto-rt: fix qemumips boot
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
X-List-Received-Date: Thu, 25 Aug 2011 22:25:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2011 at 4:54 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Just a minor tweak of the -rt SRCREVs to pickup a fix
> that we got overnight that enables qemumips to boot from the

s/from/to/

But you knew what I meant.

Bruce

> prompt.
>
>
> The following changes since commit 6c2b7beac3cd23ed44bd3e195c6360a0932876=
bf:
>
> =A0classes/sanity: enhance the network connectivity test (2011-08-25 08:5=
1:30 -0700)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib zedd/kernel-oe
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-oe
>
> Bruce Ashfield (1):
> =A0linux-yocto-rt: qemumips: fix boot panic
>
> =A0meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


