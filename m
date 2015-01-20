Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40C8671F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 22:27:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0KMQr5F021357
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jan 2015 14:26:53 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 14:26:53 -0800
Date: Tue, 20 Jan 2015 16:26:50 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20150120162650.5b33a450@e6410-2>
In-Reply-To: <54BECD36.1040705@linux.intel.com>
References: <cover.1421788745.git.peter.seebach@windriver.com>
	<b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
	<54BECD36.1040705@linux.intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3
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
X-List-Received-Date: Tue, 20 Jan 2015 22:27:15 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2015 13:48:38 -0800
Saul Wold <sgw@linux.intel.com> wrote:

> On 01/20/2015 01:21 PM, Peter Seebach wrote:
> > pseudo 1.6.3 merges (with some changes) the changes from
> > Peter A. Bigot to make --without-fallback-passwd work. It
> > also adds a proposed fix for Yocto bug #7097, which has
> > passed the obvious tests I could think of.  
> 
> Can you add the [YOCTO #7097] tag so we can track that way.

Whoops. Done. Updated contrib:seebs/pseudo_163, also added the missing
signed-off-by line.

commit 650c50804a3538bbe38f59998aba7c6838e93c98 
Author: Peter Seebach <peter.seebach@windriver.com>
Date:   Thu Jan 15 16:18:38 2015 -0600 

    pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

