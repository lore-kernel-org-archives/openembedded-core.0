Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A50C176FF2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:10:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 1F549608F4F
Message-ID: <1441213853.9071.3.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Wed, 02 Sep 2015 18:10:53 +0100
In-Reply-To: <1441139962.24871.16.camel@linuxfoundation.org>
References: <1441139962.24871.16.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fido and dizzy collaboration?
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
X-List-Received-Date: Wed, 02 Sep 2015 17:10:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Richard,

On Tue, 2015-09-01 at 21:39 +0100, Richard Purdie wrote:
> Hi Armin, Joshua,
> 
> I've just been looking at the patches queued for the dizzy/fido
> branches. In fact I ended up merging them before I realised there are
> some issues.
> 
> The problem is there are dizzy patches which aren't in fido, which
> breaks our policies. Could the two of you work to resolve that and
> give
> me fido branch to pull which resolved it please?

I just had a look at changes merged to dizzy in the past two weeks,
assuming the issues were recent, and found the following changes in
dizzy which I didn't have in fido:
* Some QEMU CVE fixes, those don't apply to the newer QEMU in fido
(2.2.0 vs. 2.1.0).
* A fix for CVE-2015-5477 in bind, fido has a different patch to
include this - probably not worth a revert & merge though?
* Three lib/oeqa changes - I've cherry-picked them to my joshuagl/fido
-next branch[1].

In future I'll keep an eye on changes tagged for dizzy too and try to
help avoid this happening again.

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

