Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7E46011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UCIPUs021961; Tue, 30 Aug 2016 13:19:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qQALIeVg91wP; Tue, 30 Aug 2016 13:19:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UCJ3nY022048
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 13:19:05 +0100
Message-ID: <1472559543.29583.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 13:19:03 +0100
In-Reply-To: <921e5cf0-9980-1133-ec0b-bc874ae9c4fb@windriver.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
	<921e5cf0-9980-1133-ec0b-bc874ae9c4fb@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Tue, 30 Aug 2016 12:19:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-26 at 10:48 -0500, Mark Hatle wrote:
> The reason why cpio was originally used had to do with filenames that
> had spaces
> or other special characters in them.  (this is why the -print0 was
> used)
> 
> I don't object to the change, but we need to make sure that that will
> still work
> properly.
> 
> (Also I thought CPIO -could- do xattrs in the current versions...)

FWIW cpio itself doesn't appear to support xattrs, nor is it likely to
any time soon. It seems people had to use bsdcpio to get that
support...

Cheers,

Richard


