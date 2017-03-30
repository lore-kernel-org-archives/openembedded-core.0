Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 36C4977C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2U9VF5Q030263; 
	Thu, 30 Mar 2017 10:31:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZEYkM5C4lM95; Thu, 30 Mar 2017 10:31:15 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2U9VEC0030254
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 10:31:15 +0100
Message-ID: <1490866274.13980.344.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:31:14 +0100
In-Reply-To: <cf44bdfa-67df-f382-f497-7362b9b584f3@linux.intel.com>
References: <20170329231606.22118-1-pkj@axis.com>
	<cf44bdfa-67df-f382-f497-7362b9b584f3@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Thu, 30 Mar 2017 09:31:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-30 at 12:29 +0300, Alexander Kanavin wrote:
> On 03/30/2017 02:16 AM, Peter Kjellerstedt wrote:
> > 
> > Only change the ownership of ${libdir}/gio/modules/giomodule.cache
> > if
> > it exists.
> Why do we need to change the owndership in the first place?

The qemu call in the line above is made under PSEUDO_UNLOAD, see the
original patch from Chris.

Cheers,

Richard


