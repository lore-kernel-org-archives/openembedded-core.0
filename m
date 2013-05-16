Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcuHd-0007lr-5Y
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 11:15:39 +0200
Received: by mail-vc0-f181.google.com with SMTP id lf11so2554130vcb.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 01:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=e5X+0LPqQ3HjhoWkVV6/N+3FXlKVg+8EIMOIfxIHMww=;
	b=Z6NsSeL0godzI0Od80jjXPxaz0Kpnug70bXIvdaBGQM/h8qYg1WdmkktHFNBidQgCH
	6/b/lAr7eUtipDQdSQ5f2iVvezV9sfnQbZqgj6BMsLejE6P1aEoHFpZv7HCgT09uty2h
	k16GMIl03lKhVqBJu9j0SJKuwygDjgmUKZWdELU5l/xvjXFz83WFOw2JyxPhXS/Q6kI3
	fGvUbEBDuv6qr6UVpjHXdnO429ASixmjlywXNiQe5ry3aRijxIJG4Q7hGcOkcG3jwf3D
	PLjoJU3FvsyR5emX68cwATSlRniAY46y+mWWq+AKmxZ/8eWb4k16Xj3OVhD0m7i1lA3l
	TbLw==
X-Received: by 10.52.165.99 with SMTP id yx3mr22948455vdb.34.1368694638804;
	Thu, 16 May 2013 01:57:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 16 May 2013 01:56:57 -0700 (PDT)
In-Reply-To: <cover.1368690819.git.Qi.Chen@windriver.com>
References: <cover.1368690819.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 May 2013 09:56:57 +0100
Message-ID: <CAJTo0LbeD-JV9C0tbwX1k4U1E2Zs5d6Gb=AOdixaSC2bK5PyBw@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQniz7f+V+tiroXmlUY/eRTgkotLkMziefMaE/GROn9wCndJuU3TXzKZqT9marL+AjT9WFFm
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Postinst logging reimplementation
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
X-List-Received-Date: Thu, 16 May 2013 09:15:43 -0000
Content-Type: text/plain; charset=UTF-8

On 16 May 2013 08:56,  <Qi.Chen@windriver.com> wrote:
> 1. The run-postinst scripts will log outputs and errors if /etc/.enable_postinst_logging is present.

I'm not very keen on dot-files in etc, and as the postinst init script
is one-shot shouldn't it be deleting that configuration file once it's
completed?

Ross


