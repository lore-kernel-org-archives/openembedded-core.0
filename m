Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pui0O-00031c-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 10:06:00 +0100
Received: by wwe15 with SMTP id 15so6281672wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 01:04:33 -0800 (PST)
Received: by 10.227.9.74 with SMTP id k10mr7130412wbk.204.1299056200977;
	Wed, 02 Mar 2011 00:56:40 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm1219942wbb.13.2011.03.02.00.56.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:56:40 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299055045-8096-2-git-send-email-raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 09:56:38 +0100
Message-Id: <1DF2ADA1-2EC2-445A-A435-684956523715@dominion.thruhere.net>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 09:06:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 2 mrt 2011, om 09:37 heeft Khem Raj het volgende geschreven:

> * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
> * native version of 3.7.3 does not build
> 
> 
> +
> +#do_compile_prepend() {
> +#        oe_runmake sqlite3.h
> +#        install -m 0644 sqlite3.h ${STAGING_INCDIR}
> +#}

Is that hunk needed? Looks OK otherwise


