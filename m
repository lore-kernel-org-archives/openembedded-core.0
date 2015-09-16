Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB5660053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:12:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GEClXU022610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Sep 2015 07:12:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 07:12:46 -0700
Message-ID: <55F978DD.9060007@windriver.com>
Date: Wed, 16 Sep 2015 22:12:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
	<8bf3ec997007d1d921f4dce21f55612da0dce585.1442389930.git.liezhi.yang@windriver.com>
	<CAJTo0LbZTObHC+Urrc=3_EXWVaJb-_JeMnxO+=cRXsZySzM4PA@mail.gmail.com>
In-Reply-To: <CAJTo0LbZTObHC+Urrc=3_EXWVaJb-_JeMnxO+=cRXsZySzM4PA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] subversion: 1.8.13 -> 1.8.14 since 1.8.13.tar.gz was gone
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
X-List-Received-Date: Wed, 16 Sep 2015 14:12:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2015 09:16 PM, Burton, Ross wrote:
>
> On 16 September 2015 at 08:52, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The subversion-1.8.13.tar.bz2 is gone from ftp, so upgrade to 1.8.14.
>
>
> The FTP server only contains the latest release for each release series so if
> they release a 1.8.15 the day after we ship Jethro we'd need to upgrade
> subversion again.
>
> The subversion archive is at http://archive.apache.org/dist/subversion/ and
> includes all historical releases.  The recipe should use this URL instead.

Thanks, I updated it in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/3fixes

commit 967c17d861ce2b9835e3ab12d5b172b059291dd7
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Sep 16 07:05:47 2015 -0700

     subversion: fix SRC_URI

     Fixed:
     WARNING: Failed to fetch URL 
http://www.apache.org/dist/subversion/subversion-1.8.13.tar.bz2, attempting 
MIRRORS if available

     Ross:
     The FTP server only contains the latest release for each release series,
     the subversion archive is at http://archive.apache.org/dist/subversion/
     and includes all historical releases. The recipe should use this URL
     instead.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb 
b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index f843b95..eb1f0f2 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"

  inherit gettext pythonnative

-SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/${BPN}/${BP}.tar.bz2 \
             file://libtool2.patch \
             file://disable_macos.patch \
             file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \

// Robert

>
> Ross

