Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 283317C72F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:18:10 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id 9so3660772iog.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OqbAJGxL0IkvGd4woA5UnvHM7mxv9hR3OWeasidhsw8=;
	b=YJIJXKzB5YjNPipTIEeef0ZmizUHPGLbhpRyDODJZHk/5dgehwsB1l8vcF3pIKLntk
	2Ed6SrGR/gHlyKRLJhDk2mllkq+8RXH0yq7CMy/6h6v3Z3QWNVRO6LITFluQUjSrXTva
	4rpRaUpgVj8/Co0j31TOXs7r4ycE34Nl91gV0pZ3pzmihH7CkUgSYKpKkOzArAOYNL12
	zQ8aQ6MDVuzfIyS2NFx1xJwNqzluf6hmqWYGeRFjq2ATdG3BXoDOraEBPA5QYto2/hAz
	FLyf+0sPhhUB44XdqtR/TmQD9rwJ6VRTUDNhb4H2TLkq6P8M3aQb8TT6zXFSR7Qgt89z
	pbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OqbAJGxL0IkvGd4woA5UnvHM7mxv9hR3OWeasidhsw8=;
	b=LIO/7TI9uFJhDSs0P3lHgsBUKFIob9dYYAzW/RXhz5zqkRxlvY+eUbmMZ57TbgUvth
	nAkhmQxgJhyZqAOu6/OvP9cUXIouzO8asGU4TWOBlQMeNxr/eDANnrvOKSzQ99+lXt0G
	RixD+/hSNcSltwMryAnh30OOSvD9z+KPqGgipClKEHEkd+WJ8Ek2mKtSRR7azsDc0awu
	+QAZBlS6g2JxdyNvj/EW+ZWl4bBNbWwj/GIsjYyRORtq3zcUxwy34yxGJ9AnvCJCXy6+
	IbfAZhLDaznVrE8enEMeOYb11hIe9sod9anZ+rO+M7GFqWe37YuTz6Orz+TJb1R7cw4U
	oFdw==
X-Gm-Message-State: APjAAAW4ox49/knIyZZgvCz8y1UmU0UQ1U6MdhSxw9jWbl5g2z0uS6pl
	CAC29j3Pp4kBEoIrByKyzckvE3w+8whY+7oegpuxCQ==
X-Google-Smtp-Source: APXvYqxKjhguZJVQo3WTDyD36y5EgE0vwrIbTlqAgDH0FSHVhgctfpbH4mVxjXkVYxco8HjYgCPW9QH3XlbdVB+VscI=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr8481328iom.270.1551698292028; 
	Mon, 04 Mar 2019 03:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<20190304111117.16769-1-luca.boccassi@gmail.com>
In-Reply-To: <20190304111117.16769-1-luca.boccassi@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2019 11:18:01 +0000
Message-ID: <CAJTo0LbmxKG-CbZb+EwbnthF3Z-uLj99pPCumPwiVpatjrjaAw@mail.gmail.com>
To: luca.boccassi@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] swig: fix build with musl
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
X-List-Received-Date: Mon, 04 Mar 2019 11:18:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2019 at 11:12, <luca.boccassi@gmail.com> wrote:
> +    mkdir -p ${WORKDIR}/build/Source/CParse

Use ${B} instead of ${WORKDIR}/build.

Ross

