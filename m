Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1RYBqd-0001jI-PY
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 08:23:23 +0100
Received: by eaao14 with SMTP id o14so143955eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 23:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=VhR1QHyMvi7AMBSRVDAcl2xin0+W/+usqa9iTPs4MaM=;
	b=j3ca+bxQb0Q3AGBfzD97ZmVzZ6nImITiD5Ol0roGhUKD541F/nDwGf79kZx4eSFVre
	8f6DSJ9RkiKXUwSFt/C22SdCSRX2L6gxCDEpSiFMC0whstUwchSqH1ZQNUBmTMfEVFDd
	ZTIWfJPRScCSL6axx8T/Z2qmAGBrraWp+NJ9c=
Received: by 10.213.16.81 with SMTP id n17mr211886eba.9.1323242195427;
	Tue, 06 Dec 2011 23:16:35 -0800 (PST)
Received: from [192.168.0.111] (147.84-49-231.nextgentel.com. [84.49.231.147])
	by mx.google.com with ESMTPS id 17sm2548358eej.3.2011.12.06.23.16.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 23:16:34 -0800 (PST)
Message-ID: <4EDF12D3.4060306@gmail.com>
Date: Wed, 07 Dec 2011 08:16:35 +0100
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: GCC fails when SDK is not extracted to /usr/local
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
X-List-Received-Date: Wed, 07 Dec 2011 07:23:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

gcc fails when I extract my SDK to another place than /usr/local.

Output when it fails:

$ ./arm-angstrom-linux-gnueabi-gcc
bash: ./arm-angstrom-linux-gnueabi-gcc: No such file or directory

Readelf output:

$ readelf -d arm-angstrom-linux-gnueabi-gcc

Dynamic section at offset 0x34394 contains 21 entries:
   Tag        Type                         Name/Value
  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
  0x0000000f (RPATH)                      Library rpath: 
[/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/usr/lib/armv7a-angstrom-linux-gnueabi:/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/lib]

Is it the RPATH here that's making trouble for me?

- Tasslehoff


