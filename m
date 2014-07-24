Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0E96ACA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:31:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OLVB0O000300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:31:11 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 24 Jul 2014 14:31:10 -0700
Date: Thu, 24 Jul 2014 16:30:51 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140724163051.4ad54c47@e6410-2>
In-Reply-To: <53D0687F.8050404@windriver.com>
References: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>
	<20140723185052.74ad39d3@e6410-2>
	<CAMKF1sqy70-p_sJ9waC6yJGxxfcY=Fgbr=DdK6Cv019GM=YNEg@mail.gmail.com>
	<53D0687F.8050404@windriver.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make ld.so.conf more flexible
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
X-List-Received-Date: Thu, 24 Jul 2014 21:31:18 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2014 20:59:27 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> The later has been requested of me many times, but we've not implemented it 
> generically.  I think it's time to do so -- but it should be tied to 
> USE_LDCONFIG at a minimum, I just don't know if it should always be enabled or 
> just sometimes.  (Always means the ld.so.conf file gets the include line, so 
> it's NOT a lot of bytes.)

It's not a lot of bytes, but it's a non-zero increase in effort for ldconfig
compared to an empty file. Although I assume ldconfig checks /usr/lib*
automatically, so this would be <1% anyway.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

