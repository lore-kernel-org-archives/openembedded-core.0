Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QudsK-0004Zy-Fz
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:13:40 +0200
Received: by yia28 with SMTP id 28so2547247yia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=WYcICiMIdLuAV6oKHWqM9z1zsMYuZwlnhxo5pYfygdM=;
	b=uHI4ymxDTdCdr23sraVjdagj47oASk6uwO1uavtHDtdapjEV0vNR+a1zHlsiOhlB3W
	P7u/3fx3CIisLgu3MgXazZDTAHx2SWQXKAetNX9DPXT0z07D12E/zZ8sFKwp/4uNDahn
	GHIQDMPAeyTRjWRT49ELqmdzu8fbgg674jCEY=
MIME-Version: 1.0
Received: by 10.101.179.21 with SMTP id g21mr127426anp.54.1313816937394; Fri,
	19 Aug 2011 22:08:57 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Fri, 19 Aug 2011 22:08:57 -0700 (PDT)
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
Date: Sat, 20 Aug 2011 01:08:57 -0400
Message-ID: <CADkTA4Mgg7j=HtLLCaB5GAvBfnvYxfGtnLH44ee8hVdR8AnTcQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: dvhart@linux.intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 20 Aug 2011 05:13:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 1:20 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here's a consolidated set of changes that I've been testing with
> for the past few days. The patches are pretty much self explanitory.
>
> 1/3: =A0linux-yocto: restoring LINUX_VERSION ?=3D "3.0"
>
> After discussions on the mailing list, we are going to go back to the
> 1.0 model and not cycle the version string of the recipe. We'll revisit
> this post 1.1.

I've repushed this series with 1/3 dropped.

>
> 2/3 =A0linux-yocto: move more default values into linux-yocto.inc
>
> While working on documentation for extending linux-yocto, I moved some
> variables into the .inc file to simply recipes based on linux-yocto.
> I haven't updated some other recipes yet (like the -rt one), but will
> do that once I can test them.
>
> 3/3 linux-yocto: update SRCREVs for 3.0.3
>
> Updating the SRCREVs to pickup 3.0.3, this also picks up the meta branch
> updates for emgd and hpet.

And this changed to make the kernel version 3.0.3.

I'm sparing everyone another patch posting, but let me know if you'd like m=
e
to resend.

Bruce

>
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Darren Hart <dvhart@linux.intel.com>
>
> The following changes since commit 978cdd5cb5b445f1cf406296444cb57cd8aa52=
6a:
>
> =A0kernel: restore crtsavres.o to enable building external modules on pow=
erpc (2011-08-17 15:56:07 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib zedd/kernel-oe
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-oe
>
> Bruce Ashfield (3):
> =A0linux-yocto: restoring LINUX_VERSION ?=3D "3.0"
> =A0linux-yocto: move more default values into linux-yocto.inc
> =A0linux-yocto: update SRCREVs for 3.0.3
>
> =A0meta/recipes-kernel/linux/linux-yocto.inc =A0 =A0| =A0 =A07 +++++++
> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb | =A0 21 ++++++++--------=
-----
> =A02 files changed, 15 insertions(+), 13 deletions(-)
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


