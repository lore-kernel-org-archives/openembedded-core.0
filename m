Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C38E76E650
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 12:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21B9920A4B;
	Thu, 26 Oct 2017 12:45:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id M09j0y6rtvgS; Thu, 26 Oct 2017 12:45:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C71B12087C;
	Thu, 26 Oct 2017 12:45:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 613CE162705; Thu, 26 Oct 2017 08:45:28 -0400 (EDT)
Date: Thu, 26 Oct 2017 08:45:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20171026124528.GV9221@denix.org>
References: <1508936236-9456-1-git-send-email-akuster808@gmail.com>
	<1508936236-9456-2-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1508936236-9456-2-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [V2][PATCH 2/2] tzdata: update 2017c
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
X-List-Received-Date: Thu, 26 Oct 2017 12:45:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2017 at 05:57:16AM -0700, Armin Kuster wrote:
> LICENSE changed to to rewording

"due to"

> https://github.com/eggert/tz/commit/7097a652778d35acf747d14f8bf7b3ced479bbc0#diff-9879d6db96fd29134fc802214163b95a
> 
>   Briefly:
>   Northern Cyprus switches from +03 to +02/+03 on 2017-10-29.
>   Fiji ends DST 2018-01-14, not 2018-01-21.
>   Namibia switches from +01/+02 to +02 on 2018-04-01.
>   Sudan switches from +03 to +02 on 2017-11-01.
>   Tonga likely switches from +13/+14 to +13 on 2017-11-05.
>   Turks & Caicos switches from -04 to -05/-04 on 2018-11-04.
>   A new file tzdata.zi now holds a small text copy of all data.
>   The zic input format has been regularized slightly.
> 
>   Changes to future time stamps
> 
>     Northern Cyprus has decided to resume EU rules starting
>     2017-10-29, thus reinstituting winter time.
> 
>     Fiji ends DST 2018-01-14 instead of the 2018-01-21 previously
>     predicted.  (Thanks to Dominic Fok.)  Adjust future predictions
>     accordingly.
> 
>     Namibia will switch from +01 with DST to +02 all year on
>     2017-09-03 at 02:00.  This affects UT offsets starting 2018-04-01
>     at 02:00.  (Thanks to Steffen Thorsen.)
> 
>     Sudan will switch from +03 to +02 on 2017-11-01.  (Thanks to Ahmed
>     Atyya and Yahia Abdalla.)  South Sudan is not switching, so
>     Africa/Juba is no longer a link to Africa/Khartoum.
> 
>     Tonga has likely ended its experiment with DST, and will not
>     adjust its clocks on 2017-11-05.  Although Tonga has not announced
>     whether it will continue to observe DST, the IATA is assuming that
>     it will not.  (Thanks to David Wade.)
> 
>     Turks & Caicos will switch from -04 all year to -05 with US DST on
>     2018-03-11 at 03:00.  This affects UT offsets starting 2018-11-04
>     at 02:00.  (Thanks to Steffen Thorsen.)
> 
>   Changes to past time stamps
> 
>     Namibia switched from +02 to +01 on 1994-03-21, not 1994-04-03.
>     (Thanks to Arthur David Olson.)
> 
>     Detroit did not observe DST in 1967.
> 
>     Use railway time for Asia/Kolkata before 1941, by switching to
>     Madras local time (UT +052110) in 1870, then to IST (UT +0530) in
>     1906.  Also, treat 1941-2's +0630 as DST, like 1942-5.
> 
>     Europe/Dublin's 1946 and 1947 fallback transitions occurred at
>     02:00 standard time, not 02:00 DST.  (Thanks to Michael Deckers.)
> 
>     Pacific/Apia and Pacific/Pago_Pago switched from Antipodean to
>     American time in 1892, not 1879.  (Thanks to Michael Deckers.)
> 
>     Adjust the 1867 transition in Alaska to better reflect the
>     historical record, by changing it to occur on 1867-10-18 at 15:30
>     Sitka time rather than at the start of 1867-10-17 local time.
>     Although strictly speaking this is accurate only for Sitka,
>     the rest of Alaska's blanks need to be filled in somehow.
> 
>     Fix off-by-one errors in UT offsets for Adak and Nome before 1867.
>     (Thanks to Michael Deckers.)
> 
>     Add 7 s to the UT offset in Asia/Yangon before 1920.
> 
>   Changes to zone names
> 
>     Remove Canada/East-Saskatchewan from the 'backward' file, as it
>     exceeded the 14-character limit and was an unused misnomer anyway.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} (97%)
> 
> diff --git a/meta/recipes-extended/tzdata/tzdata_2017b.bb b/meta/recipes-extended/tzdata/tzdata_2017c.bb
> similarity index 97%
> rename from meta/recipes-extended/tzdata/tzdata_2017b.bb
> rename to meta/recipes-extended/tzdata/tzdata_2017c.bb
> index 55e8976..9e5b929 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2017b.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2017c.bb
> @@ -2,15 +2,15 @@ SUMMARY = "Timezone data"
>  HOMEPAGE = "http://www.iana.org/time-zones"
>  SECTION = "base"
>  LICENSE = "PD & BSD & BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>  
>  DEPENDS = "tzcode-native"
>  
>  SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>  
> -SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
> -SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
> +SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
> +SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
>  
>  inherit allarch
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

