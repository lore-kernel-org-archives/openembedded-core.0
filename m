Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-03.prod.phx3.secureserver.net
	(p3plsmtpa08-03.prod.phx3.secureserver.net [173.201.193.104])
	by mail.openembedded.org (Postfix) with ESMTP id A4ECD65CED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 05:38:01 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-03.prod.phx3.secureserver.net with 
	id Fhdz1p00J0BVjqb01he0pw; Fri, 14 Nov 2014 22:38:01 -0700
Message-ID: <5466E6B7.2050609@pabigot.com>
Date: Fri, 14 Nov 2014 23:37:59 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: why does useradd.bbclass loop retrying its commands?
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
X-List-Received-Date: Sat, 15 Nov 2014 05:38:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The useradd, groupadd, and groupmems commands in useradd.bbclass are 
executed in a loop with up to 10 failed attempts before they give up.  
This appears to have always been the case, as long as that file has been 
present.

Is there any reason why an initial failed attempt to execute one of 
these commands would be expected to succeed on retry, other than because 
delaying failure gives a chance for concurrently executing task to 
complete and so satisfy a dependency?

(This isn't the root cause of the pseudo autobuilder failure under 
multilib, but it did look plausible for a while.)

Peter

