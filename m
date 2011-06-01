Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRp9G-0003ju-Pc
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:24:03 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QRp67-0002mX-JM from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 10:20:47 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 10:20:41 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 10:20:41 -0700
Message-ID: <4DE674E7.5060904@mentor.com>
Date: Wed, 1 Jun 2011 10:20:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1306948467.2529.162.camel@phil-desktop>
In-Reply-To: <1306948467.2529.162.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Jun 2011 17:20:41.0552 (UTC)
	FILETIME=[3BA5B500:01CC2080]
Subject: Re: gnu-config-native and perl-native
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
X-List-Received-Date: Wed, 01 Jun 2011 17:24:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/01/2011 10:14 AM, Phil Blundell wrote:
> Further to my mini-crusade against perl-native, I discovered that it was
> also being included during the initial pseudo build because
> gnu-config-native depends on it.

Probably a partial sync with oe.dev where we do have perl-native way up
front.

> This also seems a bit mysterious: gnu-config has:
> 
> DEPENDS_virtclass-native = "perl-native"
> 
> ... which suggests that the dependency on perl-native was indeed
> intentional rather than accidental.  But later, it has:
> 
> 	# In the native case we want the system perl as perl-native can't have built yet
> 	if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
> 		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
> 	fi
> 
> ... which suggests that it isn't actually expecting to use the
> newly-built perl anyway.  Does anybody know what's going on with that?

It's never safe to use #!/full/random/path/to/bin/{perl,python,etc} in
things in our sysroots since some of us build in /very/deep/subdirs and
#! fails.

-- 
Tom Rini
Mentor Graphics Corporation


