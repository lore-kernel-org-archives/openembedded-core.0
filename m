Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6EE47850C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:33:13 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id k135-v6so2607172ite.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nsxa6sSXMJyGhwMcKiSfEFXBwrV/qomUyt+uuyXRq/4=;
	b=t+So5pe/wZQviZgTLvq7RA2MgEzFaKNWAEfkV2o8UUon/kVORFfWwS30XYlkDyAl91
	gGkwys7hPXLbE8HfOEl9kH/IFlhjkke6jtCF5vG+TukOREB6HGX5GfG+ffEvYPE0nbHR
	2lS6CXUrEqhnzL4opDkAOulY8IfLYFiuFBNx3FBUarg8xASoE6bJlRUNWwVN78nc+W/6
	sLo1njEdH8A/7IwpLMTK26kSvTEDH/GkfGa1xXTgzPP1Vh+N3lXDsSw0HSBPtemErHBl
	v3vj2iV2zZ6r7yAjmoQPyhUzvLoRyEdUoNx4rl8tLiE4Y84/j9uKQ9mlapGag3yLAudn
	R+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nsxa6sSXMJyGhwMcKiSfEFXBwrV/qomUyt+uuyXRq/4=;
	b=J1CXSGQUUoOck7E1ZKUKfWsTPT+/56wZxi6eHk/4KJOFSNx+FGSdRQIn326sl6q1hO
	0dByVCZh3+09BsZo1kUt100/HlLmB7IJKw4Lg+na65FmHYvkhopvqV+LwibKM0fqAYZ1
	yrBomo+cA8f2rJmTPLb+PQv9BnDqC5itSxEAaMXqVaIlQb4By5HHxpxMzL466m4eg8r+
	is//LWcdMg+MCGrP5rXzVpUzY2nmp7Zv46QSTnGMVT3TrbXSj/kDWgIN16Us3e5hTWse
	34CxFdKPGJuHccBOWVhx7xCrXmqKJN3Q40vL1qim/nD8LzLEvfujrOQNJWCpUYhshOcT
	Mp7w==
X-Gm-Message-State: AElRT7GHCXvoKqD1PSm1OX+Puf3VeCH+gqv2AFgJlZ0s75P0FSaCoC5w
	EU1ln+wf5rrRsPwPUpUe8chaEt/Y+OMtQ8REUODPCA==
X-Google-Smtp-Source: AIpwx49bjPil5pZcxqH1brqr29zJBDZLzFzL0IvKfjyG7tqckNymGQk4nVIFOHC3+R9O3ezQS7xrr3fHceRdrRS9q10=
X-Received: by 2002:a24:1f15:: with SMTP id
	d21-v6mr5582222itd.45.1521811994905; 
	Fri, 23 Mar 2018 06:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 06:32:54 -0700 (PDT)
In-Reply-To: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
References: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 13:32:54 +0000
Message-ID: <CAJTo0LZkv0kmeVMM0SHAs1=FybNVoRLo-w01N4Ygzs4BNsFqSA@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap runtime test, ping for outstanding systemtap fixes
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
X-List-Received-Date: Fri, 23 Mar 2018 13:33:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Victor,

Sorry for the delay in these, it may not have been obvious from the
list but M3 has been a struggle and then it was ELC.  I'll put these
on my list to review today.

Ross

On 22 March 2018 at 17:53, Victor Kamensky <kamensky@cisco.com> wrote:
> Hi Folks,
>
> Based on my conversation with Richard during conference please find
> patch that does native SystemTap stap basic test. Note it is for native
> stap use. It is not SystemTap cross compilation test that Ee Peng
> is trying to cover in [1]. Actually, I wrote this small test before
> I saw message from Ee Peng for crosstap test, but I did not have
> time to post it.
>
> Note native SystemTap stap run on qemu machine only feasible on x86
> qemu. IMO it would run too long on qemu target with other CPU types.
> Test should be executed against something like core-image-lsb-sdk
> image, otherwise it would be skipped.
>
> Also, could someone, if possible, please merge outstanding fixes for
> systemtap [2] and [3]. Khem did ack on both a while back. Currently
> with 4.15 kernel in openembedded-core systemtap in native or cross
> mode is broken. Test I am posting would catch current breakage. When
> [3] is applied test would pass.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148972.html
>
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148348.html
>
> [3] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148349.html
>
> Thanks,
> Victor
>
> Victor Kamensky (1):
>   oeqa/runtime/stap.py: add runtime test for systemtap
>
>  meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
>  meta/lib/oeqa/runtime/files/hello.stp |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
>  create mode 100644 meta/lib/oeqa/runtime/files/hello.stp
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

