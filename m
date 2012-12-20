Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlimJ-0008Oj-9w
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:15:25 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 08:00:37 -0800
Received: by mail-vc0-f199.google.com with SMTP id p16so5107037vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 08:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=M8re37NUTVsYL1kOeb6Vnte2dFqBkffJ5xbTHrHJYvk=;
	b=aMSFA6bVP8Xx8uyA5mEY9/MWgn2GqV2m6tTPAvWDQ5BDDcUSwQjkhvIDuB5JSS+irK
	TmDKL+jbRO33Bq7WwDbGl3Fx8ET2CV52T9Ni688jZCNFJWqEOw5XS/zUP+/AAhwnhrIc
	VTcgNVkpvigi5JeSD9QRxDK9aOfd38mRapojY8UJWU05S5MeEkEURYF2vRhTZBwjmeNH
	Je8/eROL1jfQ801EsH7Ws+UTY3J1AGjWUA1Kq7K/0vY2IiJiTDuwOnARvDBrQjZSQR9s
	BZt469G4snYPxUp7JlFI2TLKRb8g1Xn6srT4bcbgoqRWNbSNvGji04XzqUgaNIhkYZFG
	Fx3g==
X-Received: by 10.52.180.200 with SMTP id dq8mr13096734vdc.71.1356019236684;
	Thu, 20 Dec 2012 08:00:36 -0800 (PST)
Received: by 10.52.180.200 with SMTP id dq8mr13096721vdc.71.1356019236618;
	Thu, 20 Dec 2012 08:00:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 08:00:16 -0800 (PST)
In-Reply-To: <1356018372-26226-1-git-send-email-alexandru.damian@intel.com>
References: <1356018372-26226-1-git-send-email-alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 16:00:16 +0000
Message-ID: <CAJTo0LYUNMa6MKCpTTy-spp-Ah0uB4zgCEy7H4L7tZknc05D1g@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQlgTiQ+ase1IrT1vdOSZLM6LuCQLyM9ASUnfTe+4s9gUHFfnghsnfSg05I0PW9B1zic45HheAEsIFMw2BnidOylHshRoPHwzj+Tn/FmJzlhr+A84lm/m5WYKz1jMbsIB0h8R/xP+hrxNWpqCaH9Lj3N7PIZ+6HrKMLniTRoUW0rgY6zRugvf48tD5ZMfxWVR9aXoGLN
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix dependency ordering
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 16:15:27 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 15:46, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> This patch fixes the precedence of the dependency list
> that may appear when a single package source is split in
> multiple binary packages.

I'm still confused how this problem (which was discovered in mesa-dri)
doesn't occur on my machine...

Ross


