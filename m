Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 28DAF6D2DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 14:22:04 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id cz12so425636veb.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 06:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1AEAEJ7fgwUMM5jUpusbGf1DlqlB9dU7+TaTHPgYc6Y=;
	b=NxPijBbKvF93QNQa4KMj/NuNyv2O6GUF0G6xHxL2DnxxDD/Ex9W0Zs5tIJe34timsZ
	GmW8o8GB4AW1pzn1Y5/O6rJTO/RHkMPn7G/iLmow43MzzYEO+Sc4GzZOQCYsg9jFhTSr
	A4bWs3pavGVpaWtscy6gThtd9Spot8B8hNsbdDilR+3PPsgWuIoHdu8Eitfp+SoFO44m
	c6+/+w5DyjxvCKaIsu/tgnE4dN91jeZy9SOLSIZ+jOA19joVYbMGRK6+HwUDW2UIUbG4
	7Snp0ts30YV6OMcLj+wnK8bkeayatQZFROZl1Zo/WFuV/CXKGxPv4765WkfsYnb8EApD
	bw3A==
X-Gm-Message-State: ALoCoQlAO13UbxLNLqsM68+U4xAKb9JDFJqr+aGdDmyaxd9ZGrWCWiLfBJKnmYyfVLddYiVcuyCH
X-Received: by 10.58.107.204 with SMTP id he12mr6862813veb.26.1383834125665;
	Thu, 07 Nov 2013 06:22:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 7 Nov 2013 06:21:45 -0800 (PST)
In-Reply-To: <20131107123236.GH27969@lpalcu-linux>
References: <1383825964-3795-1-git-send-email-ross.burton@intel.com>
	<20131107123236.GH27969@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Nov 2013 14:21:45 +0000
Message-ID: <CAJTo0LZ7RWwB=v=yTM3E44k64Bi2BsyJ4A+DAthp=9rw+N6CBA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: upgrade to 1.14.4
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
X-List-Received-Date: Thu, 07 Nov 2013 14:22:05 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 12:32, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Why don't you use the -M option when formatting your patches? It
> would be easier to skip over renames when reviewing the patches...

Because I'm getting forgetful in my old age? :/  I'll configure
send-email to always use it.

Ross

