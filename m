Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5EA6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:07:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7LL7TNX004533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 21 Aug 2017 22:07:30 +0100
Message-ID: <1503349649.32591.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 22:07:29 +0100
In-Reply-To: <20170821205624.19892-1-Martin.Jansa@gmail.com>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
	<20170821205624.19892-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 21 Aug 2017 22:07:30 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCHv2] insane.bbclass: write QA issues to log file only when they are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 21:07:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-21 at 22:56 +0200, Martin Jansa wrote:
> * QA check which aren't included in WARN_QA and ERROR_QA are shown
>   during the build only as NOTE message (not shown at all with
> default
>   knotty setting), so it might be surprising to see them later in
> qa.log
>   file
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've just been having a look at this and I think its by design, all
messages are put into the log but at differing log levels. I think the
correct thing to do may be to filter it as you proposed in your CI
system.

Any other opinions?

Cheers,

Richard

