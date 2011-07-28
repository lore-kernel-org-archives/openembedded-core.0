Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmSGy-0002YR-7u
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:13:16 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QmSCp-0002tz-9s from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 08:08:59 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 28 Jul 2011 08:08:58 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 28 Jul 2011 08:08:57 -0700
Message-ID: <4E317B82.1020907@mentor.com>
Date: Thu, 28 Jul 2011 08:08:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311836896.git.lei.mei@intel.com>
	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
In-Reply-To: <2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jul 2011 15:08:59.0134 (UTC)
	FILETIME=[46FC29E0:01CC4D38]
Subject: Re: [PATCH 1/1] python-native: Fix a compiler finding issue
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
X-List-Received-Date: Thu, 28 Jul 2011 15:13:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/28/2011 12:20 AM, Mei Lei wrote:
> The CC variable sometimes add option information after compiler name, but python can't get the real compiler name if those information added.
> Fix this issue by dropping the option information when finding compiler name.
> 
> Signed-off-by: Mei Lei <lei.mei@intel.com>

I think this is going to cause problems when you must pass flags to gcc
to have it work, eg 'gcc -m64'.

-- 
Tom Rini
Mentor Graphics Corporation


