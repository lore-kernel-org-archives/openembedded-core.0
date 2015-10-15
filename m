Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7C915770CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:18:56 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so14035582wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=o9hvzPhzHhjbmJfQCGa4uzsVcFeHfIaC2dnHJHeS79c=;
	b=htzgU58Hy54gjpgmCVN17hy9OvgQJzva45qn3WPjKO5F37MNefMNmhbwg2PDfSG2Wy
	Vqhe06UeVnZWfwHm1D7dmrs0aO/780ckuP9Tkw7QMSKsNYbmwec3zmhg0E0zc+pctItK
	rnqaQTkpOQBYPOKrXwdCBi+9aWoUefh1XwtDugp1VHZvEqDCfTdXhJHpEbxYypMbKYQJ
	0JjPfSMvhG+YG+OrVZGX3jiLMB0TE/+uwgN8I5i1bb4k4WrBmgzN/Tm921lAKzjkqXRC
	l/pA/jPAyCn9ZZ2PK62dVCkbU+QYhVkpAg7eRabLFrYLU1ERTIsEMF0DiLOSPf/nn92i
	CB3w==
X-Received: by 10.180.186.74 with SMTP id fi10mr31738904wic.61.1444907936736; 
	Thu, 15 Oct 2015 04:18:56 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	hk5sm15850655wjb.6.2015.10.15.04.18.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:18:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1444906192.5251.63.camel@pbcl.net>
Date: Thu, 15 Oct 2015 13:18:53 +0200
Message-Id: <2F004997-0069-4F36-972C-BFB6919EE288@gmail.com>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
	<1444906192.5251.63.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 11:18:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> Am 15.10.2015 um 12:49 schrieb Phil Blundell <pb@pbcl.net>:
> 
> On Tue, 2015-10-13 at 22:37 +0200, Jens Rehsack wrote:
>> When enabling tune for arm926ejs, poky optionally appends suffixes 
>> for thumb and dsp support. Since sometimes arm926ejse (ARM code) and 
>> sometime arm926ejste (thumb code) is used in PACKAGE_ARCH, allow 
>> both.
> 
> It seems like it is a bug for "arm926ejste" ever to be showing up in
> PACKAGE_ARCH, and it would be better to fix the packaging code to not
> do that.  ARM926EJ-S is a CPU not an architecture.

The CPU is Kirkwood 6281, arm926ej-s is a design, like cortex-a9.

Just to avoid some confusion ;)

Cheers
-- 
Jens Rehsack - rehsack@gmail.com


