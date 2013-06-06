Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE6356A4AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 09:37:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r569bxQd012239
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 02:37:59 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 6 Jun 2013 02:37:59 -0700
Message-ID: <51B05874.8000404@windriver.com>
Date: Thu, 6 Jun 2013 17:37:56 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.169]
Subject: Questions on nfs-utils package: Client and Server RPMs.
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
X-List-Received-Date: Thu, 06 Jun 2013 09:37:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Experts,

Currently, YOCTO's nfs-utls is separated into two main packages(RPMs) 
client and server.
They are not depend on each other. Client has only a mount.nfs user 
space App. With both
client and server RPMs installed, all works fine. But if we just install 
client RPM without
server one, we can only mount nfs server with "-o nolock" for lack of 
rpcstatd.

While in Debian system, it separate nfs-utils with a different way: one 
"common" and the
other called server. Common contains mount.nfs and many other Apps 
including rpcstatd.
This way the client side(without server RPM install) can mount remote 
NFS server in
normal mode. But the side effect is the server RPM depends on the client 
one(Debian
calls it as "common").

On this topic, any opinions on both styles? YOCTO Vs Debian. And, any 
plan to modify
YOCTO to align Debian?

Thanks
Xiao

