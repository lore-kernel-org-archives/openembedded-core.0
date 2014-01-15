Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7AF6E2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 16:16:49 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so1362522obc.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=hWC+KcsYascs8ObwwBiu0nUpHpFjuPzv9aeIVZgTwcY=;
	b=d1ij01gCm+8Kt+3GL4//JTyK00KyDz6+Sqb/zMySaxPLPUcnoi/m97ob8bkDMuFCyM
	f9o6wFYLhSyxqPVgPNeVrQoCQm8OaMQpbU8n2INfwgF8VviSDEUfqDtCBFC5rA4AT5Wv
	oUa37IwF8IMUsqk5nhribS1pMTWCiWa9R6Qyrp2zWvbwaCWZJd+8apfqPtbl73wdK/aF
	RLz8TSDQMFb57wPVsGtoSq7e13a3dcLPVUWJQJuyXJmQ+Nxfph7Qh9Jfdnq5Fr4m2En7
	clQLVm+DW7HXyf+kiB6IDoT+sdLkPjhTFRGfnyYRGi+Gtugn9PEicOdGzN+AgBbF22eT
	Oa5g==
X-Received: by 10.182.19.132 with SMTP id f4mr2481692obe.14.1389802610542;
	Wed, 15 Jan 2014 08:16:50 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Wed, 15 Jan 2014 08:16:10 -0800 (PST)
In-Reply-To: <39BBD84D-0924-4FD9-8585-3C7C231A1CC2@dominion.thruhere.net>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-2-git-send-email-paul@paulbarker.me.uk>
	<39BBD84D-0924-4FD9-8585-3C7C231A1CC2@dominion.thruhere.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 15 Jan 2014 16:16:10 +0000
X-Google-Sender-Auth: 2gCg3Iyc92WcPtQ26luQMRlFHl4
Message-ID: <CANyK_8cNLp54e5x+yxOAqX9T3PwPE_NJWO51t81OdRoe1L+KLA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] opkg-utils: Upgrade to latest git HEAD
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
X-List-Received-Date: Wed, 15 Jan 2014 16:16:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 January 2014 10:04, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 15 jan. 2014, om 03:17 heeft Paul Barker <paul@paulbarker.me.uk> het volgende geschreven:
>

>> LICENSE = "GPLv2+"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>> +PROVIDES += "virtual/update-alternatives"
>> +RPROVIDES_update-alternatives-opkg = "update-alternatives"
>
> R* variables do below do_install since they deal with packaging
>

I was following the list in
http://www.openembedded.org/wiki/Styleguide which is probably out of
date. I'll re-order it to follow the list in
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

