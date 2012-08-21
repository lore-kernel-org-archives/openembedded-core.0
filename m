Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T3yE5-0008Bk-LU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 01:51:13 +0200
Received: by iaky10 with SMTP id y10so269652iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=PXuBMWuBy2a4fkkVyHJDCV2GyUWcS289GF8mK7cRtoQ=;
	b=lvfcMhzFBQxmzUk7yGBhfdW6mrHICAMkd1Xx6ntjyAkiasjsI4OONcv85N6zYNX7i4
	t011FEsYJxxVmvTUKmg6favv4hf0xUULASFF3x9Wphl0H5OOnhyDv+d5PgYICg6LEEWS
	LKKjviJNU3M7WF0OikZRuTUSMNpcWzBFTVBzxRjlbxCPHRII/r2EaEaO67hQVyIzD5RW
	+tDOsywMqDzaOpoV6gPy/6NQNVq8HzvBjBF7hjfqUl9Z0cDbBO8p0QTVokfqe9TYfpQr
	ABeGjVKLjWub/OInZWU5wGvXLbqRzOP9BWK9bI3er1WGI24gkJcBlte9HwN8s0SaFIoh
	uDWA==
Received: by 10.50.157.194 with SMTP id wo2mr184633igb.72.1345592348817;
	Tue, 21 Aug 2012 16:39:08 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:249d:5ec7:84ac:5c55])
	by mx.google.com with ESMTPS id bp8sm5334744igb.12.2012.08.21.16.39.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:39:08 -0700 (PDT)
Date: Tue, 21 Aug 2012 16:39:09 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120821233909.GA19614@bill-the-cat>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-2-git-send-email-trini@ti.com>
	<502F01FB.1020303@linux.intel.com>
	<20120820175702.GA9706@bill-the-cat>
	<5033E14B.4020003@linux.intel.com>
	<CAMKF1srDS6YByrYxsZdt6=8BCakQ9Dp1+i1TdzqNFMRHFWO2dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srDS6YByrYxsZdt6=8BCakQ9Dp1+i1TdzqNFMRHFWO2dA@mail.gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 23:51:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 21, 2012 at 01:56:46PM -0700, Khem Raj wrote:
> On Tue, Aug 21, 2012 at 12:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > HOSTCFLAGS="${CFLAGS}
> 
> needs a closing quote

Good spotting, both of you.  But I can't test a v2 as the problem of
nothing being buildable on just oe-core still remains.  Of course, I'll
happily don another brown paper bag atop my current one, just point me
at what I've got wrong :)

-- 
Tom


