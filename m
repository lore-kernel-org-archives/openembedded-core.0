Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E92177CEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3B6B6RG010745; 
	Tue, 11 Apr 2017 07:11:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r-emOXuBDLYG; Tue, 11 Apr 2017 07:11:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AMAOBZ017804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 23:10:26 +0100
Message-ID: <1491862224.6264.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yuanjie Huang <yuanjie.huang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 23:10:24 +0100
In-Reply-To: <20170410103425.333195-1-yuanjie.huang@windriver.com>
References: <20170410103425.333195-1-yuanjie.huang@windriver.com>
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
X-List-Received-Date: Tue, 11 Apr 2017 06:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-10 at 03:34 -0700, Yuanjie Huang wrote:
> meta/recipes-devtools/binutils/binutils-2.27.inc

Given master contains 2.28, I don't think this patch was based on or
tested against master?

Cheers,

Richard

