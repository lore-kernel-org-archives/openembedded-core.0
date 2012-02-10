Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1RvrIo-00028i-LV
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:18:18 +0100
Received: from denis-n73sv.localnet (82.48.81.29) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5ECD02800AA0; Fri, 10 Feb 2012 15:04:17 +0100
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 15:04:15 +0100
Message-ID: <2787694.QmGOfSfC0J@denis-n73sv>
Organization: Eukrea
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1328638770-31141-1-git-send-email-andrei@gherzan.ro>
References: <1328638770-31141-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Fri, 10 Feb 2012 14:18:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

There are some small issues:

>+Cflags: 
There is a whitespace at the end.
> +inherit autotools 
There is a whitespace at the end.

>+LICENSE = "GPLv2"
The license is not GPLv2 only, but rather:
GPLv2+ or MPL1.1(I'm not sure if it's spelled correctly) or  LGPLv2.1+
(I don't remember how or are expressed, maybe | or ||, you should grep for it)

>+LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
Could you instead md5sum part of Makefile.in(or configure.in, or both) that 
contains a license header that seem to be applied to all files at 
compilation...

Thank a lot for working on nspr, I need it for chromium.

Denis.


