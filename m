Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6004065C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 10:17:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2015 02:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="439902579"
Received: from ikatz2-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.193])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2015 02:04:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Date: Tue, 13 Jan 2015 10:17:07 +0000
Message-ID: <2660201.qfFQ8E793P@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDAE519B@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1421054310.31262.2.camel@linuxfoundation.org>
	<1B56A49860EB2D45ADE3731B15C959FDAE519B@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Tue, 13 Jan 2015 10:17:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lei,

On Tuesday 13 January 2015 02:19:55 Lei, Maohui wrote:
> > I can't spot the upgrade from 4.9.1 to 4.9.2 in here. The SRC_URI
> > checksums are unchanged for example? Is there part of the patch missing?
> 
> When I bitbake the gcc-4.9.2, there is no error or warning message about the
> checksums. But it did wrong.
> [downloads]$ md5sum gcc-4.9.2.tar.bz2 > gcc-4.9.2.tar.bz2.sum
> [downloads]$ cat gcc-4.9.2.tar.bz2.sum
> 4df8ee253b7f3863ad0b86359cd39c43  gcc-4.9.2.tar.bz2
> [downloads]$
> 
> I noticed that there is a file named
> "gcc-4.9.2.tar.bz2_bad-checksum_4df8ee253b7f3863ad0b86359cd39c43" in my
> download directory. I don't know why. 

This will be from the first fetch you had with the old checksums.

> I think md5sum will be checked automatically. Is it a bug?

Once a file has been successfully downloaded and checksums matched once (and 
the .done file has been written), they won't be checked again for that file. Did 
you perhaps update the checksum in one of the gcc recipes and not some of the 
others? If so, that would explain this situation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

