Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 465D5608DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3105; q=dns/txt; s=iport;
	t=1583851453; x=1585061053;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=VjM0BXvPpUN2045OGyZaLsM1o4W6D3+q0mISp2hiq58=;
	b=bFnBd8tNsJYfYIM1smcfT894g7YM80OR4plAxFYNVTIBuYxZzC7bRZSt
	vRR8mFW2yt4UE36MMZt4fDmg3aNl621hGa5g913AAt2l4lkVteSx6DEPO
	ncsrwyGZCOeYnWmX+FUooVBwLC88pzMiWomwPmk9+5GPffAVlmHtr/1ej M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0COAQBMp2de/xbLJq1lGwEBAQEBAQE?=
	=?us-ascii?q?FAQEBEQEBAwMBAQGBe4MVVSASKoQViQKIFoEBmj0JAQEBDAEBGAsMBAEBg35?=
	=?us-ascii?q?FAoIqOBMCAwEBCwEBBQEBAQIBBQRthVYMhWMBAQEBAgEBASEPAQU2CxAJAhg?=
	=?us-ascii?q?CAiMDAgInAR4RBg0GAgEBgyIBglsgD41BmwR1gTKFSoM1gT4UeiqMRoFBP4E?=
	=?us-ascii?q?RJ4I4NT6CZAEEgSmDSoJeBLAqgkaHVIkzhV0GHYNLi0qMJZd2klUCBAsCFYF?=
	=?us-ascii?q?pIoFYMxoIGxU7gmwJRxgNjlWITzSFDz8DMAKMO4JDAQE?=
X-IronPort-AV: E=Sophos;i="5.70,537,1574121600"; d="scan'208";a="24196675"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	10 Mar 2020 14:44:09 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTPSA id 02AEi7cv010174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Mar 2020 14:44:09 GMT
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200305115333.31139-1-rbilovol@cisco.com>
	<CA+chaQc+T+krd8kth22WeJr6xBZCQYRfTZWFkXBY1JGCoRnogA@mail.gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <26d3e02c-0dd3-9bcf-fe48-d51ca7e57ea0@cisco.com>
Date: Tue, 10 Mar 2020 16:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQc+T+krd8kth22WeJr6xBZCQYRfTZWFkXBY1JGCoRnogA@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND] openssl: pass PERL=perl environment variable to configurator
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
X-List-Received-Date: Tue, 10 Mar 2020 14:44:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/7/20 12:19 AM, Martin Jansa wrote:
> This breaks c_rehash calls from dash (works fine with bash)

Yes, we use bach during our builds

> 
> dash doesn't like
> #!perl
> shebang, would
> PERL="/usr/bin/env perl"
> work for you?
> 
> But unfortunately just passing PERL like this doesn't pass do_configure:
> Creating Makefile
> sh: 1: /usr/bin/env perl: not found
> WARNING: exit code 1 from a shell command.
> 
> But passing it as:
> HASHBANGPERL="/usr/bin/env perl" PERL=perl
> seems to work.

Will check this suggestion

Thanks,
Ruslan

> 
> On Thu, Mar 5, 2020 at 12:55 PM Ruslan Bilovol via Openembedded-core 
> <openembedded-core@lists.openembedded.org 
> <mailto:openembedded-core@lists.openembedded.org>> wrote:
> 
>     In our build environment we use wrapper script
>     for perl in non-standard configuration with
>     extra variables set (provided by custom
>     buildtools-tarball).
> 
>     In this case openssl fails to build because
>     by default it's Configure script detects and uses
>     perl executable directly (with absolute path)
>     obviously missing extra settings from wrapper
>     script.
> 
>     Pass PERL=perl environment variable to Configure,
>     so it won't try to use perl executable directly
>     but will use what is provided from environment.
> 
>     Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com
>     <mailto:rbilovol@cisco.com>>
>     ---
>       meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb> | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb>
>     b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb>
>     index c2ba005f47..d4871fe973 100644
>     --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb>
>     +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>     <http://openssl_1.1.1d.bb>
>     @@ -123,7 +123,7 @@ do_configure () {
>              fi
>              # WARNING: do not set compiler/linker flags (-I/-D etc.) in
>     EXTRA_OECONF, as they will fully replace the
>              # environment variables set by bitbake. Adjust the
>     environment variables instead.
>     -       PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
>     +       PERL=perl
>     PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
>              perl ${S}/Configure ${EXTRA_OECONF}
>     ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix
>     --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>              perl ${B}/configdata.pm <http://configdata.pm> --dump
>       }
>     -- 
>     2.17.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

