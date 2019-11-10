Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05B517F8C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 23:49:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z4so9343434pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 15:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QpDwJMOdVFDZasgJamL4RkdaWmDhBrujrDwjumYHjBs=;
	b=tZC7lMcD7b6BOEGiZVdW9vIoMOW/EstKJX8mBuAxGDWuHnnfeZIBSzLeTSObqEgIGE
	2Egcs9hAx9wnUOxSytORS47O9vXQgjv3p3y9pgLmiGkSQFZPEQPPwpzei3XE5qjt8sae
	xEm3cKdO2qnZV0dQX77TEbProZ5QAk9OvsFNkyOmr6o0n67Se7Ji9uwADwk7eLgJEFUV
	DJ0ACCGWcxjj3e/BvRBrS5EkyMFps1051pIuSJ1JIIjRkG683706uxNd4Yhnn2UWHJZW
	U7WwGF9WIka3D/YXKpoRhQbdXeKYq1zqRTPtHeiI4++g1JOSlxw8+YkrZvGYr5FtvsSz
	KDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QpDwJMOdVFDZasgJamL4RkdaWmDhBrujrDwjumYHjBs=;
	b=WUH7fG+SBVlyaC2ZvQenwLRiT4qEy670Hxg9atCiFcmxsAv/Fe98061W4IG+q8VbkD
	eCLfa2OF9RbVnUmp5i0OrBWAQh3Y8MjC7/6hRUBa0fJartBXNqf8seHgOBRzA0niwERE
	dFQM12oYHlWw1u0v6/wSo+Dxp0PtqVpTo9BzUr/wwQdZm2s0EKh4RJ9eOmp6xOj3anJd
	wcYFHHbtnZ4tJzKPVaY7lFocww3Q3on3lixKwZCmYJTfLIePBDr8wPu37n1g9HXz1KzT
	aoqTlLl4LvOxi+fL1/4THu1uYL1edLv3vcYIwiZruo16t58gCGlwuG2RHjTXvyrfM7HL
	KuNA==
X-Gm-Message-State: APjAAAUWCeA1+lYsFsNJ5YVEDsvinPU42ethi1Eex1mYxy4jKrPnuORj
	paccg7cPs12dROOVbGtr6trUZVzG
X-Google-Smtp-Source: APXvYqwXmMJ3MDSDEazSTdQpWJDSJAj5TpUkZhxWsHiwl/jbvNLhkNQ0esWgqv8NY5tlv/za7Shecw==
X-Received: by 2002:a63:3603:: with SMTP id d3mr17341711pga.259.1573429793616; 
	Sun, 10 Nov 2019 15:49:53 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7974:a9f:c495:4c6d?
	([2601:202:4180:a5c0:7974:a9f:c495:4c6d])
	by smtp.gmail.com with ESMTPSA id
	j14sm11847403pje.17.2019.11.10.15.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Nov 2019 15:49:53 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1572991610.git.pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fbdd3146-b0c1-f0ce-8268-58c2661a2a7f@gmail.com>
Date: Sun, 10 Nov 2019 15:49:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
Subject: Re: [warrior][PATCHv2 0/9] Backport relevant changes from Zeus
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
X-List-Received-Date: Sun, 10 Nov 2019 23:49:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/5/19 2:08 PM, Peter Kjellerstedt wrote:
> This patch set contains backports of our changes from Zeus that are
> relevant for Warrior.
>
> PATCHv2: Add a backported patch from meson 0.50 to allow
> <language>_args and <language>_link_args properties, e.g.,
> c_link_args, in meson.cross to be specified as either a sting or a
> list. We could potentially have stumbled on this problem any time
> since meson_array() was changed in commit 7fd8bc46 to return a string
> if only one argument is specified. However, it was hidden until the
> change to meson.bbclass in this patch series removed some unnecessary
> arguments, leaving only one link argument when building for nativesdk.
>
> //Peter
thanks.

pulled these in for next series. will let you know how it goes.

- armin
>
> The following changes since commit d0f73121551dc98f6924cd77952bf9ebf5ef3dd7:
>
>   poky.conf: Bump version for 2.7.2 warrior release (2019-10-30 13:55:49 +0000)
>
> are available in the Git repository at:
>
>   git://push.yoctoproject.org/poky-contrib pkj/warrior_sync
>
> Niclas Svensson (1):
>   devtool: finish: Keep patches ordered when updating bbappend
>
> Peter Kjellerstedt (8):
>   meson: Backport patch to handle strings in cross file args
>   meson.bbclass: Remove the MESON_*_ARGS variables
>   nativesdk-meson: Remove some unused variables
>   devtool: Avoid failure for recipes with S == WORKDIR and no local
>     files
>   package_rpm.bbclass: Remove a misleading bb.note()
>   tzdata: Correct the packaging of /etc/localtime and /etc/timezone
>   devtool: finish: Add suppport for the --no-clean option
>   lib/oe/lsb: Make sure the distro ID is always lowercased
>
>  meta/classes/meson.bbclass                    | 15 ++--
>  meta/classes/package_rpm.bbclass              |  5 +-
>  meta/lib/oe/lsb.py                            |  8 +-
>  meta/recipes-devtools/meson/meson.inc         |  1 +
>  ...ings-in-cross-file-args.-Closes-4671.patch | 87 +++++++++++++++++++
>  .../meson/nativesdk-meson_0.49.2.bb           |  5 --
>  meta/recipes-extended/timezone/tzdata.bb      |  5 +-
>  scripts/lib/devtool/standard.py               | 17 ++--
>  8 files changed, 111 insertions(+), 32 deletions(-)
>  create mode 100644 meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
>


