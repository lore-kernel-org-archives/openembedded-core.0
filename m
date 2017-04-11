Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA3A77BE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3B8GH8k018242; 
	Tue, 11 Apr 2017 09:16:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KR4Wq1RV7C2h; Tue, 11 Apr 2017 09:16:19 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3B7SGtd014712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 08:28:17 +0100
Message-ID: <1491895696.12091.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuanjie Huang <yuanjie.huang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 08:28:16 +0100
In-Reply-To: <79336d8d-845d-b4ef-7eb5-acc8f10f675d@windriver.com>
References: <20170410103425.333195-1-yuanjie.huang@windriver.com>
	<1491862224.6264.0.camel@linuxfoundation.org>
	<79336d8d-845d-b4ef-7eb5-acc8f10f675d@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] binutils: Fix CVE-2017-6965 and CVE-2017-6966
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
X-List-Received-Date: Tue, 11 Apr 2017 08:16:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 14:18 +0800, Yuanjie Huang wrote:
> 
> On 04/11/2017 06:10 AM, Richard Purdie wrote:
> > 
> > On Mon, 2017-04-10 at 03:34 -0700, Yuanjie Huang wrote:
> > > 
> > > meta/recipes-devtools/binutils/binutils-2.27.inc
> > Given master contains 2.28, I don't think this patch was based on
> > or
> > tested against master?
> Not yet, I will work on that, and will send the patch for master
> later. 
> Our current product is based on Morty, so I fixed it first.

If a patch is against morty, you need to say that when you post it.

The patch will not be accepted until master has the issue resolved. 

If the issue isn't present in master, you should mention that.

Cheers,

Richard

