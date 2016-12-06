Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7F76271A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 481E431C21E0;
	Tue,  6 Dec 2016 19:41:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XlygqHPlvP3M; Tue,  6 Dec 2016 19:41:31 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B752C31C1C7B;
	Tue,  6 Dec 2016 19:41:30 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-22-git-send-email-obi@opendreambox.org>
	<CAJTo0Lb2fVvMAtrTFLQwMjWhubMyF_Cbz7ccDxgsdHPmKnwruw@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <022c6339-1f2f-bd63-c8dc-1a6f74fa1eb2@opendreambox.org>
Date: Tue, 6 Dec 2016 19:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb2fVvMAtrTFLQwMjWhubMyF_Cbz7ccDxgsdHPmKnwruw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/33] package_manager/deb: create Packages.xz
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
X-List-Received-Date: Tue, 06 Dec 2016 18:41:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 18:22, Burton, Ross wrote:
> 
> On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     +        xz = bb.utils.which(os.getenv('PATH'), "xz")
> 
> 
> Are the relevant dependencies present to ensure that xz-native has been
> staged?  Is it always present because apt links to a library in xz so
> the binaries get pulled in too?

That's a good question. I guess I didn't add anything, because there's
no direct dependency in place for gzip-native either.

I don't know if it counts, but there's a dependency on apt-native and
apt's source tarball, like many others, is compressed with xz. By
default, apt also depends on xz because of PACKAGECONFIG = "lzma", but
that may obviously get changed by users.

Regards,
Andreas

