Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQy5K-00068N-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:16:42 +0100
Received: by wyg8 with SMTP id 8so1728261wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 01:10:18 -0800 (PST)
Received: by 10.216.135.144 with SMTP id u16mr381252wei.10.1321521018055;
	Thu, 17 Nov 2011 01:10:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l2sm6559157wbn.0.2011.11.17.01.10.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Nov 2011 01:10:17 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321496999.1264.24.camel@localhost.localdomain>
Date: Thu, 17 Nov 2011 10:10:15 +0100
Message-Id: <F8EDE28B-DC2B-4C13-BE90-F45DFABC6E86@dominion.thruhere.net>
References: <1321496999.1264.24.camel@localhost.localdomain>
To: niqingliang@insigma.com.cn, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 09:16:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 17 nov. 2011, om 03:29 heeft Ni Qingliang het volgende geschreven:

> Hello, All:
> 	I'm working on opensaf, wrote a bb file for it,
> and found that the FILES_${PN} has included /usr/lib/${PN}/*.
> but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
> result QA issue.
> 	how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
> 
> 	there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
> no 'exclude' feature, I must redefine FILES_${PN} like this:
> 	FILES_${PN} = "/usr/lib/${PN}/*.so.* \
>                       /usr/lib/${PN}/saf* \
>                       /usr/lib/${PN}/open* \
>                       /usr/lib/${PN}/immload \
>                       /usr/lib/${PN}/nid_tipc \
>                       /usr/lib/${PN}/smf* \
>                       /usr/lib/${PN}/clc-cli/*"


please replace all occurrences of '/usr/lib' with '${libdir}'





