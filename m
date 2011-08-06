Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QpYTG-0005pi-BS
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:26:46 +0200
Received: by yxi19 with SMTP id 19so2090342yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 21:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fAW3aGcfIIlwQWEFZ4VLCn/wSJi5Q5Gzsogj1qIbYpo=;
	b=ckvhSv2tsuBMVmUo6kUsFxDd7DyinZdqLBKvitnq3cMtypTfL6VBhqiqa0hSN+jCmH
	SZKJgmtD0U594r18PjCJuBuPF2ir5chIy8NFylx7txCC03Y7YmlINM3L7A0DhfW4A8yv
	W9XCTnA9KmPcFlBKek1OiVrPMdzigT8nZILAw=
MIME-Version: 1.0
Received: by 10.101.160.22 with SMTP id m22mr1791365ano.52.1312604539818; Fri,
	05 Aug 2011 21:22:19 -0700 (PDT)
Received: by 10.101.86.1 with HTTP; Fri, 5 Aug 2011 21:22:19 -0700 (PDT)
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Date: Sat, 6 Aug 2011 00:22:19 -0400
Message-ID: <CADkTA4NzUdZN_9k48mxmjrc0Oi1YRZq=Xony_hvwXsHiDBeivw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: dvhart@linux.intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Richard/Saul,
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
X-List-Received-Date: Sat, 06 Aug 2011 04:26:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hmm. Sorry about the broken subject on this, it's late and I had a
git-send-email
misfire. The contents is fine, I just didn't write the proper subject:

  linux-yocto: update to v3.0.1 (and associated changes).

Cheers,

Bruce

On Sat, Aug 6, 2011 at 12:19 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Here's a collection of fixes that have been cooking here for the week.
> Build, boot and regression testing has been completed. With these the
> 3.0 kernel tree is bumped to 3.0.1, and some use cases have been updated
> to support building arbitrary repos (for x32 dev testing) and for
> building multiple machines (and kernel types) out of a single branch
> (-rt n450 support).
>
> The patches themselves contain the details.
>
> build and boot testing was done on the qemu* targets. With these changes
> it should be possible to start switching the prefernce to the 3.0.x
> kernel, and we can begin doing that next week.
>
> The following changes since commit 29208d2e353ba2f0b1c9b5d59014a2ea71dde0=
78:
>
> =A0local.conf.sample: Comment out BBMASK by default (2011-08-05 17:19:51 =
+0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib zedd/kernel
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>
> Bruce Ashfield (4):
> =A0linux-yocto: pass KMACHINE to updateme, not MACHINE
> =A0linux-yocto: allow configuration of arbitrary branches
> =A0linux-yocto: update atom-pc preempt-rt definition
> =A0linux-yocto: merge v3.0.1
>
> =A0meta/classes/kernel-yocto.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 16 ++++------------
> =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =A0 =A0 =A0 | =A0 14 ++++=
+++-------
> =A03 files changed, 12 insertions(+), 20 deletions(-)
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


