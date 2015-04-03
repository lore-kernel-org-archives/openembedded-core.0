Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F2F6773CE9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 19:01:03 +0000 (UTC)
Message-ID: <551EE36E.2050906@communistcode.co.uk>
Date: Fri, 03 Apr 2015 20:01:02 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<1c70c6838a3982473669bd6001a6b1496144aaa6.1428070227.git.cristian.iorga@intel.com>
In-Reply-To: <1c70c6838a3982473669bd6001a6b1496144aaa6.1428070227.git.cristian.iorga@intel.com>
Subject: Re: [PATCH 1/5] bluez5: upgrade to 5.29
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
X-List-Received-Date: Fri, 03 Apr 2015 19:01:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2015 15:13, Cristian Iorga wrote:
> - Large release with over a month and 475 commits since 5.28;
> - Internal GATT library received lots of updates;
> - Fix for AVCTP key repeat timeout;
> - Added support for the Multi Profile Specification (MPS).
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-connectivity/bluez5/{bluez5_5.28.bb => bluez5_5.29.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/bluez5/{bluez5_5.28.bb => bluez5_5.29.bb} (88%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.28.bb b/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
> similarity index 88%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.28.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.29.bb
> index e816998..0fe8e7f 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.28.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
> @@ -1,6 +1,6 @@
>   require bluez5.inc
> -SRC_URI[md5sum] = "bc20a8285530758c68f6a60e4ca62a15"
> -SRC_URI[sha256sum] = "85bab48f4b47a158739028682c1e09cf30099c8ea9dfe63360055f8e06fc18a9"
> +SRC_URI[md5sum] = "aa9dc91689695a486c78c131cd68673e"
> +SRC_URI[sha256sum] = "df216a6d5ec6133355e5d4ed6b5e7a188a940940d337374e166758513246f0e4"
>
>   # noinst programs in Makefile.tools that are conditional on READLINE
>   # support
>

5.30 is available now I think

