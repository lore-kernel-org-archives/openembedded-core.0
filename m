Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 582B36FF7F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 00:30:23 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t125so125419117qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 16:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=pH/PgILJYDUG7yiOl8sMXYhNylpMpctG+XdVpN3SLVE=;
	b=yTFMRr4V8nEdx+ZtR6ba0G3GngYOpkArWPeGu3AG5+QVJvpcG92sh9Z/GDHQoivw8w
	2/m6zyq+iCS/n6tmM3X1q1ytHFqIJ3tFNC0CO5mj/NrZrZ3UzVB9Eq/OcYVrEdA4Sayv
	vykzBFlP/dVU/qqtbcP4UvEigWS+SO1vKMqbltxD1ugJnlvTLYPex/AXJz1yJzPEP5YP
	lvXH6a3cvinoxX5ZA2Py8RiidBcHHd+SgmNZNbt4KxE+dSuVOzdHZDLC85K1DOryEXrs
	DDyj+is9mtwabeugsoSaMkbxi6INAW42K21A/5fl64gJxFzCLhiThHllGUm0pXE0+Hrs
	Wm1A==
X-Received: by 10.55.79.195 with SMTP id d186mr15347172qkb.62.1450571424677;
	Sat, 19 Dec 2015 16:30:24 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	e90sm3373316qkj.2.2015.12.19.16.30.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 16:30:24 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5675F69B.2050604@gmail.com>
Date: Sat, 19 Dec 2015 19:30:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: qemuarm update
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
X-List-Received-Date: Sun, 20 Dec 2015 00:30:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Would it make sense, would it be possible, for the qemuarm machine to
emulate ARMv7a instead of ARMv5?

