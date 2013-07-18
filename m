Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4AC6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:29:09 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id p14so2455917vbm.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3eFqPdGD0n+YUVFsna4ahq8iEuIY8QnphcxAV1lLurU=;
	b=TRfctH3+OXptJoTCVDS5UE9qDjQDBPoh9bV4814ArnMRtpr6CXexazPrpl85WJykmg
	mHbRhw8Ckwue+97QtbHIXwonhrlynnTydF8LuZazJyxb7r+LGbkohveJCVNs54WQpfa/
	HQt3W48fwMwp/MZwojDSbW3I2F2anjwqvwrIpgrB3Rcb2Ctxtac2h/pMIy6Eg/aWB/W7
	eB29X//UfS99arPdbONyLi1Fb+ipU+2bxAes0M38YOFIS41zEf4J5UNLCoBRoaplM0Od
	xxLupX4DuSSgcyzsGwqM0MPfx+twZeVhJuj1DaNvXGllVFXgd4fk56fBF1h2gMdWeFXR
	uIcw==
X-Received: by 10.220.70.145 with SMTP id d17mr1119908vcj.46.1374161349161;
	Thu, 18 Jul 2013 08:29:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 08:28:49 -0700 (PDT)
In-Reply-To: <CA+jg_OUuZvJa4_GfvPKnt-2uwbE08J2SAYeEuv_RTvWoyEBTHw@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
	<CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
	<CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
	<CA+jg_OXXS4UAojhcgZ3vO5ZeMoHsHEQ=0LCz1GVyGDbcTJJKUQ@mail.gmail.com>
	<CAJTo0LYtBmmNzEAdhBYqRAcBVefQnx=-n3c5OvYFXAKd=fsK_w@mail.gmail.com>
	<CA+jg_OUuZvJa4_GfvPKnt-2uwbE08J2SAYeEuv_RTvWoyEBTHw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 16:28:49 +0100
Message-ID: <CAJTo0LaZLhQ6U3Mu74H6CHDYdMiHUM+BpVrvHycwpqoKyMGZXg@mail.gmail.com>
To: Daiane Angolini <daiane.list@gmail.com>
X-Gm-Message-State: ALoCoQnTm2WdqgdIRK3od8HEpEFcBc+LjsU3+eneRrqo9WBEhP+A2+quGl0J/yVIMkL9mIzQb6Gw
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
X-List-Received-Date: Thu, 18 Jul 2013 15:29:09 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 16:20, Daiane Angolini <daiane.list@gmail.com> wrote:
> Please, see attached file.

Okay, that's not saying anything useful.  Does your sysroot have the
cairo.pc file in (should be in something like
/home/daiane/gerrit/build/tmp/sysroots/imx53qsb/usr/lib/pkgconfig)?

I suspect your sysroot is corrupted, so rebuilding cairo might be a
wise idea (bitbake -ccleanstate cairo; bitbake cairo) and try gtk+
again.

Ross

