Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRviu-0001u2-Fd
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 03:29:48 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 08 May 2012 18:19:54 -0700
Received: by pbbro8 with SMTP id ro8so29155882pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 18:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=dxwYY+nwQr/44MB4QDm89vNWMgCtkfNgisIB8E8cZCE=;
	b=eQPtb4eUlT+dOArxv4SXO7hzySSJL75JxQJUqzQJ6fOJS2ZMJIuVO9uPaXvPVkDqm5
	wpWR+YHuuVGNWdzW+PvyllRD6e7VjJAaBDm4KQrAXIfCQ5E3EXLzs1Jzz8cbOQT5ZeHw
	QNO0s2/++2jRVuaT9AddbGZ2jfgy3YQk7M+lPcto8sqGv6LgpiJO6tcOfW+FoEr6gsEk
	eNmEWEV1vR6QpKSDqSrB2L6CXzWiYiTK2snfXWVpPlUNCzNQNOOnYAj6m8AWn1sRd8Rh
	IyfWtQD2l0cVunCr2Fw/JZSPhIypUE5RTZKrWaasRr7w2sRk7h7c8oTbovqASJY8EMhi
	uwRg==
Received: by 10.68.191.201 with SMTP id ha9mr3372252pbc.75.1336526394519;
	Tue, 08 May 2012 18:19:54 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id pv5sm60192pbb.14.2012.05.08.18.19.52
	(version=SSLv3 cipher=OTHER); Tue, 08 May 2012 18:19:53 -0700 (PDT)
Message-ID: <4FA9C638.2000502@intel.com>
Date: Tue, 08 May 2012 18:19:52 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk5jNlOr2Q3bfoT2cjEeTebGQbDrIrPK8RekPZbPUpziWYeTcB53k4L61HFcUCb1lI8neiP
Subject: RFC: Who wants/cares about SLiRP networking for QEMU?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 01:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is an inquiry to see if there's much interest in adding an 
alternate networking capability for our QEMU setups. Currently, we use 
tun/tap devices, which need root privileges to be created. Hence, our 
runqemu script requires sudo access.

I'm curious to know who would like to see us use an alternate mechanism 
(most likely SLiRP) to get around the need for sudo access. Is this much 
of a problem for anyone, or would the team's resources be better spent 
on other bugfixes?

Secondly, does anyone have any war stories about using SLiRP for this 
purpose? Is there a better way we should consider doing this?

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


