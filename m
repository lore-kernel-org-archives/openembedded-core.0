Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web09.2967.1606956834825256388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 16:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 16F2610097041;
	Thu,  3 Dec 2020 00:54:04 +0000 (UTC)
Received: from localhost (ip-88-152-32-15.hsi03.unitymediagroup.de [88.152.32.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BD3693144C8D;
	Thu,  3 Dec 2020 01:53:50 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1606956843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guCybu6G69BHvNXfItrBKqlqXpnmA8O5YK4zBPeTAyM=;
	b=/1GGZMdMyxA5xltsWazRNpZTSYyzx+cetGx5Wob+VIIAo+vfRxnOj0h/WjrcL8DmwbRxBX
	O/pue+HMo8DWD1AQ==
Date: Thu, 3 Dec 2020 01:53:48 +0100
From: "Andreas Oberritter" <obi@opendreambox.org>
To: "Alan Perry" <alanp@snowmoose.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
Message-ID: <20201203015348.5e4de8a1@opendreambox.org>
In-Reply-To: <20201202191124.15903-1-alanp@snowmoose.com>
References: <20201202191124.15903-1-alanp@snowmoose.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alan,

> +    mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl

this is going to break setups where ${base_sbindir} equals ${sbindir}, so you'll need make this conditional.

Best regards,
Andreas
