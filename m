Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TBld6-0002DP-15
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 14:01:16 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 12 Sep 2012
	13:48:43 +0200
X-TM-IMSS-Message-ID: <a34d70d0001335df@nedap.com>
Received: from [10.17.24.1] ([10.17.24.1]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id a34d70d0001335df ;
	Wed, 12 Sep 2012 13:48:46 +0200
Message-ID: <5050769A.2040404@nedap.com>
Date: Wed, 12 Sep 2012 13:48:42 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: fstab
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
X-List-Received-Date: Wed, 12 Sep 2012 12:01:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I've created my own /etc/fstab which is perfectly included in 
base-files_*.ipk as expected.
It also shows up in 
build/tmp-angstrom_v2012_05-eglibc/work/mymachine/myimage*/rootfs/etc
But I find a different version of /etc/fstab under 
build/tmp-angstrom_v2012_05-eglibc/deploy/images/mymachine/myimage*.rootfs.tar.bz2
I can't figure out why!
Any ideas or hints?

Thanks!
Jaap


