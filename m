Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A5605700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:37:15 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id a63-v6so1625555pfl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iYiymhuxvnzxBi+neERwC1D6HdPE8OUYPnMChfX7y08=;
	b=NEVlnTkOfZI7c88k2ybYfNac2iDWjBOOkO/IAvZy99lEUJP0eC7CEyVD8ET7Rs1eA4
	0Rfe+sFX9tlqzKC4Wv9PCbv49Vt2xdTWz+CRBbwKUWaH2J4Ejl3CDo+K78/zZOMV3FPS
	f+ENfP+zTgDMAaI9hw7CCO2NuiG8X+HAFIPoyIlZ1Tw1MPhblZc+dO15Vyw5T7YaHZAq
	2LvJK+kHjQR2iuwYmm4KBhRdG5DwHcJGVYriXKkhLeuiRPSHld314COcZFFXYkkOByVw
	Jiy3ljhEpOerZhiToBpFFZ4odBd+KvZx33ZDocBT24Nh9NZIJGGWi3gpC0kWuf+hVG8J
	9CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=iYiymhuxvnzxBi+neERwC1D6HdPE8OUYPnMChfX7y08=;
	b=bwd4ng58UZIYgindFSVwmO1y3xjqcIc1DEPhYcXdGGrbBo8EMbIFGzVYhsxhBmSYLs
	VYck2gOuFtJMdYehbgIlG0VzRMpM6VX+w/j8G9idSOI2X2UdBuXwPeBfn1gIt9h/jTxT
	hol/PbE5KSlQmIPPBJDEdCgIqCHYcRfDoQYi6CgQmqH8Lw4wni/u6pRari/5tCJ2TkF9
	cxNTsnQnJ7Nkg0jZmadvd9ROJZWY1J6CJUJDk2bsfwk9iT8wlsu8cBM3poK/RujJALev
	CHRCdmurJAQSrzlC0WwMVGZjpysZrL6L25jHIMJ1RsH1AwQyvwB2xccSh5GKrPbO3ICx
	eutA==
X-Gm-Message-State: APt69E3DR2tKtocGDzNEpN7BFxXSi26RQX4Q79GYXgU5V65FLO59f3pX
	58NK5UStS6AWYwTHpSNqSVQWk9aM
X-Google-Smtp-Source: ADUXVKL8bUCIMCMBCJS1n4omFCJmvhd67kQ/kpjJfo/Wtiy7kcKS6qafhEhpEP8pZYdmOn8kl1jdJA==
X-Received: by 2002:a65:5546:: with SMTP id
	t6-v6mr4420095pgr.363.1528904236189; 
	Wed, 13 Jun 2018 08:37:16 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:158a:7c84:6c1e:68aa])
	by smtp.gmail.com with ESMTPSA id
	e24-v6sm4119505pfi.70.2018.06.13.08.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 08:37:15 -0700 (PDT)
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1528901652-14840-1-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <696212b6-cfe1-a882-9395-21093895ad42@gmail.com>
Date: Wed, 13 Jun 2018 08:37:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528901652-14840-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH v2] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Wed, 13 Jun 2018 15:37:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Maxin

On 6/13/18 7:54 AM, Maxin B. John wrote:
> Disable fts5 support as it causes build errors for pseudo.
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>   meta/recipes-support/sqlite/sqlite3.inc                              | 1 +
>   meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 95ec89c..7312c84 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -31,6 +31,7 @@ EXTRA_OECONF = " \
>       --enable-shared \
>       --enable-threadsafe \
>       --disable-static-shell \
> +    --enable-fts5=no \
>   "

is this causing issues for pseudo target recipe ?
perhaps its better to turn it into a packageconfig

>   
>   CFLAGS_append = " -fPIC"
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> similarity index 59%
> rename from meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> index 3755761..ce18fec 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
>   SRC_URI = "\
>     http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>     "
> -SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
> -SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
> +SRC_URI[md5sum] = "dcd96fb9bbb603d29f6b0ad9554932ee"
> +SRC_URI[sha256sum] = "d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"
> 

