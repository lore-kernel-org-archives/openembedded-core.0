Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgNw7-0000Pq-H4
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 23:59:28 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 14:45:01 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so26120462oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 14:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yhQGAEaY6vtj51gPFi3GPBwAOgQBwU7QGBHz9GxBxW8=;
	b=dtQO6y895BMach+Kh5MF4B/WbrbVDwfa1XCzzMDPyiKuX9D83qUtqZPsW6S5tEtBnY
	4mogFQAhwfy1kRfzv5zALJTXRcQXPXpSrIvIFeG5GzfUF5j7NHtjgin5/vCM5c4p0d1T
	AJ5rQjexCSWE9IFh99Tex9TyqWnfPXTTxVOxl3eVry5DQiokSZlplYE1xk7+JwSicRch
	7rvdYu0jmzFXfCJ/4CnhKeb8PXUaQvxBGNm1rNOXYUPbcwnseBV8PuC/XiABHnP3oGnW
	Wrf/E4wa9ploMLsYSq7gbGB93CnUN5cmcsgHQHkJdITWAgWMw1vjdYEIbwjjOv+pgldk
	D2NA==
Received: by 10.60.31.49 with SMTP id x17mr15498355oeh.33.1354747500656;
	Wed, 05 Dec 2012 14:45:00 -0800 (PST)
Received: by 10.60.31.49 with SMTP id x17mr15498351oeh.33.1354747500583; Wed,
	05 Dec 2012 14:45:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 5 Dec 2012 14:44:40 -0800 (PST)
In-Reply-To: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
References: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Dec 2012 22:44:40 +0000
Message-ID: <CAJTo0LaEnxc5GwZbxP2iqy943LSbE0AonKYaJkRBkciCVs4g9Q@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQkGnIeXZD35NTmYMGgsXCE/lXrZ1/zoEVa4D8s3rfBAlXzo/K8A2pTD6YWEKUC9DCe5ToitZ4BF0rBXTf5M4Kv/4DAmtqtgehXHcMUdcDcw2R/1LENrt00+N+krN1wnHfHGNxFyG3ncXzBtmjUK7p7qyZaVcKXUv5jv2JEmKTi+tUGsRZ6VBlHm78eobVlbOlM35ACz
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmatchbox: fix build against libpng15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 22:59:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi Marko,

Is this backwards compatible with libpng12, or should libmatchbox
check it has libpng15?

Ross


