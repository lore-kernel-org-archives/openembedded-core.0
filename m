Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC17D76724
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:10:34 +0000 (UTC)
Received: by iodb91 with SMTP id b91so42942314iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 23:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Scc1GuUCEsoYCHCaLVdbOsUWQBjSgmvmB3puwpyju3Q=;
	b=rHDVdJskbUL3UTMPCzbCa/iYt+lFwYFZv0nawsx1C6G6T8z+Zs24rO0uRHoABiFVHl
	NHnikweiiH+E5K2HqQi6uwJkzNmwn+Bw/JLvujdpiw3a2x992EeW7ti5yd3C6ct+/XS8
	Y7r4lT1Vhmtsdn3sCB+94fntwcq+Ghi96rT5ey5QDar/Z78hWk9/CGVlSL+YKQFEwCfE
	DR5OrYmGO5fjsC/CWdwGoazWBZypB77v5YQkKVHru+Lc8vw76sJmENEaDdzHlV0N578Q
	ZNOkxiYO7qLrplURF2trujlcu+w2n6Xfz7LB1ez4lVR6zmBmhb9XUMtTD4c4RMbZeCuc
	4UJQ==
X-Received: by 10.107.168.145 with SMTP id e17mr6154285ioj.112.1438927835045; 
	Thu, 06 Aug 2015 23:10:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 23:10:05 -0700 (PDT)
In-Reply-To: <1436601450.3310.27.camel@linuxfoundation.org>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 23:10:05 -0700
Message-ID: <CAMKF1so6WXDiC8_vbY-XkXfqqcwGM12gSkRD_xOL9eFSZ4OR+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Fri, 07 Aug 2015 06:10:39 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 11, 2015 at 12:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> As someone has volunteered to maintain the pre-GPLv3 parted recipe
>> (and I'll volunteer as a secondary maintainer, if that helps)
>> hopefully there would not be a "serious maintenance burden" on anyone
>> who doesn't have an interest in the older version.
>
> This does touch on something I have wondered about for a while, which is
> whether the time has come to move the GPLv2 pieces to their own layer
> and possibly their own maintainership. Obviously there are pros and cons
> to doing that.
>
> Thoughts?
>

interesting case, although, I know lot of real usecases of OE which
disable GPLv3 distro wide and in fact is considered a strong point for
its users, if we were to maintain them in separate layer
this would be fine but we will send a wrong message to users since we
have to clarify its not all gpl2 code but only the code which is old
and has moved to v3 etc. can cause confusion, OE's users are a bit
different than desktop distros. Now if we were talking about moving
all of GPL recipes to layer of its own thats a separate case and may
be more useful but is that possible ?

I suggest to do a survey of its use before dropping it out.

