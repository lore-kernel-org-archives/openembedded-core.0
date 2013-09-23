Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 93585610FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:35:28 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so2013490veb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 02:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=myi8RyIh7K+ugn8G2Pf1MlOY650ewB4oALQo3YALW/w=;
	b=nIVnX8+s74uQi2OtD5vSIDtwgug48IckSB7WFftgzX+fa/MGTP9AXHm4LOopBYpC/c
	7IqzWwXHg94QwyrwdxGRskbZfgChCyiDSiR7e4JJ5ywOFHbv0lwWu2o0WwFPe/EcNzPF
	piY8I5Yl9/6PPD1yXGw+/WSo7cIZpbIaa6cp5oi7s2IcXGVjcMESKMBIuNa4IzxsAhQg
	M0pclYVpYC0dx1MK6iu3bHQ+W9kbylxkMAglGR0nvqBuyw93UzqysUI0EuW59nKnb95H
	pPY/PyaUcxWxGm63ehCmFt/OSH3JKv6kcy6vFWcJZRf8/+elOpHO3VkB3hmU0JIAE4+a
	ZXVg==
X-Gm-Message-State: ALoCoQmVfx+gBMO7S1wnBGMbogBypXY8YOSJj2zfbzaIv1r6DUsBJhXGdzqtCmOsiDtvPmkFeOVI
X-Received: by 10.221.44.136 with SMTP id ug8mr21181993vcb.13.1379928929976;
	Mon, 23 Sep 2013 02:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 23 Sep 2013 02:35:09 -0700 (PDT)
In-Reply-To: <524006B4.6080209@communistcode.co.uk>
References: <524006B4.6080209@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Sep 2013 10:35:09 +0100
Message-ID: <CAJTo0LYvrg5Cj7jUf-6z09NdC+Si_Q68hB_ahHEGBHqaqVToRw@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: elfutils patch failure
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
X-List-Received-Date: Mon, 23 Sep 2013 09:35:29 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2013 10:15, Jack Mitchell <ml@communistcode.co.uk> wrote:
> patching file configure
> Hunk #1 FAILED at 598.
> Hunk #2 FAILED at 612.
> Hunk #3 FAILED at 725.
> Hunk #4 FAILED at 1378.
> Hunk #5 succeeded at 4079 with fuzz 1 (offset 162 lines).
> Hunk #6 FAILED at 4077.
> Hunk #7 succeeded at 4612 (offset 186 lines).
> Hunk #8 FAILED at 5162.
> Hunk #9 succeeded at 5530 with fuzz 1 (offset 205 lines).
> 6 out of 9 hunks FAILED -- rejects in file configure

Patching a generated file is never a good idea, fix this by deleting
that file from the patch.  To be honest that patch appears to be
changing *far* too much.

Ross

