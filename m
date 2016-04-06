Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2EC77087
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 17:00:47 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n3so71803875wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=UwsUT9Zru0NNjao0uA9u5IvIIPUVWdbkpbOHMThQjOI=;
	b=hh4YVh5eZu8czzxmrXVVckkMGuVGyf/Uh2oFzutRJfX/qbzB6Cc1W9aS1GJnEX8zqV
	NGx9WI8azY6NqMM9sevfLqRrAydpbB/T0G9gK/t3cbBE0U2cBAoz2XD4Qn8SJxQU5dsO
	VAhKO38RgyREcXxlAJGGhzm2zaXHVsjeBJC8BKAmtFZx317FXM2O3izZN482Bcc5vh31
	x+07DHioKIBqfwszdPT6lUJTlOJGveBzFeuAqEAEhU10MaylP3NTXs37r21tX0AyT56s
	TLMbTL7ycxlKjFwFP0b558SXpPY8p864typ//TukvKmJSbGaX/qniqfJh8530O3E/Nt6
	mpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UwsUT9Zru0NNjao0uA9u5IvIIPUVWdbkpbOHMThQjOI=;
	b=GdcdOpwoofvMDPisb+f4iDOYIGWjvNXvsSRib+U75jGJKtdw+PdrXI0Oric+/yxROG
	MGfo96szG1yxnBstYooMAH6+AlOfuSgv+LGCU/vvp6W1PB7L3YAm4W3GZO+bZ8wNFMws
	9W6So00K54y9n5lAMmVgkQhNdgZaYxSbp/ssjcG31fsZ0q8RBZDdvU65RIx0u9G8ArXN
	/9b/5mv0D7rKCSk9SPFFXiuaEJiLSnwZ2BP8zsuhZpy1FteE/f2/YubQCiEAu5z01rVa
	cjqjbD/cJRtY+3ZSFt8j1yaFKNZufZ7Eha+mvf11GD321kCbSWnyvZAxavTAcGnY3a3m
	S5PA==
X-Gm-Message-State: AD7BkJL1LnZtMqw1cxrj2cZG2AiYnp4hSCWAMs4ku0aaoPtAZ2QQutzvqXqmTo+nCHAcu77l
X-Received: by 10.28.144.20 with SMTP id s20mr25745059wmd.12.1459962047825;
	Wed, 06 Apr 2016 10:00:47 -0700 (PDT)
Received: from draco.icx.intel.com ([83.217.123.106])
	by smtp.gmail.com with ESMTPSA id
	l135sm4630344wmb.13.2016.04.06.10.00.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 10:00:46 -0700 (PDT)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 18:00:41 +0100
Message-Id: <1459962043-30259-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Add DL_DIR and SSTATE_DIR to toasterconf
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
X-List-Received-Date: Wed, 06 Apr 2016 17:00:50 -0000

Add the DL_DIR and SSTATE_DIR to the toasterconf with defaults set

We now support per project sharing of the DL_DIR and SSTATE_DIR
in toaster.


Ed Bartosh (1):
  toaster: add DL_DIR and SSTATE_DIR to oe toasterconf

 meta/conf/toasterconf.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.1.4


