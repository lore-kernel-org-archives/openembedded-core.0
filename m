Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qk3Le-0004wr-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 02:12:10 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qk3He-0004mn-Dj from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 17:08:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 21 Jul 2011 17:07:59 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 21 Jul 2011 17:07:58 -0700
Message-ID: <4E28BF59.20907@mentor.com>
Date: Thu, 21 Jul 2011 17:07:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1311287411-31634-1-git-send-email-galak@kernel.crashing.org>	<1311287411-31634-2-git-send-email-galak@kernel.crashing.org>	<1311287411-31634-3-git-send-email-galak@kernel.crashing.org>
	<1311287411-31634-4-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311287411-31634-4-git-send-email-galak@kernel.crashing.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jul 2011 00:07:59.0114 (UTC)
	FILETIME=[6A393EA0:01CC4803]
Subject: Re: [RFC][PATCH 4/4] site/powerpc*-linux: refactor needed options that are common
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
X-List-Received-Date: Fri, 22 Jul 2011 00:12:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/21/2011 03:30 PM, Kumar Gala wrote:
> Pulled common options that are needed for powerpc64-linux to build
> out of powerpc32-linux and put them into powerpc-linux.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

NAK.  Almost all of the stuff going into powerpc-linux really belongs in
common-linux or common-glibc.  Some other tasks held me up here but I
plan to post the series moving these bits over and dropping them from
the arch files tomorrow.  Rest of the series looks good tho

-- 
Tom Rini
Mentor Graphics Corporation


