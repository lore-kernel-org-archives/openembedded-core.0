Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4A68A6D6DE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 16:29:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z7so25435389wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 08:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PWNk3ufOmAzNjHBMNCdRMmHnpHUUoaGy4sttQsIWNZs=;
	b=RxUezxmOi4Zq5x90dTBMvHhifY+Hm/kz9TkHKo3Aogsqnn5wcaGjDcskbRWFwr1lfK
	5oVYS5VIFJ2uMd5+bqSoA/9hCIK+U97fjK/yc9Afx0yY0uHs4RXOIblIiTfpm9yf8uYe
	KYmRiwO2DcOTAWqNV4Gl9+Pk8IHbSK6+Z85Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PWNk3ufOmAzNjHBMNCdRMmHnpHUUoaGy4sttQsIWNZs=;
	b=qnZSi5Ag5d5nYVIAtg4exrZ0G0L52+PrrLyHb77HcPbO9eZG+/+vbn254eEjxmJFaa
	KbmdseyQ6MKqasKf9sxIa6Nec7IXCH1JEIRGZAI3vsFyASZAbh1d4YaFBfvvwvJRV123
	MlrHpX9fN09ScU4I0tBgFfjhytVSKiONkZgND5Jifu4BJf/d5womyUM2AgzkDDqoybnL
	F77/Na89dJpe3uSNTUhIEoKKw574ckSqMQZXA7kChk5+Lhf9ezRTiKM95YHncex/17d0
	PextA0N51yat1AZVRWvTTpRt7i+XciBAsbD8H5+tjTH8XcLBkCJHHDRWyQ8TRwLgdDap
	yRtA==
X-Gm-Message-State: APjAAAXob0JSUfkOWZB41AkzMcttmt1QslQTcJRxRUee0XJXZPA51cOi
	aRCIMoK/Ik1PuAy737pX3Wwyzw==
X-Google-Smtp-Source: APXvYqyF+XdsEG0H7vLXlyeXnzxNx2M19BxZttQhkvGfqm4kKNnMd5UUNKFCEU2ougq3+sZpAIkPnA==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr8774364wrt.136.1579364966904; 
	Sat, 18 Jan 2020 08:29:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n187sm15108234wme.28.2020.01.18.08.29.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 08:29:26 -0800 (PST)
Message-ID: <d8c007eed391a3aa4af95f271e4e2f85d604d59d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jan 2020 16:29:24 +0000
In-Reply-To: <fce3863d-ddc4-a3f8-fd90-7e6c1c4168c6@gmail.com>
References: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
	<fce3863d-ddc4-a3f8-fd90-7e6c1c4168c6@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Re: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Sat, 18 Jan 2020 16:29:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-17 at 14:41 -0800, akuster808 wrote:
> I would like to thank you and Intel for taking up this task even
> thought
> the community seemed to have issues with Centos7 being dropped.
> 
> Is there anything community can do at this point?

The work isn't complete, we have a proof of concept so far. The
remaining work:

* forward port the binutils patch and buildtools-tarball changes to 
  master
* create some mechanism in the autobuilder-helper to download and 
  install (or init if already present) a given buildtools tarball for 
  a given host distro before invoking builds.
* build a set of buildtools tarballs that cover the major gcc verions 
  we need 
* release/publish said tarballs
* add config to the autobuilder for the stable releases we want to 
  build using this mechanism.
* potentially test and debug building older releases

Not sure who is going to do this but it isn't trivial and the work
certainly isn't done yet.

Cheers,

Richard




