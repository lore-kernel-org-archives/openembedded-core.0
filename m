Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 008CD70F52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 18:34:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7MIYCXV017049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Aug 2014 11:34:12 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 11:34:12 -0700
Date: Fri, 22 Aug 2014 13:33:49 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20140822133349.76751634@e6410-2>
In-Reply-To: <53F77370.2060603@balister.org>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 18:34:30 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 22 Aug 2014 10:44:32 -0600
Philip Balister <philip@balister.org> wrote:

> Can we also move to hard float abi?

I'd rather not, just because the reason I care about this at all is that our
prebuilt toolchain has a set of binaries for armv7at-neon, but not for hard
float ABI.

I am reminded, though, of a question I had about all the cortex tunings:

Why do they set DEFAULTTUNE to a tuning that isn't one of the ones using the
new features they define?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

