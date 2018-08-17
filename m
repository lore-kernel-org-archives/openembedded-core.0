Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2877199E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 08:20:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2018 01:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,250,1531810800"; d="scan'208";a="82523481"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.195])
	([10.221.21.195])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2018 01:20:25 -0700
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com,
	openembedded-core@lists.openembedded.org
References: <20180817051712.6609-1-akuster808@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <c9bfa0c1-0a53-0228-8e6b-ba3ed5f696d8@intel.com>
Date: Fri, 17 Aug 2018 16:20:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180817051712.6609-1-akuster808@gmail.com>
Subject: Re: [PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 08:20:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2018 01:17 PM, Armin Kuster wrote:
> release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html
> 
> add ssl3 and tls1.3 config options now supported.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
>  .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 04c0fd2af8..cf947d445e 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[ssl3] = "--with-ssl3-support,--disable-ssl3-support,"

This should be --enable-ssl3-support ...

> +PACKAGECONFIG[tls13] = "--with-tls13-support,--disable-tls13-support,"

and, --enable-tls13-support.

