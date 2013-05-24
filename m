Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id B6A8D61F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:29:19 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id p14so2975091vbm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=L6PiiuorsO9hNGTzg5z/ygSCZOA9IdBaxk8TW666IOE=;
	b=okGdSCEt5ICMZu0eNOSp7/F3ItkZd5pntPCC+8IFuzoKYoC48AeoysUm63fqSJ/pNB
	WrtFX13jjqAqyI/wYrulwjTMszWiHFn0kciRFrxTU4YERb/yvvd/P5TqlzvLdKP6G8tL
	abuGOHmdrz8piqlFnM5hP9BEZBhvoe8oJwoJuT4ADfWvkPrHmhxBaOl07ltwfitAbw+N
	7Pg2mNU6jEcrMl2hiUkvBx9N49+UdEF9/M/vV6Uy0WAWsax120uLkz3z6x0BKrOpip2a
	fAP6Jg2umXCd1zsNQ1SvV1D+0fGGc2Vt+y9xPnhIBAFiSjar5Q/yLV6VlqF8Z5EsC9cY
	jHzA==
X-Received: by 10.58.255.229 with SMTP id at5mr7914657ved.44.1369387760770;
	Fri, 24 May 2013 02:29:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Fri, 24 May 2013 02:29:00 -0700 (PDT)
In-Reply-To: <b03438668613cd856b4993a5cfaa4faadb17fd62.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<b03438668613cd856b4993a5cfaa4faadb17fd62.1369386157.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2013 10:29:00 +0100
Message-ID: <CAJTo0LZQOpt=KCexQu3q_a4jf6c3ZFUQa5-YhTR8HRQWONY-9w@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQmM4C9HKXKDwjDA1HCi1c3Jw/JYPz2DEALp2Da9GWoJgzxLUyQ6C82c+/T/B646KlQuL+qo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] freetype: Updated from 2.4.11 to 2.4.12
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
X-List-Received-Date: Fri, 24 May 2013 09:29:21 -0000
Content-Type: text/plain; charset=UTF-8

On 24 May 2013 10:18, Ionut Radu <ionutx.radu@intel.com> wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
>
> freetype: no-hardcode.patch does not apply to 2.4.12 version because
> hardcode_libdir_flag_spec variable is set to '' in 2.4.12

If you change the license checksum, please say why.  Handily Marko
just sent the same upgrade with an explanation in the commit!

Ross

