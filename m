Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB8A7548B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:45:36 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id j81-v6so3584670ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DPyS809Q83dzYSrNFN6gRPF8PJDDo86TqRvqffTASbc=;
	b=HoS+6BxTz92GYb6NvR9OWkUyK/WyUGIN9nR7JHOwiV4ytHW5xQAmw/lL2wEXHSgs/w
	yCBHl6bxSb59hJEjwzxqiCvTo2dB0z4AI/Ta/h/y/mhTNjxhmYCMrpldMZR92cQpSddl
	6pQbgnJhw0IWV8DkEgMtAq2Qri7czvNT4UPag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DPyS809Q83dzYSrNFN6gRPF8PJDDo86TqRvqffTASbc=;
	b=nG0MuLw47KulNTNoRXVE8S/Q9xZi64uz4FOOKup/A5COqwhX/UJ3remx5QE3go8drj
	vwKOlOxHIKukwBrk2tdTMn3PS4SRvuVcrK4lgC29hz7vcMPOV4SkF8llVhpENFejz7DW
	glBP4l4NkicJDx6k8eJVNiwD2X6eGU5bIxx82TbE4c5AqKuCvMAmTJhjCkx0da/LLe6A
	AXK+46HKhVDeD+i3KU0Swrf3u1sFBlLYTYfV6go+oT0PnXqO6hxruqABA4N2R6hsYA0U
	Rv4+bQtvB5lmQ/1yD3OXVm0RuOiv+bbyc6ZYVy0AGF2Xn+jF2HYwTFCR17vBUGPFbhuB
	ewuA==
X-Gm-Message-State: APzg51AbQgZq4PpkbIxqEjN+3+PR0yFDf2SvvWn0u/j2f71S2VuFxNCR
	LNChDLIWW2ldQfLEVPNVzhLHr7/qhHLUIw==
X-Google-Smtp-Source: ANB0VdaZstLQPayVagVN7JCupYIUS6MpkCvvi0GMh14YRaS9ly0xhlgLQtyDRL5sMS39JFmoDSbQCQ==
X-Received: by 2002:a24:d104:: with SMTP id
	w4-v6mr17355657itg.29.1537281937349; 
	Tue, 18 Sep 2018 07:45:37 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	j14-v6sm6260077ioa.37.2018.09.18.07.45.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Sep 2018 07:45:36 -0700 (PDT)
Message-ID: <80eb57ddd34797f2b91404c65bbe4c4a37ef302e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jens Rehsack <sno@netbsd.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2018 07:45:34 -0700
In-Reply-To: <857A2B10-9583-4449-A252-29F4D3C29DA2@netbsd.org>
References: <20180917184949.22961-1-sno@netbsd.org>
	<20180917190314.13844.30776@do.openembedded.org>
	<857A2B10-9583-4449-A252-29F4D3C29DA2@netbsd.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjN7LC1uYXRpdmV9OiB1cGRhdGUgdG8gMy43LjAgKHJldjMp?=
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
X-List-Received-Date: Tue, 18 Sep 2018 14:45:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-18 at 16:22 +0200, Jens Rehsack wrote:
> 	Error verifying signature: Failed to execute gpg.
> 
> 
> > Am 17.09.2018 um 21:03 schrieb Patchwork <patchwork@patchwork.opene
> > mbedded.org>:
> > 
> > == Series Details ==
> > 
> > Series: python3{,-native}: update to 3.7.0 (rev3)
> > Revision: 3
> > URL   : https://patchwork.openembedded.org/series/13851/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core.
> > This is
> > an automated response. Several tests have been executed on the
> > proposed
> > series by patchtest resulting in the following failures:
> > 
> > 
> > 
> > * Issue             Added patch file is missing Upstream-Status in
> > the header [test_upstream_status_presence_format] 
> >  Suggested fix    Add Upstream-Status: <Valid status> to the header
> > of meta/recipes-
> > devtools/python/python3/uuid_when_cross_compiling.patch
> >  Standard format  Upstream-Status: <Valid status>
> >  Valid status     Pending, Accepted, Backport, Denied,
> > Inappropriate [reason], Submitted [where]
> > 
> > 
> > 
> > If you believe any of these test results are incorrect, please
> > reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising
> > your concerns.
> > Otherwise we would appreciate you correcting the issues and
> > submitting a new
> > version of the patchset if applicable. Please ensure you
> > add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH
> > v2] ->
> > [PATCH v3] -> ...).
> > 
> > ---
> > Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Mess
> > age_Guidelines
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > -oe
> 
> I understand this policy. I have an issue wrt. this particular one.
> Why? Well - the patch seems to be reasonable submitted to upstream,
> since it's a
> quirk and likely an error. OTOH - supporting Yocto and OpenEmbedded
> in getting
> software up-to-date is one thing - having my name in the Python
> contributors is
> something complete different.
> 
> Please find someone else doing that.

Nobody is saying it has to be submitted upstream, although we obviously
do appreciate anyone doing that a lot. We do ask any patches which get
added have a status though so we have some idea what is happening to
them.

So in this case the status would be "Pending".

Cheers,

Richard

