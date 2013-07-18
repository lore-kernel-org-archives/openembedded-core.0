Return-Path: <daiane.list@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8156A59F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 16:55:51 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so3396977pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hMSxQKB0ijAoQikIcdzAkFHyFVSPuZ84HgMKb12zW1c=;
	b=dLRdgOn61vdXizNJDxsdvq4263365iOmw3toNObZY/K+H1rKYTAcM4bfK5CEOoYa5a
	9Gc+BwDrtecBRHYQlRd2utjvo6FKiCE+3uG9KyFhvdY/nSKNoL2SzRCZNYaggIBZ09ci
	tFympXr3wtHePadSMBi5rYsi/ilIK65uYsq68zG9rnG8o1CtDHxDI5ATUWuypRXoQ/rl
	X6ShdFBB3N8DoCmk8fMK51r4Qrq4epPlm0iiiyI0lmuPTwt260WtFbzIYcAXraZBqdt9
	qH85Q+l/xiNzTAPlgTbGci0J5K68CuHBeZpho3rcabVJKAUdd1JH32HUeGvaSvzX6o1l
	x18g==
MIME-Version: 1.0
X-Received: by 10.68.52.200 with SMTP id v8mr13112446pbo.48.1374166552345;
	Thu, 18 Jul 2013 09:55:52 -0700 (PDT)
Received: by 10.70.20.225 with HTTP; Thu, 18 Jul 2013 09:55:52 -0700 (PDT)
In-Reply-To: <CAJTo0LaZLhQ6U3Mu74H6CHDYdMiHUM+BpVrvHycwpqoKyMGZXg@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
	<CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
	<CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
	<CA+jg_OXXS4UAojhcgZ3vO5ZeMoHsHEQ=0LCz1GVyGDbcTJJKUQ@mail.gmail.com>
	<CAJTo0LYtBmmNzEAdhBYqRAcBVefQnx=-n3c5OvYFXAKd=fsK_w@mail.gmail.com>
	<CA+jg_OUuZvJa4_GfvPKnt-2uwbE08J2SAYeEuv_RTvWoyEBTHw@mail.gmail.com>
	<CAJTo0LaZLhQ6U3Mu74H6CHDYdMiHUM+BpVrvHycwpqoKyMGZXg@mail.gmail.com>
Date: Thu, 18 Jul 2013 13:55:52 -0300
Message-ID: <CA+jg_OXaYXVPbTypA6gQLYTOjW3u+OG=5ZvukURERc39ice4dQ@mail.gmail.com>
From: Daiane Angolini <daiane.list@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 16:55:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 12:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 July 2013 16:20, Daiane Angolini <daiane.list@gmail.com> wrote:
>> Please, see attached file.
>
> Okay, that's not saying anything useful.  Does your sysroot have the
> cairo.pc file in (should be in something like
> /home/daiane/gerrit/build/tmp/sysroots/imx53qsb/usr/lib/pkgconfig)?
>
> I suspect your sysroot is corrupted, so rebuilding cairo might be a
> wise idea (bitbake -ccleanstate cairo; bitbake cairo) and try gtk+
> again.

I think you're right.

Now I got this error:

| checking X11/extensions/XShm.h... yes
| checking Pango flags... configure: error:
| *** Pango not found. Pango built with Cairo support is required
| *** to build GTK+. See http://www.pango.org for Pango information.
|


I will keep cleaning all packages until the complete dependency chain is clean.

When I first faced this error I had just rm -rf tmp folder. I did
think it would redo anything needed....


Thanks a lot for your time ;-)

Daiane

>
> Ross

