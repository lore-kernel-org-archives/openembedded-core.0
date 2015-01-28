Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A10A47147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 04:05:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2015 20:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,479,1418112000"; d="scan'208";a="518742060"
Received: from cmfiguer-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.248.194])
	by orsmga003.jf.intel.com with ESMTP; 27 Jan 2015 19:57:58 -0800
Message-ID: <54C85FF2.7080408@linux.intel.com>
Date: Tue, 27 Jan 2015 20:05:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Qian Lei <qianl.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
References: <1422414850-28982-1-git-send-email-qianl.fnst@cn.fujitsu.com>
In-Reply-To: <1422414850-28982-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Subject: Re: [master][PATCH] openssl: upgrade to 1.0.1l
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
X-List-Received-Date: Wed, 28 Jan 2015 04:05:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


I think that 1.0.2 is now released also!

Sau!


On 01/27/2015 07:14 PM, Qian Lei wrote:
>
> | Changes between 1.0.1k and 1.0.1l [15 Jan 2015]
> |
> |  *) Build fixes for the Windows and OpenVMS platforms
> |     [Matt Caswell and Richard Levitte]
> |
> | Changes between 1.0.1j and 1.0.1k [8 Jan 2015]
> |
> |     (CVE-2014-3571)
> |     (CVE-2015-0206)
> |     (CVE-2014-3569)
> |     (CVE-2014-3572)
> |     (CVE-2015-0204)
> |     (CVE-2015-0205)
> |     (CVE-2014-8275)
> |     (CVE-2014-3570)
> |
> |  *) Ensure that the session ID context of an SSL is updated when its
> |     SSL_CTX is updated via SSL_set_SSL_CTX.
> |
> |  *) Fix various certificate fingerprint issues.
> |
> |  *) Do not resume sessions on the server if the negotiated protocol
> |     version does not match the session's version. Resuming with a different
> |     version, while not strictly forbidden by the RFC, is of questionable
> |     sanity and breaks all known clients.
> |     [David Benjamin, Emilia Käsper]
> |
> |  *) Tighten handling of the ChangeCipherSpec (CCS) message: reject
> |     early CCS messages during renegotiation. (Note that because
> |     renegotiation is encrypted, this early CCS was not exploitable.)
> |     [Emilia Käsper]
> |
> |  *) Tighten client-side session ticket handling during renegotiation:
> |     ensure that the client only accepts a session ticket if the server sends
> |     the extension anew in the ServerHello. Previously, a TLS client would
> |     reuse the old extension state and thus accept a session ticket if one was
> |     announced in the initial ServerHello.
> |
> |     Similarly, ensure that the client requires a session ticket if one
> |     was advertised in the ServerHello. Previously, a TLS client would
> |     ignore a missing NewSessionTicket message.
> |     [Emilia Käsper]
>
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>   .../openssl/{openssl_1.0.1j.bb => openssl_1.0.1l.bb}                  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.1j.bb => openssl_1.0.1l.bb} (92%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1l.bb
> similarity index 92%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.1l.bb
> index 2da18ae..840b995 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1l.bb
> @@ -38,8 +38,8 @@ SRC_URI += "file://configure-targets.patch \
>               file://run-ptest \
>              "
>
> -SRC_URI[md5sum] = "f7175c9cd3c39bb1907ac8bba9df8ed3"
> -SRC_URI[sha256sum] = "1b60ca8789ba6f03e8ef20da2293b8dc131c39d83814e775069f02d26354edf3"
> +SRC_URI[md5sum] = "cdb22925fc9bc97ccbf1e007661f2aa6"
> +SRC_URI[sha256sum] = "b2cf4d48fe5d49f240c61c9e624193a6f232b5ed0baf010681e725963c40d1d4"
>
>   PACKAGES =+ " \
>   	${PN}-engines \
>

