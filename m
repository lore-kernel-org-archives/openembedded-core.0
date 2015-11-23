Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 60B426011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 10:26:51 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so47525367wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=DjlkKNaj/7U6WqKjJLuCvwqsH32/E2ObFIXqEz62bdU=;
	b=uEem1i2jAWiH6tE15m3IGPowjOWdAoOOIDXkMlRGVj7ZVmAgysGUHxsT7vUSnRZewe
	Q4Y0FxmT21k3JxV6TEBXegQ6+pOplnOimvvTZSevAEFKDaLnACnBTnyekGJf6Fn/nyxC
	LJCcvacO0aFxYF1XgmRt9pmdD8USwGLI8vCbjiQly2oT6D5inMw7VYAqJX3Iu9J6jHhf
	wIA9a57DSoZ0Gn226YtdrNPBI2PyuGIq+qD6hrdfy1EyXTYTszH8opbIbdVWwnC8m6MK
	Wg7lsSgoCXUOjt7EWtjAFyNU68cKBKswp58nWNmVU6uITHu+lU4NEbi5eYxhx3XO98o0
	dX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DjlkKNaj/7U6WqKjJLuCvwqsH32/E2ObFIXqEz62bdU=;
	b=VaAVE2WQwRzb2VhvnJKWU1IZLxpc52V2JAQQeXGh9tp+072kiHfe8vc4Fhnc4EmS44
	rDZX+Q5ClACppNYLgiZklppeDbRBGCug2kht0DKD5qyAx075IQH/6wjHwtnzhlCXYUZ5
	wmOcz8npZ6vgey4zzIr0lc118Juy9Ybm0m7LkpVFnwSNt5igLBLSit1GQV5b0foLDQI7
	KH9AWkO6GV1AlEUgCHX+Gn9JsfyYumLRifXcNX+qtYyzvlSM1FYlzGiFh5DP8jrLpGXJ
	PSJofkJtegh0TOawUZ8ObvI8fWC4MxbTDDoOV4kaS/1V+wN6Tfc2Lw8qg8k7GyMNjB9Q
	Imvw==
X-Gm-Message-State: ALoCoQk0AGG1GxibTEyU1YiRa2/8cxOFGkCljIEOgd8iWtkYS40SKcVgedoNrVbyUI0FfW6eyBoO
X-Received: by 10.194.62.74 with SMTP id w10mr3881203wjr.174.1448274412091;
	Mon, 23 Nov 2015 02:26:52 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	k125sm5791602wmf.2.2015.11.23.02.26.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 02:26:51 -0800 (PST)
To: ChenQi <Qi.Chen@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Ross Burton <ross.burton@intel.com>, Radu Moisan <radu.moisan@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Khem Raj <raj.khem@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>, 
	Jonathan Liu <net147@gmail.com>
References: <5649BDDE.6030107@dresearch-fe.de>
	<564AE081.30004@dresearch-fe.de> <564CA3F8.9020404@dresearch-fe.de>
	<564DDDE4.20002@dresearch-fe.de> <564EE292.5070704@windriver.com>
	<564F2347.1010308@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <5652E9EA.1050005@dresearch-fe.de>
Date: Mon, 23 Nov 2015 11:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564F2347.1010308@dresearch-fe.de>
Subject: Re: systemd service vs. update-alternatives (was rsyslog: buggy systemd/ua handling?)
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
X-List-Received-Date: Mon, 23 Nov 2015 10:26:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 20.11.2015 14:42, Steffen Sledz wrote:
> PS: What's the better place for this discussion? This mailing list? Or <https://bugzilla.yoctoproject.org/show_bug.cgi?id=8688>?

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

