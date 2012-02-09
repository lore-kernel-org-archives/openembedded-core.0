Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RvYes-0004h8-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:23:50 +0100
Received: by wibhq7 with SMTP id hq7so1429116wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 10:15:45 -0800 (PST)
Received: by 10.180.101.200 with SMTP id fi8mr4400299wib.20.1328811345228;
	Thu, 09 Feb 2012 10:15:45 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm8300608wib.9.2012.02.09.10.15.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 10:15:44 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
Date: Thu, 9 Feb 2012 19:15:37 +0100
Message-Id: <5B0511B3-55A8-492F-8E01-5D03FA8F992A@dominion.thruhere.net>
References: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQmpUViJHtNl1vDtgTFQ7gt0a2tHgJVmohsHrzuRvqv8q4wAdV554XQBA8SeX+IY9jbjznFT
Subject: Re: [PATCH 2/2] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:23:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 9 feb. 2012, om 18:44 heeft Andrei Gherzan het volgende geschreven:

> This fix is for dhclient. It needs libcrypto at runtime and if
> libcrypto is in libdir, it's path can be inaccessible on systems
> where /usr is on nfs for example or dhclient is needed before
> /usr is mounted.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

MIssing PR bump


