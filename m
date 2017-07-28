Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9157B784BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 15:00:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6SF0cWn006437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 28 Jul 2017 16:00:39 +0100
Message-ID: <1501254038.22282.184.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:00:38 +0100
In-Reply-To: <20170728141431.GM26163@bill-the-cat>
References: <1501250158-32429-1-git-send-email-trini@konsulko.com>
	<20170728140112.2383.13479@do.openembedded.org>
	<20170728141431.GM26163@bill-the-cat>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 28 Jul 2017 16:00:39 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjNdIGltYWdlOiBDb252ZXJ0IHZtZGsvdmRpL3EuLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Fri, 28 Jul 2017 15:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-07-28 at 10:14 -0400, Tom Rini wrote:
> On Fri, Jul 28, 2017 at 02:01:12PM -0000, Patchwork wrote:
> > 
> > == Series Details ==
> > 
> > Series: "[v3] image: Convert vmdk/vdi/q..." and 4 more
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/7993/
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
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head] 
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 28fc6ba761)
> I don't see 28fc6ba761 as being published.  I suspect it's a back-end
> issue that needs to be fixed since Richard pointed out that v2 was
> causing failures and v3 is a full repost, not incremental on top.  I
> can
> post an incremental fix instead if needed, thanks!

Actually, I think the system is right, there were runqemu changes which
I did merge between v2 and v3 of your patchset and your patch does no
longer apply against master. Could you rebase/resend it please?

Cheers,

Richard

