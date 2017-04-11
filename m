Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3008477BE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BECKth021256; 
	Tue, 11 Apr 2017 15:12:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rOw0-rVYwSoF; Tue, 11 Apr 2017 15:12:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BE6W2n020868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 15:06:34 +0100
Message-ID: <1491919592.12091.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 15:06:32 +0100
In-Reply-To: <20170405134642.12572-2-pkj@axis.com>
References: <20170405134642.12572-1-pkj@axis.com>
	<20170405134642.12572-2-pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 2/3] base-files: profile: Do not assume that the tty command exists
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
X-List-Received-Date: Tue, 11 Apr 2017 14:12:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 15:46 +0200, Peter Kjellerstedt wrote:
> This avoids the following error when logging in to a host that does
> not have the tty command:
> 
> -sh: tty: not found
> 
> Reported-by: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.
> com>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/base-files/base-files/profile   | 6 +++---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ----
>  2 files changed, 3 insertions(+), 7 deletions(-)

So instead we now break systems which don't have "command" which turns
out to be all our default busybox configuration :(.

Thanks for spotting this Nathan...

Cheers,

Richard

