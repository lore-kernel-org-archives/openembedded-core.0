Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tniz3-0003wX-0z
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 05:52:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBQ4bv1c009984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2012 20:37:57 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 25 Dec 2012 20:37:55 -0800
Message-ID: <50DA7F21.7040601@windriver.com>
Date: Wed, 26 Dec 2012 12:37:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.163.154]
Subject: Why is urandom not installed under /etc/rcX.d ?
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
X-List-Received-Date: Wed, 26 Dec 2012 04:52:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I noticed that the urandom script is deliberately disabled in our 
system, although it is installed under /etc/init.d.

grep urandom initscripts_1.0.bb

     install -m 0755    ${WORKDIR}/urandom ${D}${sysconfdir}/init.d
#    ln -sf        ../init.d/urandom ${D}${sysconfdir}/rc6.d/S30urandom
#    ln -sf        ../init.d/urandom ${D}${sysconfdir}/rc0.d/S30urandom
#    ln -sf        ../init.d/urandom ${D}${sysconfdir}/rcS.d/S55urandom

Is there any problem if it is enabled?

According to documentation in linux/drivers/char/random.c, it is used to 
ensure unpredictability at system startup.

Cheers,
Chen Qi


