Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3845675E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 01:36:34 +0000 (UTC)
Received: by pasz6 with SMTP id z6so108706177pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 17:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=1SJQluV05e6R/hChJoOqX2ZlQ+ftq0DXvtnuo8bpwRY=;
	b=LfiqB18u7Ks1D3bBCRvefJTNceeYvs326TlZOqVG+TFfxTjytUJkz376Yj/X8nOFrz
	tH2fPhuSscpDlZCkmCPQEsWVuXVu17J49MdZOizbe2fh//r8b+9lPCEn/O8TfU5b+J7t
	8cXDn19i/3FelmEW2Y1uSikHNAj5JlGS+8K/XWaPMa65ufR6YMtGZ6d8SGC1G1x/Sg5N
	vxfEzrBkQlqjuR8LXo0a2JDSTvmrVaKG32sNBWdPb6CAsKMSaItBD7byoVORTolhfAKA
	gVl+6zFw7KKcrMPYL7nFqZAQVigoiGVWaAWZUh0Bd8MA2p5rbzBXPQ1lPcHDaX4h/Tl2
	3ggw==
X-Received: by 10.67.13.107 with SMTP id ex11mr13757209pad.126.1446773795042; 
	Thu, 05 Nov 2015 17:36:35 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	eg5sm10209774pac.30.2015.11.05.17.36.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Nov 2015 17:36:33 -0800 (PST)
To: "joshua.lock" <joshua.lock@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <563C0420.6000308@gmail.com>
Date: Thu, 5 Nov 2015 17:36:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [Fido] readline CVE-2014-2524
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
X-List-Received-Date: Fri, 06 Nov 2015 01:36:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

please backport from Master

9a02df0e932106bcb3dda0a7a2eb1113719fb4ee

readline: actually apply readline63-003 (aka CVE-2014-2524)

thanks,
Armin


