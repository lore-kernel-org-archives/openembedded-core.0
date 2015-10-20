Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1063676F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9K9GgvO021692; Tue, 20 Oct 2015 10:16:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xsJIet22p--e; Tue, 20 Oct 2015 10:16:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9K9Gcsv021687
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Oct 2015 10:16:50 +0100
Message-ID: <1445332598.17974.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 20 Oct 2015 10:16:38 +0100
In-Reply-To: <1445281177-3309-5-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
	<1445281177-3309-5-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
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
X-List-Received-Date: Tue, 20 Oct 2015 09:16:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-19 at 11:59 -0700, Andre McCurdy wrote:
> Use 'atom' as an alias for the first generation Intel Atom CPUs.
> ---
>  meta/conf/machine/include/tune-atom.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
> index 5e1bb74..24cd676 100644
> --- a/meta/conf/machine/include/tune-atom.inc
> +++ b/meta/conf/machine/include/tune-atom.inc
> @@ -1,2 +1,2 @@
> -# Atom tunings are the same as core2 for now...
> -require conf/machine/include/tune-core2.inc
> +# Alias for the first generation of Intel Atom CPUs.
> +require conf/machine/include/tune-bonnell.inc

This is actually pretty nasty to anyone who uses package feeds or
packages since all of a sudden, the system rebuilds with a completely
different package architecture. Not sure we can take this change for
that reason.

I'd also like to understand how much of a difference these specific
tunes actually give. I know the Intel people have been trying to focus
on a smaller number of tunes that work well on the majority of platforms
rather than micro optimising the tunes.

Are there some benchmark numbers or other analysis which shows these
tunes as being more effective?

Cheers,

Richard




