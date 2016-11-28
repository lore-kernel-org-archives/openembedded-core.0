Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9CFA71AAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 19:47:07 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id b126so163763275oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 11:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=IuEjEOBjn8ZXv7D4CzUTmnLdUpUPMpKp2vo1xYXq5jU=;
	b=J5Dzb/gbUg8hD/g6m/1gsrqVE6oxaF6+EbP9L22kmNnXFTKClLuSnreAoR5j37XRHC
	hhb6/9VQHeIIOhlX+Fe0l85vvYWLmCNph+eXYu90tyB0qZNFnmH0nhQgdYzsEKJAZTgm
	8hFVSGKlETCuO1Nfjn5RyST/0il/wnEENIEKX0W0EeUC60B+OzcUaqVHu3PuYN3WznqL
	Lg6+ncP4whuXBT/lgJbY0H0guXZJrc8sieUGR+CSXsLBqqYjJF4mFlvS/BhEH5jyhJ+g
	OSYp1gRmGnfwrcpJ49Yd6sZCFjLUVR6pgjp/W33xg3N10WHdPrqr2JaagXc85/vOa7o9
	yHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=IuEjEOBjn8ZXv7D4CzUTmnLdUpUPMpKp2vo1xYXq5jU=;
	b=OFzOeWT4YrFmkGqEZMYHvveRFs42pMp14YBPU7PdwwGrgF0je/e6QoSGKP4hfH49Gc
	SV30OOWdwGodm1bqBdV/PvbZUiUPeDmlBesbs+S1hLWZm+TDIWRbrSe39Z42DLmpuHKC
	pDQsvb10Q2o90zdYkBGcaTLNIkuEQz3UOp6pygangUHaNQ6a3JeEoZxL9rr1+p5d7+3w
	QAas35T8r0iTeD/60i1jqiR8TYyfeQb23mDVndBRO5ryFerBE/DQS9eU5wewzUyeklW5
	gCBTNKitPEH/bQyVVc87gRWtGWBEuvfc4zQEd4PomF6AtSWCuQbmvp+OGideI2hIB/sw
	aIvQ==
X-Gm-Message-State: AKaTC02h9+FVqBKjSXZSFq9yduabhqQrIs/ucsxKWEDfeAVHZOArMsuPKxEHQFQ+Y2GyNH8t
X-Received: by 10.36.66.76 with SMTP id i73mr19789121itb.50.1480362429178;
	Mon, 28 Nov 2016 11:47:09 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C83A.dip0.t-ipconnect.de. [93.232.200.58])
	by smtp.gmail.com with ESMTPSA id
	x74sm9664157ita.22.2016.11.28.11.47.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 11:47:08 -0800 (PST)
Message-ID: <1480362425.6873.209.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Date: Mon, 28 Nov 2016 20:47:05 +0100
In-Reply-To: <1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Mon, 28 Nov 2016 19:47:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
> When creating a patch set with cover letter using the
> send-pull-request script, both the "In-Reply-To" and "References"
> headers are appended twice in patch 2 and subsequent.

The "why" part is missing in the commit header. "Why" is appending those
twice a problem? Is it a bug in the script (because it violates some
RFC) or is it merely a workaround for a problem in other software (mail
programs or Patchwork)?

I know that this change is related to the issues that Patchwork has with
identifying a patch series, but even with that background knowledge it
is not clear why this fix is the right solution.

> This change appends only one header pointing to very first patch
> in series or to cover letter if available.
>
> [YOCTO #10718]
> 
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  scripts/send-pull-request | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 575549d..a660c37 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -162,7 +162,7 @@ PATCHES=$(echo $PDIR/*.patch)
>  if [ $AUTO_CL -eq 1 ]; then
>  	# Send the cover letter to every recipient, both specified as well as
>  	# harvested. Then remove it from the patches list.
> -	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
> +	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=always --no-thread --suppress-cc=all $CL"
>  	if [ $? -eq 1 ]; then
>  		echo "ERROR: failed to send cover-letter with automatic recipients."
>  		exit 1


And I don't understand why this proposed change has the described
effect. Does changing the threading parameters change the output of "git
send-email" and thus indirectly the mail headers of the following
patches?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




