Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD5117F730
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:19:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r141so6057452wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=isHyzdb++8fbd+If2NCCdoenHCfBgD+tpzbHHfKoVqg=;
	b=kZynkSpk1TqfFdfRA3s8aBIbVKOz6Ju++l1QYBQvysiOGdByo7tzLs4Uow6wBu/vwI
	jUsM4IgQ+eWrlMMblOR8rH8or3v9JbrQpBJmZjg/9Modj1OD+XO/p05fyxisLV5OZlQL
	nlHiJU03YbEoQJ4HNwOznz3ew4foviOs8xi5K9J1ssL+g+xuarC/Dj9uYFkyViDiwhPK
	c8pmDGtsxztcDpSNqJWMdvjHeGwU+3r/6FgVEMFCcXw9Poc18KJDMDFKkigVNdRewTDi
	YauQjnmG3hVcw77he0nl+zT0FKCxqdos7dee/C9nwdGCTG4e+aCNgQ6hDDSH65jpwhU6
	+TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=isHyzdb++8fbd+If2NCCdoenHCfBgD+tpzbHHfKoVqg=;
	b=Pp2W5G+sf1OM5ZNs4MXnZmPdFTy5H1Q5utd93QGq87r2XQri5328N+9RjI1kyDFc9s
	Hcb1qz9vouXhP1+kC3uunuzlvnMKoHIZhSg9lC6Zff7JOFE/Uiboosm+Xu36FI5F7D2P
	i079AjhdqeTUp7KW/V9jrvaVWAeYeT8hOvdTqkzrb8UykEiwzXxdq/XRpQD1X5jD4hoQ
	8av648TxAx76LMeg5hpfeQMcvjF4tasY2iuuUIM/wqMQRkbp0L4WotX58qC1S/INxwC3
	ROL4n3RX+c4kJSN13+n8UkCvbtRXIpW62iOJ7KwWG7DMJI5ozpUKDcQUxtXtJCZHjx+G
	NS6w==
X-Gm-Message-State: APjAAAXbM9aOJdyywATLM4/VFQhTCMF/DfP4KBvoARpKJMOwLiR4rYvZ
	jlXX9W32P8dr26wLeiIWY3Ixylxxwts=
X-Google-Smtp-Source: APXvYqyFdTX7529lmqFawIJfn45CcurbpF7IrQ4tVBTRuSqGiE1kCiEyGNHzAMXfCrQzv4JhUofwog==
X-Received: by 2002:a1c:4489:: with SMTP id
	r131mr10192233wma.132.1572164390361; 
	Sun, 27 Oct 2019 01:19:50 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id a17sm6938947wmb.8.2019.10.27.01.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 01:19:49 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1571243326.git.pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c6db1799-ee15-0843-8325-9996e13dd8c6@gmail.com>
Date: Sun, 27 Oct 2019 01:19:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1571243326.git.pkj@axis.com>
Subject: Re: [warrior][PATCH 0/8] Backport relevant changes from Zeus
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
X-List-Received-Date: Sun, 27 Oct 2019 08:19:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Peter,


On 10/16/19 9:30 AM, Peter Kjellerstedt wrote:
> This patch set contains backports of our changes from Zeus that are
> relevant for Warrior.
>
> //Peter
>
> The following changes since commit 79a850a10a4b88a6d20d607b322542f94787=
4323:
>
>   conf/poky: add Fedora 30 and Opensuse Leap 15.1 to supported distribu=
tions (2019-10-14 09:49:27 +0100)
>
> are available in the Git repository at:
>
>   git://push.yoctoproject.org/poky-contrib pkj/warrior_sync

The series is causing build failures.

https://errors.yoctoproject.org/Errors/Details/274748/

https://errors.yoctoproject.org/Errors/Details/274757/

I have not had the time to figure out which ones giving I have been
working on a different build failure. So if you could double check them,
that would be great.

regards,
Armin


>
> Niclas Svensson (1):
>   devtool: finish: Keep patches ordered when updating bbappend
>
> Peter Kjellerstedt (7):
>   meson.bbclass: Remove the MESON_*_ARGS variables
>   nativesdk-meson: Remove some unused variables
>   devtool: Avoid failure for recipes with S =3D=3D WORKDIR and no local=

>     files
>   package_rpm.bbclass: Remove a misleading bb.note()
>   tzdata: Correct the packaging of /etc/localtime and /etc/timezone
>   devtool: finish: Add suppport for the --no-clean option
>   lib/oe/lsb: Make sure the distro ID is always lowercased
>
>  meta/classes/meson.bbclass                      | 15 +++++----------
>  meta/classes/package_rpm.bbclass                |  5 ++---
>  meta/lib/oe/lsb.py                              |  8 ++++----
>  .../meson/nativesdk-meson_0.49.2.bb             |  5 -----
>  meta/recipes-extended/timezone/tzdata.bb        |  5 +++--
>  scripts/lib/devtool/standard.py                 | 17 +++++++++--------=

>  6 files changed, 23 insertions(+), 32 deletions(-)
>



