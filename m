Received: from mail1.bemta8.messagelabs.com ([216.82.243.203])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Javier.Viguera@digi.com>) id 1UUKit-0008Sr-2h
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 19:40:16 +0200
Received: from [216.82.241.132:26657] by server-11.bemta-8.messagelabs.com id
	3D/FC-14229-D3075715; Mon, 22 Apr 2013 17:15:41 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-45.messagelabs.com!1366650941!30088639!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6183 invoked from network); 22 Apr 2013 17:15:41 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-2.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	22 Apr 2013 17:15:41 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Mon, 22 Apr 2013 12:15:34 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.298.1; Mon, 22 Apr 2013 12:15:40 -0500
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Mon, 22 Apr 2013 19:15:38 +0200
Message-ID: <51757039.4040706@digi.com>
Date: Mon, 22 Apr 2013 19:15:37 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
Subject: Re: [PATCH] bluez4: add readline dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 17:40:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 08/04/13 14:56, Alex DAMIAN wrote:
> -DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"

I saw this patch got included in oe-core and poky *master* branch as-is 
(not using PACKAGECONFIG).

I was bitten by this problem using *danny* branches as well.

Any chance that this fix gets also cherry-picked to danny?

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


