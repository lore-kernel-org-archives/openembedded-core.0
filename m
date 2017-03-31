Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 142AC77B99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1383; q=dns/txt; s=iport;
	t=1490957159; x=1492166759;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=QHXe5gMKJIqLrOlnvBhspMxIo4aLMXCpH9NTlbIWTX0=;
	b=XbZcoRHPi3F40vnxkTU1Kt358TIR1p4Gk8wq2G0MtktOCKIOWRrERl/2
	zMklqqmNAG22Px6GUFIYVbmTNRgPbfMmApW8Z5eVqRtcT8NZKEOVgmDj7
	98zv+/cD6Dy53I1GQjPOPzI5n7Dkaoi+8PBZUK9Xph+RLikYlNzlE11/Q M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CAAQAdMt5Y/xbLJq1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBhUCDYooSc5Bjk0GCD4IOgmyDNgKEBBgBAgEBAQEBAQFrKIUVAQE?=
	=?us-ascii?q?BAQIBIw8BRhALDgoCAiMDAgI9CREGDQYCAQGJewUIrUKCJopcAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEhE3iFQ4IFgUCBKodagl8BBJBijAiSUJE3k20fOIEFOyAVhVCBTT0?=
	=?us-ascii?q?1ig8BAQE?=
X-IronPort-AV: E=Sophos;i="5.36,251,1486425600"; d="scan'208";a="651834540"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 10:45:54 +0000
Received: from tuxracer.local (ams3-vpn-dhcp4539.cisco.com [10.61.81.186])
	(authenticated bits=0)
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id v2VAjrFo020749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 31 Mar 2017 10:45:53 GMT
To: Christopher Larson <kergoth@gmail.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
	<a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
	<CAJTo0La9kxbzE4drCC5YP-2sZb+6WeBqwH1jw8yGgzaYLi+EWw@mail.gmail.com>
	<b3461cd0-8336-3c15-5a5b-193fb68ed3ad@cisco.com>
	<CABcZAN=5Xohyw3HJ4wtUxV3-j2rTA=tMcQka0NfqWqUZUAOanQ@mail.gmail.com>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <8d2a707e-cc38-ffd6-ae01-0bec5b078fb9@cisco.com>
Date: Fri, 31 Mar 2017 13:45:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=5Xohyw3HJ4wtUxV3-j2rTA=tMcQka0NfqWqUZUAOanQ@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: spopovyc
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Fri, 31 Mar 2017 10:45:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


> 
> On Thu, Mar 30, 2017 at 11:30 AM, Serhii Popovych <spopovyc@cisco.com
> <mailto:spopovyc@cisco.com>> wrote:
> 
>     >
>     > On 29 March 2017 at 13:51, Serhii Popovych <spopovyc@cisco.com <mailto:spopovyc@cisco.com>
>     > <mailto:spopovyc@cisco.com <mailto:spopovyc@cisco.com>>> wrote:
>     >
>     >     That's great. What the subject of this change in openembedded-core?
>     >     I wish to test it.
>     >
>     >     Because with current *master* I see problem is still here.
>     >
>     >
>     > "    sysroot-relativelinks: also consider links to dirs on the host"
>     > oe-core c5b522378fff13962a5187d9d09979866f805cb5, now in master.
> 
>     Tested, works for SDK, but does not work for buildtools-tarball
>     (e.g. bitbake buildtools-tarball).
> 
> 
> Ah, that makes sense, sysroot-relativelinks being run is handled by
> image.bbclass at this time, which wouldn’t be inherited for that recipe.
> Perhaps add this to the recipe:
> 
>     POPULATE_SDK_POST_TARGET_COMMAND += “rootfs_sysroot_relativelinks;"
Still no luck.

Added inherit rootfs-postcommands, which provides
rootfs_sysroot_relativelinks, and command you mentioned above to
buildtools-tarball recipe.


> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

