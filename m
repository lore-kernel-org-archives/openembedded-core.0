Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A01F06D350
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 17:02:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8H2dXf029387; Fri, 8 Nov 2013 17:02:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 67FXffAI0hdW; Fri,  8 Nov 2013 17:02:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8H2Z1Y029383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 17:02:36 GMT
Message-ID: <1383930151.2345.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <sakoman@gmail.com>
Date: Fri, 08 Nov 2013 17:02:31 +0000
In-Reply-To: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
References: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] wpa-supplicant - enable CONFIG_CTRL_IFACE_DBUS_NEW in config
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
X-List-Received-Date: Fri, 08 Nov 2013 17:02:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 07:33 -0800, Steve Sakoman wrote:
> I've begun using Yocto 1.5 (dora) for several client projects over the
> past few weeks.
> 
> I noticed that images that included connman and wpa-supplicant always
> failed to enable the wifi technology properly.  The visible error
> indication in the log:
> 
> src/technology.c:technology_get() No matching drivers found for wifi
> 
> After many hours of debugging I finally figured out that this was due
> to a missing option in wpa-supplicant (CONFIG_CTRL_IFACE_DBUS_NEW)
> 
> Adding a bbappend for wpa-supplicant with this option enabled fixed
> the issue and connman now handles wifi interfaces as expected.
> 
> Was there a particular reason CONFIG_CTRL_IFACE_DBUS_NEW wasn't enabled?

This sounds like a default that should be enabled. Please send a patch!

Cheers,

Richard


