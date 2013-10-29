Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A738E6D005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:58:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9T9wYYb000580; Tue, 29 Oct 2013 09:58:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vGRBW4smtaWI; Tue, 29 Oct 2013 09:58:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9T9wSp9000565
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 29 Oct 2013 09:58:29 GMT
Message-ID: <1383040703.17867.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 29 Oct 2013 09:58:23 +0000
In-Reply-To: <1378721846-3634-1-git-send-email-anders.roxell@linaro.org>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
	<1378721846-3634-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: linaro-networking@linaro.org, patches@linaro.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] ltp: update to new release 20130904
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
X-List-Received-Date: Tue, 29 Oct 2013 09:58:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-09 at 12:17 +0200, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (94%)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
> similarity index 94%
> rename from meta/recipes-extended/ltp/ltp_20130503.bb
> rename to meta/recipes-extended/ltp/ltp_20130904.bb
> index 387826d..5e10448 100644

It seems this patch is causing problems on the autobuilder, e.g.:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5379

but this is occurring on multiple architectures. Looks like some kind of
parallel make race :(

Cheers,

Richard


