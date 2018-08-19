Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFB0D7918C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:17:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7JMGxoX004561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 19 Aug 2018 23:17:00 +0100
Message-ID: <8fbd032b3ff41ed4fb0656b2d1e8b011e98c8169.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 23:16:59 +0100
In-Reply-To: <064dc928-7bbb-b537-75a4-273ecc1dfcfb@windriver.com>
References: <1534490562-15144-1-git-send-email-hongxu.jia@windriver.com>
	<20180817073257.13840.94208@do.openembedded.org>
	<064dc928-7bbb-b537-75a4-273ecc1dfcfb@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJ4bWwyOiBmaXggQ1ZFLTIwMTgtOTI1MSBhbmQuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Sun, 19 Aug 2018 22:17:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-08-17 at 15:37 +0800, Hongxu Jia wrote:
> On 2018年08月17日 15:32, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: "libxml2: fix CVE-2018-9251 and..." and 1 more
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/13574/
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
> > * Issue             Upstream-Status is in incorrect format
> > [test_upstream_status_presence_format]
> >    Suggested fix    Fix Upstream-Status format in 0001-Verify-that-
> > we-are-not-reading-past-end-of-a-buffer.patch
> >    Current          Upstream-Status: Cherry pick from upstream
> > bugzilla [https://bugzilla.nasm.us/show_bug.cgi?id=3392447]
> >    Standard format  Upstream-Status: <Valid status>
> >    Valid status     Pending, Accepted, Backport, Denied,
> > Inappropriate [reason], Submitted [where]
> 
> I am not sure which one to choose, the patch is not from
> upstream, but its bugzilla, so `Backport' is not accurate

That would be Submitted since upstream are aware of the patch.

Cheers,

Richard

