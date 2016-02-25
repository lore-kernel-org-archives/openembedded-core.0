Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72C7B77172
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:13:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1PHDm0n012453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 09:13:49 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 09:13:48 -0800
To: Joshua Lock <joshua.g.lock@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56CF364B.3080704@windriver.com>
Date: Thu, 25 Feb 2016 11:13:47 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 03/10] hardlink: add new recipe
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
X-List-Received-Date: Thu, 25 Feb 2016 17:13:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

I just noticed this, any reason to use this over fdupes?

I've used fdupes in the past for this exact thing -- primarily with shrinking
the size of multilib SDKs with a lot of locales.

--Mark

On 2/24/16 8:52 AM, Joshua Lock wrote:
> ---
>  meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> 
> diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> new file mode 100644
> index 0000000..2e06ac2
> --- /dev/null
> +++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "hardlink is a tool which replaces multiple copies of a file with hardlinks."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
> +
> +SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar.xz"
> +SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
> +SRC_URI[sha256sum] = "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
> +
> +DEPENDS = "libpcre attr"
> +
> +do_compile () {
> +	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
> +}
> +
> +do_install () {
> +	oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> 


