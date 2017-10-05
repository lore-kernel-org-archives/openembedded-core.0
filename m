Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id ADB6A71971
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 22:10:03 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y44so5250486wry.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 15:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6+ResDuo8S2wII6rwwaauPgoaETaeemk3R5kBNurm7k=;
	b=hFNfYkjhEP2gKwsAWwmhPfbmJdb30GSBqJxn655sLvsFM8dd8OqKnJL4dUOVtQxXm8
	+Qm8wHgWGgKYU/Km8oTanN1NJsYt/BHpeD7gg9cJgMmC/tJEXcb+tle4gxaKx0OvKDVC
	Kg77oAIo5xiM6Y+5cqvwdgyjJLGsgJl5znqkctT4A+cIfjxXyGlgHetEJBc+xIePKDe5
	+UXNt8WhLXrxmmCf0XnI07NugagmxXmcRiC1R4tu8tOuoL+KOial6TEc/YFFF7xugXgM
	s+kBk0OAvAayUiMiTbazM9kd1OPIHkTK9oVKaXWnTLo+kla5CCREQaKnfVzda73FpBhU
	DwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6+ResDuo8S2wII6rwwaauPgoaETaeemk3R5kBNurm7k=;
	b=UT3dOa1oar/OC6xm+uXzT0oAgsYvptNlb9uzTrizxPmX3JkROl3aSt0Me1+FgISe0D
	wVXtM5OpChf2IyLhMoCLl09ePCisLidNgalxI/XcS7daBbppQPAj35aOO5Zbrlgc8p+k
	91oPSV/DJ2HZftM8CV54jdCYkGqvKoktwUM9Fartj9emozm91zIcXYCK/xXdQKPy1L32
	czSQf1sSgn7ySThVrb822uYiQwODNELbdArX+KuJzsFGz6erHHX6OJHNRF9gxE+2gnE9
	ICVXNl1/lX8x51pJnDpjRoTsw7/kX/LufQDGN+E7Kz3CI6ArVZ3HmjPMqO4YmtZepp8l
	km2A==
X-Gm-Message-State: AMCzsaXRormABB83H+sHXtby0UoxHUJ0yfj5K5/zf1s1LwCDnwuNCtI7
	QXX4qqiX0vXHBH9kqkCDpXuShVid4oRHxN4LAw8=
X-Google-Smtp-Source: AOwi7QADxeNYKukfJbAGOuqWboiynQbhJ3mRz4JGVM/1V0/YTDd3UpvFsQMqWS2Mvt9VgSOxuihLVXlMiG9A+NjKE8M=
X-Received: by 10.223.161.141 with SMTP id u13mr105501wru.140.1507241404154;
	Thu, 05 Oct 2017 15:10:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 5 Oct 2017 15:10:03 -0700 (PDT)
In-Reply-To: <20171005164447.48dc7a86bd86519f67a3a41a@linux.intel.com>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
	<20171005101918.282f15658ac2a600e3c4c251@linux.intel.com>
	<20171005164447.48dc7a86bd86519f67a3a41a@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Oct 2017 15:10:03 -0700
Message-ID: <CAJ86T=WdwVG5sqj70FZ-AEw7+CYu0dNvqqXBCxwp2jPP_bogcQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Thu, 05 Oct 2017 22:10:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 2:44 PM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> On Thu, 5 Oct 2017 10:19:18 -0500
> Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
>> On Thu, 5 Oct 2017 16:49:28 +0200
>> Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>
>> > =EF=BB=BFI'm confused.
>> >
>> > Layer "meta-xilinx" defines:
>> >
>> > recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
>> >
>> > This recipe is too old for my liking, so I made a newer one in "meta-t=
opic"
>> >
>> > recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
>> >
>> >
>> > Much to my surprise, when I build, OE picks the 2017.1 version and not=
 the
>> > 2017.3 version.
>> >
>> > bitbake-layers show-layers reveils:
>> > ..
>> > meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
>> > meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
>> > ..
>> >
>> > so that means that my meta-topic should win even if my PV were lower, =
right?

Yes. The comments in bitbake/lib/bb/providers.py -> findBestProvider()
explain the process pretty well:

  If there is a PREFERRED_VERSION, find the highest-priority bbfile
  providing that version.  If not, find the latest version provided by
  an bbfile in the highest-priority set.

The only caveat is that if PREFERRED_VERSION contains a wildcard (%)
and matches more than one available version then all bets are off and
results may be unpredictable. It's up to the user to ensure that
doesn't happen.

Note that looking at the meta-xilinx recipe it seems that PV is set
manually and doesn't follow the recipe name, so depending on how you
set PV in your new recipe, it may not be completely obvious which
recipe is actually being used?

  https://github.com/Xilinx/meta-xilinx/blob/master/recipes-bsp/arm-trusted=
-firmware/arm-trusted-firmware_2017.1.bb

