Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1415577A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v36BdMEX003582; 
	Thu, 6 Apr 2017 12:39:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sAATjJ4m9OKR; Thu,  6 Apr 2017 12:39:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v36BYqYK003360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 6 Apr 2017 12:34:53 +0100
Message-ID: <1491478492.17200.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Apr 2017 12:34:52 +0100
In-Reply-To: <1491457693.3938.15.camel@linux.intel.com>
References: <20170406050744.26573-1-dmitry.rozhkov@linux.intel.com>
	<20170406053203.6646.56257@do.openembedded.org>
	<1491457693.3938.15.camel@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjM6IGZpeCBydW4tdGltZSBkZXBzIGZvciBjb3JlIHB5dGhvbjMgbGlicmFyaWVzIChyZXYyKQ==?=
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
X-List-Received-Date: Thu, 06 Apr 2017 11:39:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-06 at 08:48 +0300, Dmitry Rozhkov wrote:
> On Thu, 2017-04-06 at 05:32 +0000, Patchwork wrote:
> > 
> > == Series Details ==
> > 
> > Series: python3: fix run-time deps for core python3 libraries
> > (rev2)
> > Revision: 2
> > URL   : https://patchwork.openembedded.org/series/6164/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core.
> > This
> > is
> > an automated response. Several tests have been executed on the
> > proposed
> > series by patchtest resulting in the following failures:
> > 
> > 
> > 
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head] 
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 3a1cce6591)
> So was my master at 3a1cce6591 when I submitted the patch (and still
> is). And I believe the first version had no problems with applying it
> too.

If you take your patch from the mailing list, it doesn't apply as there
was line wrapping that occurred. I was able to fix it and make it apply
though (so no need to resend).

Cheers,

Richard


