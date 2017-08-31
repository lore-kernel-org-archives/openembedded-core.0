Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A0B1E78457
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 17:01:04 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d78so2051135ioe.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tyrwNYgKHRIQsNC6X7/CUSaL1UoxAeJUJEPneMeZhxs=;
	b=CJVUhrma7Tli9RErcZTeHKwKDjvukH2H+8m6pSPAKzEqZRIgOEkazGbimYU9AXiWi1
	N361iGj2o18oXfK1QivBvmqMXNp47zGXlQbk8CgFVGqbOktfCkhkMd/XiMgYdxP280yh
	3IYoI4vQysBOiNrQXQCA5xJVhQtC9DHJJ+M79tswHE95JVwwyzNXlfY1jodVNONCx+2b
	lhVI2GW6CN796YCYJ4cQcTbqSgd997mN4GH4NewzQ1eOyjqqUCSjGNdTlli09OhAcQZO
	E9wQl7tbFpycGtRMcMVMdEge6Va08bjLUr6Cj3LeXw1lCYYo1xswi5aiJE/fi3YkPtdA
	RxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tyrwNYgKHRIQsNC6X7/CUSaL1UoxAeJUJEPneMeZhxs=;
	b=sawq5HEEP3daEV8OG+3owNulNCYh89iXZrd2+L3i8P7aFflHDipn5aFV0u3dFfqRC5
	SEctGju0k3IohfwwWI2peQX/ZFzTxAuJib5H+vv1LrvfROAGaLyXV54XEqqBwD62eoOb
	5fJVWrYPCtY7T4mZZlM7NhpyuC823FvEFrdO6dA+nieeQ6oJtw2qpKjUkc2hW3ixWtya
	0nTMISurcqHE+xShUcGTc9FS9kt4DI7Mc7XZvuw3+GTRO2CYu5U2uIxME/lZxHdnLOwD
	kPNXs2G2jYuIuouXxQ5pU7BTgI6a9N61qKwisnK9E1ZxX2/e+u1/CH4sL2zVmpI8ID9I
	dBTA==
X-Gm-Message-State: AHPjjUgIZDvpdLKY43kXKMhKxzl4ge5jNaIupXfxHehl3srgtnDEzXWC
	omjMXfudFvf1QzwJBn+SMemEsCYbssZm
X-Google-Smtp-Source: ADKCNb6xbGEVR4FEDuPZZuXgIRRdeS2ubcla04+Ukgzb1oC+3uE+5x3+cSkuHfP51ZGxuPl+dNeUmPlPTD9HR3+wGWQ=
X-Received: by 10.107.9.137 with SMTP id 9mr4476509ioj.196.1504198862980; Thu,
	31 Aug 2017 10:01:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 31 Aug 2017 10:00:42 -0700 (PDT)
In-Reply-To: <a97b1a6b-c037-e7ad-4e6a-f770439b7ff5@igalia.com>
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
	<ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
	<CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
	<a97b1a6b-c037-e7ad-4e6a-f770439b7ff5@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Aug 2017 18:00:42 +0100
Message-ID: <CAJTo0LaZFrAcsvMf5CHK6QmeNEnxQaJXy7ho7hK=hCvLxc0_-g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 17:01:04 -0000
Content-Type: multipart/alternative; boundary="001a113f8f14e682ba05580f96d8"

--001a113f8f14e682ba05580f96d8
Content-Type: text/plain; charset="UTF-8"

On 31 August 2017 at 17:57, Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

> Better done than promised! :)
> https://github.com/systemd/systemd/issues/6716


And staged :)

Ross

--001a113f8f14e682ba05580f96d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 August 2017 at 17:57, Carlos Alberto Lopez Perez <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:clopez@igalia.com" target=3D"_blank">c=
lopez@igalia.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Better done than promis=
ed! :)<br>
<a href=3D"https://github.com/systemd/systemd/issues/6716" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/systemd/<wbr>systemd/issues/6716</a=
></blockquote><div><br></div><div>And staged :)</div><div><br></div><div>Ro=
ss=C2=A0</div></div></div></div>

--001a113f8f14e682ba05580f96d8--
