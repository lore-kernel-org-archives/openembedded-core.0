Received: from mail1.bemta7.messagelabs.com ([216.82.254.111])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Javier.Viguera@digi.com>) id 1UB5jB-0003X9-VB
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 16:49:08 +0100
Received: from [216.82.254.195:59121] by server-15.bemta-7.messagelabs.com id
	F6/3F-06682-1F67F215; Thu, 28 Feb 2013 15:25:37 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-200.messagelabs.com!1362065137!12503987!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19300 invoked from network); 28 Feb 2013 15:25:37 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-2.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	28 Feb 2013 15:25:37 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Thu, 28 Feb 2013 09:25:40 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.297.1; Thu, 28 Feb 2013 09:25:36 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Thu, 28 Feb 2013 16:25:34 +0100
Message-ID: <512F76E7.9030700@digi.com>
Date: Thu, 28 Feb 2013 16:25:27 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1361427542.git.hongxu.jia@windriver.com>
	<5d8b955ad3645fb9690823db5f16d5b093cfd343.1361427542.git.hongxu.jia@windriver.com>
In-Reply-To: <5d8b955ad3645fb9690823db5f16d5b093cfd343.1361427542.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] base-passwd.preinst:fix creating passwd and group error
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
X-List-Received-Date: Thu, 28 Feb 2013 15:49:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I was bite by this one [YOCTO #3917] in *danny* branch not allowing me 
to create a rootfs based in DEB packages. Sometimes happens, sometimes 
not, depending on whether 'base-files' is installed in the rootfs before 
or after 'base-passwd'.

Cherry-picking this commit from master fixes the problem.

So could it be also considered for backporting to 'danny' in oe-core and 
poky?

Thanks in advance.

-- 
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


