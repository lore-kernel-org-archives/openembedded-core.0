Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.4090.1607401595195188053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 20:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: from webmail.gandi.net (webmail27.sd4.0x35.net [10.200.201.27])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPA id C1214240003;
	Tue,  8 Dec 2020 04:26:32 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 07 Dec 2020 20:26:32 -0800
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Conditional inherit with PACKAGECONFIG
In-Reply-To: <AM9PR09MB4739B0A08A5E56EC85975D76A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
References: <aebe57d858d895a9266a9a25e90b60c8a34dd9e3.camel@redrectangle.org>
 <AM9PR09MB4739B0A08A5E56EC85975D76A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <43a4bd2517ffd01296a612d202827311@redrectangle.org>
X-Sender: robert.joslyn@redrectangle.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2020-12-04 03:40, Konrad Weihmann wrote:
> PACKAGECONFIG_pn-btrfs-utils = "foo bar" in local.conf or distro.conf
> should do what you had in mind.
> But yes your observations are correct bbappends are applied *after*
> the initial recipe was parsed

Thanks, I was able to get it working with this in my distro.conf:

PACKAGECONFIG_pn-btrfs-tools = ""
PACKAGECONFIG_pn-btrfs-tools-native = ""

It'd be nice if I could keep it contained within the bbappend, but this 
is better than copying the recipe to my layer.

Thanks,
Robert
