Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9FD65CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAtlA6018196; Wed, 31 Aug 2016 11:55:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fwHO_lEzl7II; Wed, 31 Aug 2016 11:55:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAtjUa018193
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 11:55:46 +0100
Message-ID: <1472640944.29583.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 11:55:44 +0100
In-Reply-To: <88fde4c5d43e2b6ebced1462705241222fb9734a.1472607521.git.paul.eggleton@linux.intel.com>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
	<88fde4c5d43e2b6ebced1462705241222fb9734a.1472607521.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] scripts: ensure tinfoil is shut down correctly
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
X-List-Received-Date: Wed, 31 Aug 2016 10:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-31 at 13:48 +1200, Paul Eggleton wrote:
> We should always shut down tinfoil when we're finished with it,
> either
> by explicitly calling the shutdown() method or by using it as a
> context manager ("with ...").

Could I trouble you to rebase this onto master-next please? It
currently has conflicts which didn't seem immediately obvious to me to
resolve.

Cheers,

Richard

