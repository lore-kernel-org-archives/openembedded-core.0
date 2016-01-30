Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A774D771C0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:34:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2016 17:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,367,1449561600"; d="scan'208";a="643799645"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.148])
	([10.3.52.148])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2016 17:34:53 -0800
Message-ID: <1454117651.22677.6.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 17:34:11 -0800
In-Reply-To: <1453029405.27999.16.camel@linuxfoundation.org>
References: <1453029405.27999.16.camel@linuxfoundation.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg/image: Enhance bootimg to respect RM_OLD_IMAGE
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
X-List-Received-Date: Sat, 30 Jan 2016 01:34:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[Resending from an email subscribed to the oe list...]
On Sun, 2016-01-17 at 11:16 +0000, Richard Purdie wrote:
> @@ -294,7 +286,10 @@ python do_bootimg() {
>          bb.build.exec_func('build_efi_cfg', d)
>      bb.build.exec_func('build_hddimg', d)
>      bb.build.exec_func('build_iso', d)
> +    bb.build.exec_func('create_symlinks', d)
When I try to use bootimg.bbclass I get the following warning:

WARNING: Function create_symlinks doesn't exist

This is because create_symlinks is defined in image.bbclass but
bootimg.bbclass does not inherit from it. Should it be the case? Or the
definiton of create_symlinks should be moved to a separate file?

Thanks and BR,
Ricardo


