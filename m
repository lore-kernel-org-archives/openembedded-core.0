Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 725B160616;
	Mon, 30 Nov 2015 15:19:38 +0000 (UTC)
Received: by ioir85 with SMTP id r85so176363075ioi.1;
	Mon, 30 Nov 2015 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=SZBE4KYRzxcqzLwYNsvlVB2rS/7aDBsx+gZakrZBGOo=;
	b=aRmtKmLs+C/KSjKZ2Tihyc8+g8iQ/M1b2arzDJupZIozDNtAONy/FlnBLSolCTq5V6
	GTKsVqJiMx781kxOAgYrmoYg3KfaGiO/yUwC3V+9U/N7iyXtXd38haFUTQ1i/nNtlP8R
	5XPxPV78BTXrhYNQsgg3rpuQ+X9ErfjpYH0F9Ge6dEeL2DOjknPC2KXFbLuvwDNvH4WO
	Zxvtd8PA61Bo3r1TtLS9VfRZwMb/FmvahX9iJIFYxLxG+CSGToG72BOMIOaqgrD+bH8x
	VmYW8rYlUig33UMck7x51sgN6/muJPVg76lyROVFnXdZvSyj0610mh8rZIx6u2e9b6Gx
	RcBg==
X-Received: by 10.107.138.28 with SMTP id m28mr67895265iod.24.1448896778821;
	Mon, 30 Nov 2015 07:19:38 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	79sm17889470ioh.19.2015.11.30.07.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 07:19:38 -0800 (PST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <565C6907.3020501@gmail.com>
Date: Mon, 30 Nov 2015 10:19:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Mon, 30 Nov 2015 15:19:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/26/15 16:00, Paul Eggleton wrote:
> I'm also 
> trying to ensure that the patch validation is generic enough so it can live in 
> OE-Core, and thus we can easily update and refine it over time in line with the 
> code itself as well as encourage submitters to use the script on their own 
> changes before sending.

This all sounds like an improvement and is therefore a step in the right
direction :-)

A while back I had the idea of "porting" the kernel's "checkpatch.pl" to
The Yocto Project (it was around the same time that I was trying to
float the whole "Maintainers File" idea too, since I was also trying to
re-purpose "get-maintainer.pl" as well). About one minute into that
effort I realized the existing *.bb files were all over the place in
terms of the order of statements and the order of the blocks of
statements. At that time I found one recipe style guide from OE, and
another one from The Yocto Project, each of which described a slightly
different preference. So I asked on the mailing list and quickly
discovered that both groups prefer a different style.

I'm not saying this job isn't worth doing, but I am pointing out there's
the potential for feathers to be ruffled on both sides if someone tries
to produce a definitive style guide for recipe files and then enforces
it in an automated way. Since it is the OpenEmbedded Project's job to
provide the recipes for The Yocto Project, I'm guessing this question
needs to be decided by them? If that sounds reasonable, then maybe The
Yocto Project needs to acquiesce to OE's decision?

Instead of cross-posting, maybe this would be a good email for the new
architecture list (CC'ed)?

