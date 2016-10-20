Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8536B60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9KAk1gZ030017; Thu, 20 Oct 2016 11:46:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6eoX1-6wKklu; Thu, 20 Oct 2016 11:46:01 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9KAjsRo029983
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Oct 2016 11:45:56 +0100
Message-ID: <1476960354.2166.107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 20 Oct 2016 11:45:54 +0100
In-Reply-To: <alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
	<1476915092.2166.105.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Thu, 20 Oct 2016 10:46:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-20 at 06:31 -0400, Robert P. J. Day wrote:
>   just for fun, i'm going to do a fresh build right now, involving:
> 
> * fresh "git pull" of poky
> * MACHINE=mpc8315e-rdb
> * bitbake core-image-minimal
> 
[...]
> $ ls -l
> total 328
> drwxr-xr-x. 2 rpjday rpjday   4096 Oct 20 05:54 all
> drwxr-xr-x. 2 rpjday rpjday  40960 Oct 20 06:06 mpc8315e_rdb
> drwxr-xr-x. 2 rpjday rpjday 286720 Oct 20 06:09 ppce300c3
> $
> 
> should i have expected a nativesdk directory?

No, since you didn't build anything that uses nativesdk. Examples that
do would be:

bitbake buildtools-tarball
bitbake core-image-minimal -c populate_sdk

Cheers,

Richard

