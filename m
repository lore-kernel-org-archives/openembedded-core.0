Return-Path: <zboszor@pr.hu>
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id 7F625787DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 15:02:33 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ecBhw-000728-6e; Thu, 18 Jan 2018 16:02:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vkWienMZIf/YZ5anBaZz4MH+Q1/68QGhRkjeSvDsQIQ=;
	b=IM9XqfgQ8BuuDywGcUsVy7+HMP
	n8yMh6WzG2BZ5YSRlYyv4TeAe20gj3vXG5U47NhIHMcLlAT4dfB0jWF08EY2u5ce6WeOzXr5ThnnV
	sfIcrRtVRpe+gANwtNpKDfA6MtxpAgC5bKou2KaiVR5zvZDDsRzzvKLEIr63aH93eyw4OIDhYbPOI
	zK8CW7DdXpnTN0WUz8HrcRa6d/OlU1tUizVGXdlxAMru0QmKOmUkCON59fqz2TulAVtQiOTD2ofBP
	ScpQEk6DSzNCIoIXzKQEuz1gAgM3FfXgQXnGsgMSNLBM9F1eJXvg8JryTCIvfj8xQXPap7EX0mNKJ
	KFvJ6RcQ==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1ecBho-0002rB-R2; Thu, 18 Jan 2018 16:02:22 +0100
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180118123804.2465-1-ross.burton@intel.com>
	<20180118123804.2465-2-ross.burton@intel.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <86e573b5-bf02-2046-d67c-4c696d6aec03@pr.hu>
Date: Thu, 18 Jan 2018 16:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180118123804.2465-2-ross.burton@intel.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.1 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: 2018-01-18 13:38 keltez_ssel, Ross Burton _rta: > This changes
	the cmake class to use Ninja instead of Make by default. Can we still
	use
	"oe_runmake [-C subdir] target" with Ninja or is it considered a broken
	build
	and forced to use the "Unix Makefiles" generator? I have a working
	mariadb
	10.2.12 recipe and the native build is trimmed down to the absolute
	necessary pieces: [...]
X-Scan-Signature: 520b7d319569d55d657de1c7ae64b270
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180118150222Z
Subject: Re: [PATCH 2/2] cmake: use Ninja by default
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
X-List-Received-Date: Thu, 18 Jan 2018 15:02:33 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2018-01-18 13:38 keltezéssel, Ross Burton írta:
> This changes the cmake class to use Ninja instead of Make by default.

Can we still use "oe_runmake [-C subdir] target" with Ninja or
is it considered a broken build and forced to use the "Unix Makefiles" generator?
I have a working mariadb 10.2.12 recipe and the native build is trimmed down
to the absolute necessary pieces:

oe_runmake import_executables
oe_runmake -C libmariadb

Best regards,
Zoltán Böszörményi

> If a recipe is broken with Ninja then the recipe can set OECMAKE_GENERATOR="Unix
> Makefiles" to change back to Make.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/cmake.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 74a952142ff..d60dad8d66b 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -9,7 +9,7 @@ CCACHE = ""
>   
>   # What CMake generator to use.
>   # The supported options are "Unix Makefiles" or "Ninja".
> -OECMAKE_GENERATOR ?= "Unix Makefiles"
> +OECMAKE_GENERATOR ?= "Ninja"
>   
>   python() {
>       generator = d.getVar("OECMAKE_GENERATOR")
> 


