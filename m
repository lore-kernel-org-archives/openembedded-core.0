Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2EA0786EA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 08:44:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w088hvn9008361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 8 Jan 2018 08:43:59 GMT
Message-ID: <1515401037.29722.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Jan 2018 08:43:57 +0000
In-Reply-To: <1515344260-81575-1-git-send-email-juro.bystricky@intel.com>
References: <1515344260-81575-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 1/2] groff_1.22.3.bb: support SOURCE_DATE_EPOCH
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
X-List-Received-Date: Mon, 08 Jan 2018 08:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-01-07 at 08:57 -0800, Juro Bystricky wrote:
> Patch backported from Debian:
> https://sources.debian.net/src/groff/1.22.3-9/debian/patches/source-d
> ate-epoch.patch/
> 
> Various documents contain information such as:
> 
> %%Creator:·groff·version·1.22.3
> %%CreationDate:·Sat·Nov·11·01:04:26·2017
> 
> The intent is to replace CreationDate by a value specified
> by SOURCE_DATE_EPOCH (if present in environment).
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../groff/groff-1.22.3/source-date-epoch.patch     | 286
> +++++++++++++++++++++
>  meta/recipes-extended/groff/groff_1.22.3.bb        |   1 +
>  2 files changed, 287 insertions(+)
>  create mode 100644 meta/recipes-extended/groff/groff-1.22.3/source-
> date-epoch.patch

Doesn't build on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/703/steps/BuildImages/logs/stdio

Cheers,

Richard

