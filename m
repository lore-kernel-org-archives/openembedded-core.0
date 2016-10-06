Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 694D360684
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 17:25:05 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 32FD6C495D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 12:25:05 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 12:25:04 -0500
Message-ID: <50A1C024-E820-495C-B498-36CFFACEF086@seebs.net>
In-Reply-To: <1475768720-21649-1-git-send-email-joshua.g.lock@intel.com>
References: <1475768720-21649-1-git-send-email-joshua.g.lock@intel.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Subject: Re: [PATCH] pseudo: backport a patch to fix renameat()
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
X-List-Received-Date: Thu, 06 Oct 2016 17:25:07 -0000
Content-Type: text/plain; format=flowed

On 6 Oct 2016, at 10:45, Joshua Lock wrote:

> renameat calls under pseudo were losing extended attributes.
> Backport the fix for this from pseudo upstream.

ACKing this. Underlying problem was that renameat() was just totally 
busted, in a way rename() used to be busted.

-s

