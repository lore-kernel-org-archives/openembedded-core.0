Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C85A276312
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 08:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7884P6k022481; Mon, 8 Aug 2016 09:04:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PtSl2g8ntOum; Mon,  8 Aug 2016 09:04:25 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7884KT7022478
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Aug 2016 09:04:22 +0100
Message-ID: <1470643460.8166.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, bavery <brian.avery@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Aug 2016 09:04:20 +0100
In-Reply-To: <db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
References: <cover.1470627445.git.brian.avery@intel.com>
	<238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 08:04:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
> On 08/08/2016 05:43 AM, bavery wrote:
> > The openssh-sftp-server was already part of the pakagegroup. Adding
> > the openssh-server
> > lets the sftp server start up correctly.
> 
> If openssh-sftp-server cannot run without openssh, shouldn't it
> RDEPEND 
> on it instead ?

I suspect you are right and that it needs an RDEPENDS if it doesn't
work without it. It also needs a comment explaining the dependency so
someone doesn't remove it.

Cheers,

Richard

