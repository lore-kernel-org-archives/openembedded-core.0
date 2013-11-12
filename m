Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A5C7A6D308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 07:47:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAC7lWCl001824; Tue, 12 Nov 2013 07:47:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ongnJ7Axpkmc; Tue, 12 Nov 2013 07:47:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAC7lUIl001819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 07:47:31 GMT
Message-ID: <1384242446.22454.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 12 Nov 2013 07:47:26 +0000
In-Reply-To: <52810032.3020608@windriver.com>
References: <cover.1384164392.git.wenzong.fan@windriver.com>
	<52810032.3020608@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] udev: remove libudev-dbg and libgudev-dbg
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
X-List-Received-Date: Tue, 12 Nov 2013 07:47:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-11 at 10:05 -0600, Mark Hatle wrote:
> On 11/11/13, 4:10 AM, wenzong.fan@windriver.com wrote:
> > From: Wenzong Fan <wenzong.fan@windriver.com>
> >
> > We don't support multiple -dbg packages, so just remove the libudev-dbg,
> > libgudev-dbg and put all debug stuffs to 'udev-dbg'.
> 
> I'm a bit confused, we do support package that want to provide multiple -dbg 
> files to generate them.

No, we do not. We don't support multiple -dev packages either. Yes
packages can generate them but the system does not correctly handle them
and never has.

Cheers,

Richard


