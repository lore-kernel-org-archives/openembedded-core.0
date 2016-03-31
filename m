Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 524EE6057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 21:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VLsl3j012010; Thu, 31 Mar 2016 22:54:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hdcIZ-iaFT9k; Thu, 31 Mar 2016 22:54:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VLsj82012007
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 31 Mar 2016 22:54:46 +0100
Message-ID: <1459461285.21672.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurent Bonnans <laurent.bonnans@hikob.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 22:54:45 +0100
In-Reply-To: <8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Thu, 31 Mar 2016 21:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-31 at 18:15 +0200, Laurent Bonnans wrote:
> These modules are most certainly useless for a production setup
> (from python docs: 'The test package is meant for internal use
> by Python only') and take a significant amount of disk space
> (roughly 20M for 'test').
> 
> If present in manifests, they are shipped in 'python-modules'. This
> commit keeps them avalaible in the 'python-misc' package.

Would it not make sense to keep these as separate packages but
specifically exclude them from python-modules (and add a comment along
the lines of the above as a reason)?

Cheers,

Richard


