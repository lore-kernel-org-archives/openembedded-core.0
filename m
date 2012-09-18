Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TE6Vo-0000Pc-Ut
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:43:24 +0200
Received: by eaad12 with SMTP id d12so95684eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ac9SDHXhHsj6N9LJa0yVLD0sIypJ3xznN4Ef8peVIy8=;
	b=PuMZeHidg/bDJxwitaZOohj0AFqey+Pikrp9OvGOeA3ouRhD0ZOJFnTBrAunwYOozZ
	EDuiCwt5zrye+sij7WgKfnKZOSokhMzViUXbNfXoFqkmwjSXdhYjRaNOTNHCBd9W37GN
	4IG+Cxo4ckBqBPoRPeuqvIwxMbgWcm7Uk2C9hf3fXpr5AK8ThAY996wHHvSUAh1GlCnX
	NIJE0e4U7C385xlnZBxRLjuUfEG1xwAEODjWh8RMhnm4iJizW21Ogg4PDKaSu3jX4w8m
	aVEWDWvUWHFTZuvEG1vdGHGYcnav1pyxc4aV1bwPUzaS8gqEvBw1n7SNES84IbU9goc1
	HO9w==
Received: by 10.14.202.71 with SMTP id c47mr1493748eeo.42.1348007444760; Tue,
	18 Sep 2012 15:30:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 18 Sep 2012 15:30:13 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sqSCx4pc_mH6a9VoACPyn6RyLiSgqEoCjbfVgStz=PADw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 15:30:13 -0700
Message-ID: <CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.16.bb: replace patch with updated version that supportds e6500
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
X-List-Received-Date: Tue, 18 Sep 2012 22:43:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 18, 2012 at 3:23 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> It's just renaming the patch, so it's replacing ppc-sqrt.patch with
> glibc.fix_sqrt2.patch - and these are not authored by me... which I
> realize I forgot to add upstream-status as well.
>

OK now I see. The shadowing is there. I dont like renaming the patch.
Is there any reason
why its renamed to glibc.fix_sqrt2.patch ? its easy to spot changes if
it was not renamed

> Back to the patches themselves, ppc-sqrt seemed to be a subset of
> glibc.fix_sqrt2.patch or am I wrong? As far as shadowing I'm not sure,
> I'd rather not spend time testing that, these patches are used/tested
> internally.

Thats fine


