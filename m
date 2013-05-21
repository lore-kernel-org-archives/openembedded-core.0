Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id E5F4C6148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 10:28:44 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 1273D952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:28:44 +0100 (BST)
Message-ID: <519B4C56.6030203@r-finger.com>
Date: Tue, 21 May 2013 11:28:38 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369062325-30335-4-git-send-email-tf+lists.yocto@r-finger.com>
	<CAJTo0LZn_xvXnyCUJ6UR+Dg2uge1_m6R85RMDi-+0Zsf54vW+w@mail.gmail.com>
In-Reply-To: <CAJTo0LZn_xvXnyCUJ6UR+Dg2uge1_m6R85RMDi-+0Zsf54vW+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] New cogl recipe (1.14.0)
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
X-List-Received-Date: Tue, 21 May 2013 10:28:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/13 11:01, Burton, Ross wrote:
> On Monday, 20 May 2013, Tomas Frydrych wrote:
> 
>     GL flavour:   'gl' for big GL or 'gles2' for GLES2
>                   (GLES1 is availabe in cogl, but not supporeted here at
>     present.)
> 
> 
> Does this support enabling both GL and GLES2 in the same build? (at
> which point the choice of backend becomes someone else's problem, but
> that's fine)

Yes, the PACKAGECONFIG options are additive.

Tomas

-- 
http://sleepfive.com

