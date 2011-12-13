Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RaSiU-0004vE-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:48:22 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 13 Dec 2011 15:40:40 +0200
Message-ID: <4EE755D7.8030407@bluegiga.com>
Date: Tue, 13 Dec 2011 15:40:39 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323779213.2731.63.camel@ted>	<1323779786.24417.140.camel@phil-desktop>	<4EE74C03.6050407@bluegiga.com>	<1323781625.24417.150.camel@phil-desktop>	<4EE750C0.8050703@bluegiga.com>
	<1323782688.24417.153.camel@phil-desktop>
In-Reply-To: <1323782688.24417.153.camel@phil-desktop>
X-OriginalArrivalTime: 13 Dec 2011 13:40:40.0770 (UTC)
	FILETIME=[CDEB7A20:01CCB99C]
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 13:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 03:24 PM, Phil Blundell wrote:
> Is the "${var:X:Y}" substring notation part of POSIX?  I have a feeling
> that it might be a GNU extension, and it didn't seem to work in dash
> when I tried it just now.

I tested it in ash of busybox. I see it doesn't work in dash. So your 
suggestion is the best I know.

Hopefully final version :)

SYSTEMDATE=`date -u +%4Y%2m%2d`
read TIMESTAMP < /etc/timestamp
if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt $SYSTEMDATE ]; then
     date -u $TIMESTAMP
     /etc/init.d/hwclock.sh stop
fi

Lauri


