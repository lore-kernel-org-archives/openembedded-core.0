Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDB16D4ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 15:47:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2013 07:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,678,1378882800"; d="scan'208";a="431387949"
Received: from unknown (HELO helios.localnet) ([10.252.121.166])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2013 07:47:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 11 Nov 2013 15:47:21 +0000
Message-ID: <27143722.kSNEIjm3EO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1311101257290.3090@oneiric>
References: <alpine.DEB.2.02.1311101257290.3090@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: question about FILE_DIRNAME versus THISDIR when setting FILESPATH
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
X-List-Received-Date: Mon, 11 Nov 2013 15:47:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Sunday 10 November 2013 13:02:32 Robert P. J. Day wrote:
>   probably a simple answer to this, but in examining the way FILESPATH
> is created, i notice that, in .bb recipe files, the general form of
> setting FILESPATH always seems to involve the use of the FILE_DIRNAME
> variable, such as in the default value from base.bbclass:
> 
> FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
> "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> 
>   however, when one is extending FILESPATH in .bbappend files, the
> variable used to refer to the current directory is always THISDIR. but
> it's not clear what the distinction is.
> 
>   i'm using "bb show" and, when i'm referring to the value of
> FILESPATH for an overlayed recipe, both FILE_DIRNAME and THISDIR seem
> to properly refer to the directory for the bbappend file.
> 
>   can someone clarify the proper usage of these variables? in
> particular, why it's important for .bb files to use FILE_DIRNAME but
> .bbappend files to use THISDIR? thanks.

These variables are set in pretty much the same way; the only difference is 
that FILE_DIRNAME doesn't expand FILE before running it through 
os.path.dirname(); I'm not sure if that is deliberate or not. In practice I 
doubt it makes any difference since FILE is set to a full path by BitBake, 
although as you note a convention has been established of using THISDIR in 
bbappends and FILE_DIRNAME elsewhere.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

