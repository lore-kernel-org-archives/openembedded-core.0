Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9E14572F5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 16:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2RGYnpn029968; 
	Mon, 27 Mar 2017 17:34:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rogUwKGt-lK3; Mon, 27 Mar 2017 17:34:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2RGYlVY029951
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Mar 2017 17:34:48 +0100
Message-ID: <1490632487.13980.272.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Munagala Naresh <munagala.nareshbabu@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 17:34:47 +0100
In-Reply-To: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
References: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: CPU profiling at thread level
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
X-List-Received-Date: Mon, 27 Mar 2017 16:34:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-03-25 at 21:44 +0530, Munagala Naresh wrote:
> Hi Team,
> 
> To analyzes the CPU load consumption of a particular process, we need
> to find the thread level consumption. Default top and ps utils are
> not supporting all the parameters that are available in
> Linux/Android. 
> 
> Could you please suggest some alternatives which works in
> openembedded platform?
> 
> Appreciate any pointers. 

The issue is probably that you're using utils from busybox by default.
If you install the "full" ps from the procps recipe you'll probably
have the experience you want. I think the full top utility may come
from procps too.

Cheers,

Richard

