Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 10F9960670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:37:56 +0000 (UTC)
Received: by ieclw1 with SMTP id lw1so37000281iec.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A2G51MSXRgvCNPwT9hV50Nr0vt1l7T1repgZONnLI2o=;
	b=DK4eLxsFsx5Mk2ARro1YftdHuQViliez7uM6n0E/ZCY185nQXHMkM02gemDqRouq9o
	yJB0IVVaWz8k0RupYTEInTdrXrKKUKqB6RCqEvzk2ti8wv0H/+feXphWFN2MkVtyHLE/
	02EBOfKJX1oiFHW4BYlvnQuzFcq2cLJ0v2bunVAsn2W9J263nto/aOGEqfAu+teDK3wT
	8RAVlrTe1QWx1w84j2W2W/azgK5tMRCtdASQ253i5nNi44icKWIfJnjDjXGPcPBm93QO
	Ldw7CNPzxI/6b6CBLfUP0ET2Lwxd4NW49mGZkyffEp6+ZrmIkur7htNcHOi0grQVnjwz
	uPfQ==
X-Received: by 10.42.83.212 with SMTP id i20mr5459445icl.91.1433950677477;
	Wed, 10 Jun 2015 08:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Wed, 10 Jun 2015 08:37:27 -0700 (PDT)
In-Reply-To: <CAJTo0LY3xydx4dtEf2ZtfMhO0yM0XaO_BacU1t1r=ZZXVUerLg@mail.gmail.com>
References: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
	<CAMKF1sqbdiykJXaR5DboOHqnVqgnhygRPfgpFmKziQFEu5BUEQ@mail.gmail.com>
	<CAPHZmLZyCTG9MGuBrBRaMV_hdq_ASJ17TaxCD0D-3CNgVsMi3Q@mail.gmail.com>
	<CAJTo0LY3xydx4dtEf2ZtfMhO0yM0XaO_BacU1t1r=ZZXVUerLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jun 2015 11:37:27 -0400
Message-ID: <CAMKF1sq=cJ+mJSqJCTz18f5HXvPr0C+p4p1Zj0pJpDR59vXaOg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 15:37:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 10, 2015 at 9:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
> FWIW, the fix is oe-core 47f67fa (ncurses upgrade).  Of course that won't
> help anyone running fido on a host with gcc5, but I'm not sure we support
> that...

right.

