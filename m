Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id C9C777318D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 15:48:29 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id A1F04C4993;
	Wed, 31 Aug 2016 10:48:29 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "wenzong fan" <wenzong.fan@windriver.com>
Date: Wed, 31 Aug 2016 10:48:28 -0500
Message-ID: <1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
In-Reply-To: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.4r5234)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Wed, 31 Aug 2016 15:48:31 -0000
Content-Type: text/plain; format=flowed

On 31 Aug 2016, at 4:21, wenzong fan wrote:

> Finally I narrowed it down to pseudo commit:

Yes, that makes sense, we expect that there'd be potential issues, but I 
didn't have a reproducer for any. Thanks! I'll see whether it reproduces 
for me now. Any specific version of docker I might need?

-s

