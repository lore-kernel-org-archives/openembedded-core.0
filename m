Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1004C6FDEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s99JuREo007777; Thu, 9 Oct 2014 20:56:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dbmUk5SpxQQh; Thu,  9 Oct 2014 20:56:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s99JuLWA007774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 9 Oct 2014 20:56:22 +0100
Message-ID: <1412884615.871.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 09 Oct 2014 20:56:55 +0100
In-Reply-To: <5436445C.5020503@topic.nl>
References: <54354CBD.6040506@topic.nl> <5436445C.5020503@topic.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request to move "gitpkgv.bbclass" from meta-oe to oe-core
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
X-List-Received-Date: Thu, 09 Oct 2014 19:57:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
> ﻿In partial reply to my own question, this has been discussed 2 years ago, but 
> apparently nothing ever came out of it.
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2012-February/056050.html
> 
> So once more the request to be able to get sane version strings for git repos. 
> Can we please just move gitpkgv. That's like five minutes work, and if anyone 
> (e.g. me) feels like building something better, he or she is free do submit 
> that and get rid of the gitpkgv class once it's obsolete.

I do feel quite strongly that this is something which should get
improved in the fetcher itself. That is why I've pushed back on the
patch since if I take it into OE-Core, there is even less incentive to
fix the real problem...

Cheers,

Richard


