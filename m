Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 159E275538
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 19:44:38 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id p125-v6so25010012oic.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w0Q7SRyoOaa44+qJ4qD6CzP9gNWrrZafEKMdHrMPcok=;
	b=QVAPnqdbwIe/3f//Ft1Gr7JADYQ35gYSQc1UpvQjbUhDjG9MdfSNVwTVQwMZS3xS8+
	egHeMRiDHUXywKfjzfI8y5c+j2ubIp+hhFzCc/xRqfWL+aunw2E5JwoqI2qWRO6Uhiah
	ePSaRVMVHyM+ZeC40tIOe74tsOY894dJDk0tGXkSsz4Qy0nQgwPjPSz5I8RQtWF9REPd
	1jTLLEtCAb1dtUORczP/M1oLBoNkSn4wR7IxFwdvSdtaBWuXpm7DkVH55UDYcigwHNtB
	ZrMwI2rOTAruTnez1EVUCMdUHgH9j4hXNjr5rnJWXIIVPnwtU2zbjiM6sC/zu7mbCXGB
	tOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w0Q7SRyoOaa44+qJ4qD6CzP9gNWrrZafEKMdHrMPcok=;
	b=JxSJWbCIOAEzovWd1qLqhAPw6IlLAKcCL2skNYHlzhdpVvmI3ymlH4QPrugBCQ7Lcw
	l3keJ0CuI0wORxRuXs7GrnfpPNT37aeFP1EWTP/2YVcEU4qDWUIF8ONwm4Ks0Ahfbsrw
	gog4FEzBEPlQKnDbMk81iMCuY3AIEXqTTiVJlN3u1zpE7Ka+e34eMLYOrfWdEnz++D79
	v9S6g72/oBISYgqFi3ZdpH4UNYThN/wmwgemUwOHSeJ+yuA4AfwD+3k1wg2Xe26Z3tp7
	ISAVi2IJID6llQsWou+HiqaBY5OygKRw2/hoMeEGqFHXwzxvU5B600WJwGKbxCIZ7qbG
	EPMQ==
X-Gm-Message-State: ABuFfogNVNyyNz0PUVj/5XP00vxPgFo+8S8yqXavELt2XBRy4f1l/WKN
	wjP0PFYY/5c1HTjPbAlHFfE1JWqLhG2rWhEh7eGFTQ==
X-Google-Smtp-Source: ACcGV62774Axihk09GQHkb/WfzhQmBJ9wNhb5YG2gd8vUcD0cF8tK00LeCCbLXNqFJGeuUvBHXNxIYyyW/qlMAtOiRU=
X-Received: by 2002:aca:5485:: with SMTP id
	i127-v6mr13152936oib.293.1539891879814; 
	Thu, 18 Oct 2018 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<20181017104243.801-3-pascal.bach@siemens.com>
	<CAJTo0LaPjCyHwkoBo8+_9KdfZ+U+WVO+ZHkKnNgtyy7Qy4PErg@mail.gmail.com>
	<36afa372-0235-b484-e056-94c6d6d3ea1a@siemens.com>
In-Reply-To: <36afa372-0235-b484-e056-94c6d6d3ea1a@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 20:44:28 +0100
Message-ID: <CAJTo0LbSs5TsCvpE4z3pUSOH00iCxti09ym-7GaswCKEXZX9Rg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/4] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Thu, 18 Oct 2018 19:44:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Oct 2018 at 16:05, Pascal Bach <pascal.bach@siemens.com> wrote:
> > My suspicion is that for systems where the host has python3-devel
> > installed, libcomp-native's cmake is using the host python instead of
> > the native python in the sysroot.  I'm not sure yet if BOTH means it
> > searches the host before the sysroots, or if it is finding the python
> > binary in HOSTTOOLS and then asking that what the paths are.  Either
> > way, it ends up linking to the host libpython3.5.so and going into
> > sstate.  Another machine in the pool reuses this sstate but it doesn't
> > have Python 3.6 installed, so the library link is broken.
> That is definitively not the intention here.
>
> For target builds it is pretty clear that there should be no usage of host dependencies.
> For native it is not so clear to me. There seems to be some dependencies like the compiler and associated libs.

I think ensuring the ordering for native searches is sysroot then host
would be sufficient.

> What I'm traying to solve here was to get rid of these two lines in the wireshark recipe [1]:
>
> -DM_INCLUDE_DIR=${includedir} \
> -DM_LIBRARY=${libdir} \
>
> As they effectively add /usr/include and /usr/lib to the search path of cmake.

Well that's terrifying.  What is that trying to solve?  It's building
for the target, right? So why is it passing host paths?

Ross

