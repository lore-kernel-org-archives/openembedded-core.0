Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 83D7B73FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:07:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A1298601477
Message-ID: <1431356839.3086.11.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 11 May 2015 16:07:19 +0100
In-Reply-To: <55506D9B.7080501@windriver.com>
References: <cover.1431326066.git.joshua.lock@collabora.co.uk>
	<55506D9B.7080501@windriver.com>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/70] Proposed changes for fido
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
X-List-Received-Date: Mon, 11 May 2015 15:07:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

On Mon, 2015-05-11 at 16:51 +0800, Robert Yang wrote:
> On 05/11/2015 04:40 PM, Joshua Lock wrote:
> > Robert Yang (5):
> >    pcmciautils: fix for parallel build
> >    aspell: inherit binconfig-disabled
> >    cracklib: add python support back
> 
> Hi Joshua,
> 
> I'm leaning to not backport "cracklib: add python support back" since
> it is more likely a function enabled rather than a bug fix.

I see that python-cracklib has been disabled for some time (since
before dizzy), I will drop this patch from my tree.

Thanks for your review.

Joshua

