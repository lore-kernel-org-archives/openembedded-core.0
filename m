Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 80A6D756CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 11:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t52BUnT5001438; Tue, 2 Jun 2015 12:30:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p40TYanIPS6b; Tue,  2 Jun 2015 12:30:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t52BUag2001435
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Jun 2015 12:30:47 +0100
Message-ID: <1433244636.404.191.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Musat, George L" <george.l.musat@intel.com>
Date: Tue, 02 Jun 2015 12:30:36 +0100
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C2671384A@IRSMSX107.ger.corp.intel.com>
References: <1432898941-1148-1-git-send-email-george.l.musat@intel.com>
	<1433021213.404.150.camel@linuxfoundation.org>
	<042E875E1B5D414CA9BB78B7D4FA691C2671384A@IRSMSX107.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/parselogs: Added another batch of errors to the whitelist.
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
X-List-Received-Date: Tue, 02 Jun 2015 11:30:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-02 at 09:50 +0000, Musat, George L wrote:
> Hi Richard,
> 
> Are you sure it's this patches fault for that? I only added some more
> errors to the lists. Also I tested the patch locally and runs fine on
> qemux86 master. For the Centos it looks like a network problem
> occurred half way into the tests.

I saw the same error locally, when I reverted the patch it went away so
I'm pretty sure it was from this patch, yes.

Cheers,

Richard


