Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E58CF605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 09:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4B9mhIZ027535; Wed, 11 May 2016 10:48:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GimQd4rxqt1Z; Wed, 11 May 2016 10:48:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4B9aO8X027069
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 May 2016 10:36:25 +0100
Message-ID: <1462959384.21831.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Robert Yang
	<liezhi.yang@windriver.com>
Date: Wed, 11 May 2016 10:36:24 +0100
In-Reply-To: <f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
References: <cover.1462832624.git.paul.eggleton@linux.intel.com>
	<f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Wed, 11 May 2016 09:48:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-10 at 10:25 +1200, Paul Eggleton wrote:
> Recipes such as images and packagegroups don't actually fetch or
> build
> any source, so there's really no point having LIC_FILES_CHKSUM set.
> Forcing users to set it (as we have done for images inheriting
> image.bbclass) just makes things more difficult for the user for no
> discernable benefit. The easiest way to adjust this check is simply
> to
> skip it if SRC_URI is not set since this is a pretty good indicator
> that
> no source is being pulled in.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

One reason -next has sat as long as I couldn't figure out who broke the
lic-checksums sanity test. The answer is Robert's patch did, then this
one did as well, making it hard to blame any one person.

I've merged a fix into master along with the other patches.

Cheers,

Richard

