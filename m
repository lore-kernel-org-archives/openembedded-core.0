Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7CC57018F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 23:51:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6NNpBWK027438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:51:11 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 23 Jul 2014 16:51:10 -0700
Date: Wed, 23 Jul 2014 18:50:52 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140723185052.74ad39d3@e6410-2>
In-Reply-To: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>
References: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 23 Jul 2014 23:51:12 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2014 17:41:30 -0500
Ben Shelton <ben.shelton@ni.com> wrote:

> Most modern distros will include conf files in /etc/ld.so.conf.d/
> when generating the ld.so cache. This change will bring that flexibility.

I was just looking at a patch to do roughly this. Mine added a
USE_LDCONFIG_CONF_D flag, and then had eglibc's install create the directory
and append that line to ld.so.conf if the flag was set. I'm not sure whether
the extra functionality justifies the effort. I would suggest that, if
this is going to be unconditionally present, the directory should be too.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

