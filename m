Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmSHx-0002a7-4o
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:14:17 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QmSDr-000306-3a from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 08:10:03 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 28 Jul 2011 08:07:09 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 28 Jul 2011 08:10:02 -0700
Message-ID: <4E317BC3.3000809@mentor.com>
Date: Thu, 28 Jul 2011 08:09:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jul 2011 15:07:09.0468 (UTC)
	FILETIME=[059E75C0:01CC4D38]
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
X-List-Received-Date: Thu, 28 Jul 2011 15:14:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/28/2011 06:10 AM, Kumar Gala wrote:
> If a SOCKS5 gateway is needed for a proxy access like git it might also
> require authentication to the proxy via a password and username.  Adding
> SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> of the authentication request to occur when something like a git fetch
> is going through the proxy.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

We also need to make sure these variables do NOT make it into the sstate
signature, which I think means one more change somewhere else (but I
don't recall where off-hand).

-- 
Tom Rini
Mentor Graphics Corporation


