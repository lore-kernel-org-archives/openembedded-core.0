Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5F66AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:01:14 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e63so255565787ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=I9UXmYUdyMNOUTiHjyTk7lnmMt3j3ahHkW4BAIGQTMA=;
	b=Ig2SqMNXvjsIZjPA+tIKANRu6nQbpV5CE06KXvnYur3apIxuJZnMQUwbfFbgSHOK8H
	L6ZM6xtVwehYkprdEMZIG6eATQEJ+5Lu58ybqvBufrPf6NY8wvXT/cm5x6UEp1sv/Sr/
	JvIcgc7GsgzLbrDiB2QoJ9WcQCJ+vdHBMB9vAOUNrpDRi2qFiT5nmocEW29n50UDunk0
	HB4/8S/I3iUKuUXwHIMotkl1YNIYe2kIsvN/UPthRXNz9ua4gl5R4hrJxiK0tcq4swbE
	58F7300c9Ja/hVTNRto7i5oEWuGCCoZR1W7KfXaHlfJU+L9FvXA2A4Rwt/PMkEzg3flu
	wJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=I9UXmYUdyMNOUTiHjyTk7lnmMt3j3ahHkW4BAIGQTMA=;
	b=S0rxBMy+Tuuf8Ijm1+Wr3SjjU9PNotZDDIRPPKKlPliGezLm6E9O9Oal6jsATclNUp
	69tR7Ks6URIVgMMiCDmXMtejoQBLDSASXKl56mpHroDso5tNBfZSsEV4S6MjRnzEscYD
	53aTM/4ULMEpjCV+2zFsASFarRzAefQ26/oZDQTlJy98Tvq1bbL56hOxM0I2pLnFar9K
	vmmUqEujiLfwX8X1m4V8nCq/AdczRk/po8YnrhPzu9syFp3lQu9HkSeyqPfd8twQ8F7D
	xLeNEQKUsuUjPUOhIMVL+O+RYrGjIzDeeQSKHFl3sNa5Aia7Fj9VLvCMV/T+S5yZ0RW7
	5DQw==
X-Gm-Message-State: AEkoousaI2sBerZnR93Pz9Wn+XfqIzWhbDY29Xf2dyrE7yLrrakMRxbOoueFYlpTmmhpZUKi
X-Received: by 10.107.13.129 with SMTP id 123mr9650910ion.47.1472108475410;
	Thu, 25 Aug 2016 00:01:15 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EAE2.dip0.t-ipconnect.de. [93.232.234.226])
	by smtp.gmail.com with ESMTPSA id
	k69sm4989897ioi.20.2016.08.25.00.01.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Aug 2016 00:01:13 -0700 (PDT)
Message-ID: <1472108470.396.1.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Thu, 25 Aug 2016 09:01:10 +0200
In-Reply-To: <1471903951-2925-1-git-send-email-jslater@windriver.com>
References: <1471903951-2925-1-git-send-email-jslater@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd-compat-units: do not inherit allarch
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
X-List-Received-Date: Thu, 25 Aug 2016 07:01:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-22 at 15:12 -0700, Joe Slater wrote:
> Even though we are just a script, we do depend on
> systemd being on the target and need an RDEPENDS
> which means we cannot also be allarch.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-compat-units.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> index f246e83..421fc06 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -9,7 +9,7 @@ DEPENDS = "systemd-systemctl-native"
>  
>  S = "${WORKDIR}"
>  
> -inherit allarch distro_features_check
> +inherit distro_features_check

+1 from me. The alternative solution would be to add
"systemd-compat-units->systemd" to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in
meta/conf/layer.conf, but that's more complicated and probably not worth
it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




