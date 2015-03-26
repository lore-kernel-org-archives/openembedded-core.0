Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A18A7723B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 00:28:16 +0000 (UTC)
Received: by pdnc3 with SMTP id c3so44938463pdn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qUoN/oo5SSVeXVOd3/5LuReF59rARwQEq3itHWFi9Po=;
	b=H+K4biCFZrP46l5z4YLTit4GzU1fjhZBepWtrTegsMAXYzS3tDf85OiF1CN9YgtwkI
	SgowJBbb7g4ExoV1gelDerngU6A3oEd3Aqba3a0uYpSGiEkdKLzkRb30igfWtN7XCpLz
	/BwSzalLjgSWr3gTot4Xi9jTvffle6FKVSHS75giELudIKJvGmtFFPsRLqIrYg2kZ+ai
	+KsTMIB0tKmc6equyRmclnbvsttiNHFEhYsuqds/ZlkahAWCQAVkYAHI3/3rSaNV9qdh
	5ypymOjqTCXrgDBST+dM0oMuGxoyXgU6k5UEWdu25TkWXCE59us8wBK8k2tYRQr2u7Nc
	LrOA==
X-Received: by 10.66.66.230 with SMTP id i6mr21631281pat.108.1427329697405;
	Wed, 25 Mar 2015 17:28:17 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id g10sm3629809pdm.29.2015.03.25.17.28.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 17:28:16 -0700 (PDT)
Message-ID: <5513529A.8020909@gmail.com>
Date: Thu, 26 Mar 2015 11:28:10 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
References: <1426505388-32713-1-git-send-email-net147@gmail.com>
In-Reply-To: <1426505388-32713-1-git-send-email-net147@gmail.com>
Subject: Re: [dizzy][PATCH] liburcu: revert ARM GCC blacklist commit
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
X-List-Received-Date: Thu, 26 Mar 2015 00:28:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2015 10:29 PM, Jonathan Liu wrote:
> This fixes the following error when building liburcu:
> "Your gcc version produces clobbered frame accesses"
>
> OE-Core is using a patched GCC 4.8.2 which is able to compile liburcu
> properly.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   ...evert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch | 47 ++++++++++++++++++++++
>   meta/recipes-support/liburcu/liburcu_0.8.4.bb      |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
Ping.

This is a backport from master:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-support/liburcu?id=83bb2c2b1f68abfc4d882b2aec3b5468372b1436

Regards,
Jonathan

