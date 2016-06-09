Return-Path: <andrew@bradfordembedded.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF1165D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:22:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 330312049B;
	Thu,  9 Jun 2016 10:22:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Thu, 09 Jun 2016 10:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=0AEEYqJZ2aeosZEKjW2p6XHAXlc=; b=tSf4mD
	2W/kQKrQH87C0XarOTTivd3QeibX39zI02YwzI1eJcmV6bl52iEMCV85QQDqqXST
	GzJnKQQLznEtBasaEoKOf0Fgrpd++rKralcXReU7BACnrauNrsymA0yfGuuivfu0
	tDKjNO53+uhP9sfXcli/H0cn/SL0HJ4IluZWE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=0AEEYqJZ2aeosZEKjW2p6XHAXlc=; b=TcG3w
	CK8cOqrAX6RIK+WcbQx9IdBhyNhf9AHozVy8RRyx+KRX/GzTouYfeAW7TONNUR5c
	Qzs7IIjY16s4m8YXgXWtkWTzcrfgqiT5IvQiBEGoiLFC1joUNPyhYu4xKYsCPY6U
	fFfS9vRyZNw2nVJdLRTcHr6vG4pbGebKigmBM0=
X-Sasl-enc: os2o5ZR4Y0bwRJHsj7LpIZF106C9ievP+7zdHE/IhiKr 1465482156
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id CEC41CCD88;
	Thu,  9 Jun 2016 10:22:36 -0400 (EDT)
Date: Thu, 9 Jun 2016 10:22:35 -0400
From: Andrew Bradford <andrew@bradfordembedded.com>
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160609142235.GA31457@kaim-eeyore.kodakalaris.net>
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Thu, 09 Jun 2016 14:22:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 06/08 15:48, Maxin B. John wrote:
> 1. LIC_FILES_CHKSUM updates only involves changes in Copyright holders.
>    LICENSE remains the same.
> 
> 2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
>    Provide a work around for that.
> 
> [YOCTO #9606]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>

Tested-by: Andrew Bradford <andrew.bradford@kodakalaris.com>

Tested on ARM Cortex-A8 (so not the MIPS changes).
Thanks!

