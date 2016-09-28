Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3739160079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:44:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8SFiftK027563
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:44:41 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 08:44:40 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
	<CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
	<57EBDC0E.9030108@linux.intel.com>
	<CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <596619b6-5742-3284-0966-9ae0c9a7c5a3@windriver.com>
Date: Wed, 28 Sep 2016 10:44:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
Subject: Re: [PATCH] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 15:44:41 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 9/28/16 10:26 AM, Khem Raj wrote:
> We need to understand that disclaimer may be its requiring every one who is
> distributing it to accept it.

It is purely Oracle wanting to stop people from automatically downloading from
them, also so they can harvest sales contacts.  (nothing wrong with that, but it
means that we should likely pick a different 'upstream'...)

As Anibal indicated, the license itself has not changed -- so that is not an issue.

--Mark

> 
> On Sep 28, 2016 8:04 AM, "Aníbal Limón" <anibal.limon@linux.intel.com
> <mailto:anibal.limon@linux.intel.com>> wrote:
> 
> 
> 
>     On 09/27/2016 08:24 PM, Khem Raj wrote:
>     > On Tue, Sep 27, 2016 at 4:44 PM, Aníbal Limón
>     > <anibal.limon@linux.intel.com <mailto:anibal.limon@linux.intel.com>> wrote:
>     >> For apply this patch we need to host the db-6.0.35 tarball into yp
>     >> sources mirror because oracle page ask for login in order to download
>     >> the source.
>     >
>     > why do they ask for login ? is there some disclaimer that needs to be
>     > accepted before download ?
> 
>     That's right, for be able to build i need to put into my own source
>     mirror for download.
> 
>     >
>     >>
>     >>         alimon
>     >>
>     >> On 09/27/2016 06:43 PM, Aníbal Limón wrote:
>     >>> This is a minor upgrade that fix an issue related to multiple
>     >>> rpm instances querying the database [1].
>     >>>
>     >>> The bugfixes related are,
>     >>>
>     >>> - Fixed a bug that may lead to a crash when opening multiple environments
>     >>> in a multi-threaded program.
>     >>> - Fixed a bug where closing a panic environment raised access violation
>     >>>   and crashed the program.
>     >>>
>     >>> For see the complete list of changes mainly bugfixes between
>     >>> 6.0.30 and 6.0.35 [2].
>     >>>
>     >>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10157#c0
>     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=10157#c0>
>     >>> [2]
>     http://download.oracle.com/otndocs/products/berkeleydb/html/changelog_6_0.html#idp503384
>     <http://download.oracle.com/otndocs/products/berkeleydb/html/changelog_6_0.html#idp503384>
>     >>>
>     >>> [YOCTO #10157]
>     >>>
>     >>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com
>     <mailto:anibal.limon@linux.intel.com>>
>     >>> ---
>     >>>  meta/recipes-support/db/{db_6.0.30.bb <http://db_6.0.30.bb> =>
>     db_6.0.35.bb <http://db_6.0.35.bb>} | 4 ++--
>     >>>  1 file changed, 2 insertions(+), 2 deletions(-)
>     >>>  rename meta/recipes-support/db/{db_6.0.30.bb <http://db_6.0.30.bb> =>
>     db_6.0.35.bb <http://db_6.0.35.bb>} (96%)
>     >>>
>     >>> diff --git a/meta/recipes-support/db/db_6.0.30.bb <http://db_6.0.30.bb>
>     b/meta/recipes-support/db/db_6.0.35.bb <http://db_6.0.35.bb>
>     >>> similarity index 96%
>     >>> rename from meta/recipes-support/db/db_6.0.30.bb <http://db_6.0.30.bb>
>     >>> rename to meta/recipes-support/db/db_6.0.35.bb <http://db_6.0.35.bb>
>     >>> index 072cbdf..4a3b72f 100644
>     >>> --- a/meta/recipes-support/db/db_6.0.30.bb <http://db_6.0.30.bb>
>     >>> +++ b/meta/recipes-support/db/db_6.0.35.bb <http://db_6.0.35.bb>
>     >>> @@ -26,8 +26,8 @@ SRC_URI =
>     "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz
>     <http://download.oracle.com/berkeley-db/db-${PV}.tar.gz> \
>     >>>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
>     >>>             "
>     >>>
>     >>> -SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
>     >>> -SRC_URI[sha256sum] =
>     "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
>     >>> +SRC_URI[md5sum] = "c65a4d3e930a116abaaf69edfc697f25"
>     >>> +SRC_URI[sha256sum] =
>     "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5ad6354a98eeedb825de55"
>     >>>
>     >>>  # Exclude NC versions which lack AES encryption
>     >>>  UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
>     >>>
>     >>
>     >>
>     >> --
>     >> _______________________________________________
>     >> Openembedded-core mailing list
>     >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>     >>
> 
> 
> 


