Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC27678279
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 18:25:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MIPTQx021603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 19:25:31 +0100
Message-ID: <1503426329.32591.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 19:25:29 +0100
In-Reply-To: <CA+chaQdAOK1nfbug3kRgiv4hcck=dPbWX52x60ZHzMAD1nUPwg@mail.gmail.com>
References: <1503400000-25414-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1spLkW=57FZtm5_Xa3OGkBgj4RzvW9GKTudg1o2nDi9=9w@mail.gmail.com>
	<CA+chaQdAOK1nfbug3kRgiv4hcck=dPbWX52x60ZHzMAD1nUPwg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 19:25:31 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] machine-sdk: oldest kernel for x86/x86_64 is 3.2.0 now
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
X-List-Received-Date: Tue, 22 Aug 2017 18:25:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 20:00 +0200, Martin Jansa wrote:
> It's pity that we won't be able to use newer SDK on older hosts, but
> I'm glad that SDK_OLDEST_KERNEL is going away as it wasn't working
> very well anyway as discussed here:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-Octobe
> r/127519.html

Weren't those issues fixed with 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2b1cbb43aeb100f0ee53a62404dd918466422701?

Cheers,

Richard


