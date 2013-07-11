Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 18037608C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:39:26 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so5349631eek.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=ppD9/NQGUXxN6RoDajiw9KKYdAdPClU+6ISHEe4dUbs=;
	b=azQC8+zPmbj//7r/zAeO7TnL1zVVUFVuyXy+GKwL2Gn2gDxdhQ4Pl17ybsccqVqDUH
	48PaDlz9EDyJRXly9OfmdXRDi1pF9CSe31r/G2nmWHW+WpLtH6vwm3eSY9NTmb55CdQp
	44FgspPcyGNW/+7E1axljwvH8idSIxUy3RJN967oXJ2UNwToPHApyJ3LrbALjotbGsRd
	vKsDauaPIy85WXwl0420BCV6IiyXPlSZUsNvSSjVNSLo8z06SLFCn4eEkYqnC7+qnPNd
	zSCVwqYUJDTgtCb/NnZ5omsN0O5mkrwzyp/praoWOA7AdFesFLBMHhPQmx6yDZ1K0Zpl
	1Tcg==
MIME-Version: 1.0
X-Received: by 10.15.102.68 with SMTP id bq44mr40663446eeb.89.1373531966360;
	Thu, 11 Jul 2013 01:39:26 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Thu, 11 Jul 2013 01:39:26 -0700 (PDT)
In-Reply-To: <5891c95b244f3b0ad5e54bcb7595fc401c1727f3.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<5891c95b244f3b0ad5e54bcb7595fc401c1727f3.1373443071.git.hongxu.jia@windriver.com>
Date: Thu, 11 Jul 2013 09:39:26 +0100
Message-ID: <CALmOhgnqd_AEmtzgJ_4gCAJXiXYW=tHryRJVGwN-rUw5TXR5MQ@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQn+apHmqXe5nlBSuOS4wyFyc+zeXzl0C+FOBQODSNqiAld2GuqL8/B3BAGwsx7PquEkOWgf
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] nss: fix incorrect shebang line of perl script
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
X-List-Received-Date: Thu, 11 Jul 2013 08:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Replace incorrect shebang line with `#!/usr/bin/perl'.


I thought using 'env' was the preferred method?

