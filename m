Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 982426067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:41:07 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 341C068A019; Wed, 13 Jul 2016 15:41:08 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 67F4E68A019;
	Wed, 13 Jul 2016 15:41:07 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 263C36740256;
	Wed, 13 Jul 2016 16:41:07 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20160713142422.aihj4b5qmni7uair@jama>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57865303.30805@mlbassoc.com>
Date: Wed, 13 Jul 2016 16:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160713142422.aihj4b5qmni7uair@jama>
Subject: Re: Downloads from sourceforge.net
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
X-List-Received-Date: Wed, 13 Jul 2016 14:41:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-13 16:24, Martin Jansa wrote:
> Just FYI
>
> If you're seeing a lot of do_fetch failures because of SRC_URI checksums
> mismatch, be aware that there is some issue with sourceforge.net, all my
> source archive downloads (with wget) download just this HTML:
>
> wget http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.10/gptfdisk-0.8.10.tar.gz
>
> <html><head>
> <title>SourceForge</title>
> <!-- <script src="/js/jquery.com/jquery-1.11.0.min.js"></script> -->
> <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
> <script src="//sourceforge.net/js/mirrors.js"></script>
> <script src="/js/sf.js"></script>
> <script>
> var DR_loc = DR_parse_hash_url();
> if (DR_loc) {
>      DR_sf_main(DR_loc);
> } else {
>      window.location.href = 'http://sourceforge.net/home.html';
> }
> </script>
> </head><body>
> <noscript>
> We're sorry -- the Sourceforge site is currently in Disaster Recovery mode, and currently requires
> the use of javascript to function.  Please check back later.
> </noscript>
> </body></html>
>
> Which of course has different checksums than tarball with sources.
>
> You can see similar message if you try to access e.g. their blog (to find out if it's already
> known issue for them):
> http://sourceforge.net/blog/
> or
> http://sourceforge.net/blog/category/sitestatus/
>
> Until it's resolved continue to use your better-be-already-populated premirrors.

It seems to have been short lived - I had this issue with docbook-xsl-1.79.1.tar.bz2
and the second time I tried it (a few minutes later) it was fine.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

