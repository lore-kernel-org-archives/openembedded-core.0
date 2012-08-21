Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T3rbg-0000rW-W7
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 18:47:09 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2012 09:21:31 -0700
Received: by dakf10 with SMTP id f10so2938911dak.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 09:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=thRQh8x6XLcfaXwor4Q2/vjGDX+Dajs7/yX7prxan2k=;
	b=cXjH1/IAsRyGT6OmF/lVCDCNojc8+ckK3IEWJh1zzbMHQsY5j8t9ArLcRrjPZUKprQ
	nnOW/3IalKrcqqAPzdYLqYag5LukyTHu4e0n/GmYQ965yGi1s/C2apNrWRI/gH5R7lAJ
	4kF/X8fBEQuFgbRnSsQmid9LcwnuaJ3f3aImpnomt+N47RVddF2B/xHFgtjpDGE0hY5a
	/98XmNN/HFp1QmP7EPYkDyPNNkoIN4N13jIPrMzdAFQUUQ279kydI9cktMXOENx7OhQo
	4syAgkRdR5NL+2521rrmQPf0abRtyP2IFelV1I2F/oujAp2JQ1kYKWH48/LzG7glBU56
	CIRQ==
Received: by 10.68.218.196 with SMTP id pi4mr45455982pbc.128.1345566090971;
	Tue, 21 Aug 2012 09:21:30 -0700 (PDT)
Received: from [10.1.10.35] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id xd9sm1564843pbc.35.2012.08.21.09.21.29
	(version=SSLv3 cipher=OTHER); Tue, 21 Aug 2012 09:21:30 -0700 (PDT)
Message-ID: <5033B589.8080502@intel.com>
Date: Tue, 21 Aug 2012 09:21:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmGtREHZFKzYk5quxARyX1NkHqp9roWsZbliNbS4z+njroC0FmJD9E0gtt8q0OUX63SCNd0
Subject: qemu gl changes are broken.
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
X-List-Received-Date: Tue, 21 Aug 2012 16:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I tried building some images overnight with the latest master, and could 
not get them to run this morning with qemu - I got an odd error that a 
VNC server was started instead?

Just on a hunch, I reverted the following commits:

qemu: Fix broken accidental path move
qemu-git: Drop GL passthrough support
qemu-0.15: Drop GL passthrough support

rebuilt qemu-native, and now qemu works correctly.

I have no idea why qemu is trying to fallback on a VNC server, as I did 
not have one running on my machine. I know we use VNC for our 
autobuilder sanity tests, but those haven't been integrated into the 
runqemu scripts as far as I can tell.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


