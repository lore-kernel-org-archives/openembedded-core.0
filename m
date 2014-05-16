Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (unknown [209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 782806028A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 10:39:47 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so3904156qga.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 03:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hHCVHAZ4+WbjuJ3ih5I4TDoWAbIhpZv6Ov45ippRVWw=;
	b=D/PuMoQ2+h/FLccnn6x345sdZqziIhwDK0kNRi7pT6tFE+VZl9H+Imb0DaDr3JwpJb
	elsBV733emIASfhqLfxdYrNCEb3li2n8RiHBpzER0SHA4E/RsD+Sa2QhquR2s+5ORSez
	XnOgzR9+ra/WqzqeAaDdKcwTntMikVEU1hv8Tw9g+srT26LCaZZ2i2TVV3Z9EKlR0yy8
	VoHPdvbPEfLxeUZAZsibRMwtYH9cHJU9f3oWqADLjhisZNdn9aPUF5CrRtAJDk3Xc3iU
	rTuds//Hy3+7s/D80EIeQ8VGP9jcow1v5+qEFRfi2gneCS1VO/k0ShKRoH78u4YNmt8P
	hmcQ==
X-Gm-Message-State: ALoCoQluX83TpGERqoGr7Jmk8KETiGDF6FU1mZ0aCMrD1OFUHCQo1hL8mq49G5uVnbCyc6HHgNc1
X-Received: by 10.224.121.72 with SMTP id g8mr7890040qar.79.1400236788177;
	Fri, 16 May 2014 03:39:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 16 May 2014 03:39:27 -0700 (PDT)
In-Reply-To: <cover.1400219191.git.rongqing.li@windriver.com>
References: <cover.1400219191.git.rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 May 2014 11:39:27 +0100
Message-ID: <CAJTo0Lb6euhg7DvXoFG62-tgASvPcJGRSHAu1GcHn9oXTHudkw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] subversion: backport 6 CVE patches
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
X-List-Received-Date: Fri, 16 May 2014 10:39:47 -0000
Content-Type: text/plain; charset=UTF-8

On 16 May 2014 07:00,  <rongqing.li@windriver.com> wrote:
>   subversion: fix for Security Advisory CVE-2013-1849
>   subversion: fix for Security Advisory CVE-2013-4505
>   subversion: fix for Security Advisory CVE-2013-4131
>   subversion: fix for Security Advisory CVE-2013-1845
>   subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
>   subversion: fix for Security Advisory CVE-2013-4277

Are these intended to be backported to daisy?  For master, presumably
we could upgrade to 1.7.16 or 1.8.9?

Ross

