Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 74FB271951
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:04:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 09:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="45061843"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.26.146])
	by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2016 09:04:17 -0800
Message-ID: <1455037451.6918.18.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2016 17:04:11 +0000
In-Reply-To: <1455029653-4207-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455029653-4207-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] tzdata: remove 2015d version
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
X-List-Received-Date: Tue, 09 Feb 2016 17:04:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-09 at 15:54 +0100, Martin Jansa wrote:
> * this is left-over from upgrade to 2016a
> 
> * it's safer to remove so that .bbappends in other layers really
> apply to version
>   used in build (currently we have bbappend for 2015d and build will
> use 2016a
>   without any warning
> 
> * the same problem was reported with 2015f upgrade:
>   http://lists.openembedded.org/pipermail/openembedded-core/2015-
> August/109708.html

Thanks, I've pushed this change to my joshuagl/fido-next branch.

http://cgit.openembedded.org/openembedded-core-
contrib/log/?h=joshuagl/fido-next

Regards,

Joshua

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/tzdata/tzdata_2015d.bb | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb
> 
> diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb
> b/meta/recipes-extended/tzdata/tzdata_2015d.bb
> deleted file mode 100644
> index d8e5f24..0000000
> --- a/meta/recipes-extended/tzdata/tzdata_2015d.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tz
> data"
> -
> -SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
> -SRC_URI[tzdata.sha256sum] =
> "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
> -
> -require tzdata.inc
> -- 
> 2.7.0
> 

