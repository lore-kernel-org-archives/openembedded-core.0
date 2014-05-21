Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 544B16AD99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 18:58:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4LIwhFB028974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 May 2014 11:58:43 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 11:58:43 -0700
Date: Wed, 21 May 2014 13:58:23 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140521135823.09df4ad0@e6410-2>
In-Reply-To: <537CC2C6.1040503@linux.intel.com>
References: <cover.1400277127.git.peter.seebach@windriver.com>
	<3e32cfa9c91fb088c91cf3ef9db200d848a4ed07.1400277127.git.peter.seebach@windriver.com>
	<537CC2C6.1040503@linux.intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo: handle fchmodat better, mask out unwanted write bits
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
X-List-Received-Date: Wed, 21 May 2014 18:58:46 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2014 08:14:14 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> Peter, I know it says Backport above, but can you please add an 
> Upstream-Status: tag to this .patch file.

I might be able to, but I'm sort of swamped right now; I will see if I can
shake some minutes loose. Do Upstream-Status tags have a specified format?

> Also, do you have plans to do a 1.6 update for OE-Core soon?

I would love to, but I don't have an ETA on actually having any available
time. I'd like to clean up a few more things, but the 1_6_0 branch seems
pretty stable these days, I think. Although I'd like more testing with the
xattr support.

I think I heard something about something being done in early to mid June
after which I might have cycles.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

