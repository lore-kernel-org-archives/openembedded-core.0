Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F2E8E60DFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 22:12:39 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so4971509vcb.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 15:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rP/Rd8/69RHj2UeLVLZbjpAdvJtwcai67v6ZCEHTDc8=;
	b=HQRaQINFzBY0Yb5zpTCB+e5Bs+6juFjUuYLs3hfd7hkWGGTHYzXsB88gAeJdKgs+Wt
	ZsSSlU8MM2OWsQLI59aRy2D4mjSb9iddc1HmZaCMBS2x6ccsYfc85iXuSTOvaTHZc9Hl
	W1mhOxDw/SzM16bF4rUsXozcvIxoNfTwfxSfC0pRRBNiPMvUN7AttUVKRx7jNYiDqK/K
	/RZX9YGkLH8LJt4rzxBWgqXaFf8EshP7JD1u0xNLCfC5bVHxHO9TUXoAe2+uTf4atPLq
	37sZdF/toKhaZhYV1LwDPN2F395AHHozVnlYSS1i/h1N4WybJjE8TkTSOdXu5S4FbFeL
	iDoQ==
X-Received: by 10.58.1.97 with SMTP id 1mr3667651vel.23.1395958360628;
	Thu, 27 Mar 2014 15:12:40 -0700 (PDT)
Received: from [192.168.1.3] ([187.106.6.19])
	by mx.google.com with ESMTPSA id p8sm3489064veq.8.2014.03.27.15.12.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 15:12:40 -0700 (PDT)
Message-ID: <5334A255.1090106@gmail.com>
Date: Thu, 27 Mar 2014 19:12:37 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>	
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
	<1395951300.10059.69.camel@empanada>
In-Reply-To: <1395951300.10059.69.camel@empanada>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Thu, 27 Mar 2014 22:12:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tom,


Em 27-03-2014 17:15, Tom Zanussi escreveu:
> On Tue, 2014-03-25 at 23:42 -0300, João Henrique Ferreira de Freitas
> wrote:
>
> Hi João,
>
> I'm having some trouble creating an image, looks like the assignment to
> krootfs_dir['ROOTFS_DIR'] is bogus?:



I am going to prepare a v3 to fix it.

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


