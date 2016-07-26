Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6A0606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6QECL7G016947; Tue, 26 Jul 2016 15:12:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r02zoFgB9nI3; Tue, 26 Jul 2016 15:12:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6QECGTA016930
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Jul 2016 15:12:17 +0100
Message-ID: <1469542336.23580.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergei Miroshnichenko <sergeimir@emcraft.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 15:12:16 +0100
In-Reply-To: <1469539192-18406-1-git-send-email-sergeimir@emcraft.com>
References: <1469539192-18406-1-git-send-email-sergeimir@emcraft.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Alexander Dyachenko <sasha_d@emcraft.com>,
	Roger Meier <r.meier@siemens.com>
Subject: Re: [PATCH v3 0/4] license: Sync with SPDX 2.0, pull request
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
X-List-Received-Date: Tue, 26 Jul 2016 14:12:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-26 at 16:19 +0300, Sergei Miroshnichenko wrote:
> Here are the request for a community review for a synchronization
> with the SPDX License List (git.spdx.org/license-list.git) and adding
> license operators to meet SPDX 2.0 specification compliance
> (https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX
> License Expression).
> 
> The whole patch series is way too big to send them to the mailing 
> list (the biggest one is ~3MiB), so please find the diffs via gitweb 
> of the -contrib repo.

Whilst we certainly want to collaborate with SPDX, we've never said our
LICENSE field should match what SPDX is doing. Your patch appears to
unequivocally join them as a 1:1 mapping and I'm not sure this is
something we've ever planned or agreed to. These fields do get written
into the packages and used in a variety of places.

Certainly if we are going to map them 1:1, this is something which
would need discussion on the OE architecture list first. I'd be nervous
about committing to do that, not knowing or having any influence over
what SPDX may do next. 

Is the intent here to map us 1:1 with SPDX and are you advocating that?

Cheers,

Richard


