Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 45EC673CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 02:20:24 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so4797332igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TQyECsM0/T2oNr+B9KIommIPU2cLisIRr2RVvJQTXWI=;
	b=mtiUzsr8Navhhsr8D+HZkTsLb2+SHKxc7DpmrWppPt+u97OV+Q5fB++zHwepjpq9NN
	+mKRDxficVyB+WQaXWo9DOOARoDdMTNu/Z76Se/nSOctOfvmcwHpXG8uMKKGlnNClDi7
	nwRTySWHCE2W6CyP4jyN8hBBENDRvXACcO9IIC9KKJbsIdaetc3y7P7/Ic1f8Nsfp4it
	GbesrmVUFiDbnzB4CmBdONWjDrabDyNwHgKB6+Pjc9MI+Om/77B2Q4UuctlIb9VdPGSw
	yAKIFixFlmn9L7RgJghXTElOzUB6z7Mi9/dJPuIQZ6WRgGLeNYSDtiffjQTgG1QUWnkK
	54+w==
X-Received: by 10.50.17.66 with SMTP id m2mr919114igd.77.1440123625090; Thu,
	20 Aug 2015 19:20:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 19:19:55 -0700 (PDT)
In-Reply-To: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
References: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 19:19:55 -0700
Message-ID: <CAMKF1srx_Jzv1gfwQ=VAiepAqL3GHfP4SJduup_GiwCSvL0MoQ@mail.gmail.com>
To: Yen-Chin Lee <coldnew.tw@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Add SRCBRANCH for use by SRC_URI
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
X-List-Received-Date: Fri, 21 Aug 2015 02:20:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 12:32 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
> -SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
> +SRCBRANCH ??= "master"
> +
> +SRC_URI = "git://uclibc.org/uClibc.git;branch=${SRCBRANCH} \

this is ok. Just call is BRANCH instead of SRCBRANCH

