Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19KMC6qLSGXDJmM/X/yl/CvB9n/T6BsgZw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmSmI-0003DO-UB
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:45:42 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SFeX4Z005887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 10:40:33 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E317BC3.3000809@mentor.com>
Date: Thu, 28 Jul 2011 10:40:34 -0500
Message-Id: <F026FC6D-A5BD-4F72-B3D2-76463F21779F@kernel.crashing.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
	<4E317BC3.3000809@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 28 Jul 2011 15:45:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jul 28, 2011, at 10:09 AM, Tom Rini wrote:

> On 07/28/2011 06:10 AM, Kumar Gala wrote:
>> If a SOCKS5 gateway is needed for a proxy access like git it might also
>> require authentication to the proxy via a password and username.  Adding
>> SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
>> of the authentication request to occur when something like a git fetch
>> is going through the proxy.
>> 
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> 
> We also need to make sure these variables do NOT make it into the sstate
> signature, which I think means one more change somewhere else (but I
> don't recall where off-hand).

Yeah, I didn't find anything obvious while grepping.

- k


