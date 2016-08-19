Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB8876806
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JEjnSi030697; Fri, 19 Aug 2016 15:45:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9UlukGE-Nunb; Fri, 19 Aug 2016 15:45:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JEjluU030692
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 15:45:48 +0100
Message-ID: <1471617947.16712.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 15:45:47 +0100
In-Reply-To: <1471617353-3904-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1471617353-3904-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] image_types: use COMPRESSIONTYPES variable for backward compatibility
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
X-List-Received-Date: Fri, 19 Aug 2016 14:45:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 17:35 +0300, Ed Bartosh wrote:
> Recent renaming of COMPRESSIONTYPES variable can break recipes that
> still use it. Including value of COMPRESSIONTYPES variable into
> CONVERSIONTYPES should prevent this.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Does this actually work? Won't COMPRESSION_CMD be unset in these cases
so it would just trigger further failures?

Perhaps we should just error and tell the user if COMPRESSION_TYPES is
set (in sanity.bbclass?).

Cheers,

Richard

