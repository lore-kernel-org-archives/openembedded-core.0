Return-Path: <lukas.gorris@gmail.com>
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 66CFF6BE67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:40:48 +0000 (UTC)
Received: by mail-bk0-f54.google.com with SMTP id v16so864028bkz.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 07:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=4Y4asJLXPDHJIpI+KKLicFbnZJBdeMcOixXC1KMzrDg=;
	b=zqPSFYJlJlOV592hOuBksHZmw1J+n7fHoOAXRMUWjCOXprVPNJXNlM21vGOnc3dRco
	ZdwE6LCUkEj3WBm7y8NhdOwGjtmOIgcpo8b7EN7jokdbkZrw/7Q5pn8LYLpicMJWsV6B
	w3Oo1RZ4ZIr/cueqZaS9a8mdoqDCacPbaMpV8J+s/p5NsG4ceJJBHwAnGEXbECvrs3Mh
	NYfxBUu3Nd5XWVr/GAMnI6iM94onasvQyFo9AuyRiReLcIcKBsSWti7I9yxj47l6fJ47
	I49FwGTPXzqdm4HL8ztr4uiXDhBQQJOGWgTDZUsYGAT7pAv7+gHYG5PQOkOsMepqxFsv
	w0fA==
X-Received: by 10.205.10.200 with SMTP id pb8mr10240690bkb.16.1385134847574;
	Fri, 22 Nov 2013 07:40:47 -0800 (PST)
Received: from [10.11.215.228] (nat-gw6.rrze.uni-erlangen.de. [192.44.85.28])
	by mx.google.com with ESMTPSA id
	no2sm32628753bkb.15.2013.11.22.07.40.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Nov 2013 07:40:46 -0800 (PST)
Message-ID: <528F7B00.7000909@gmail.com>
Date: Fri, 22 Nov 2013 16:40:48 +0100
From: Lukas-David Gorris <lukas.gorris@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: mencoder
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2013 15:40:49 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I would like to generate an image containing mencoder in the current 
yocto metadata with the up to date oe layers as well as meta-raspberrypi 
added.
mplayer builds, installs and runs just fine for MACHINE raspberryi. A 
search in the metadata yielded no references to mencoder.
I am wondering how to add it, maybe based on the present mplayer 
metadata and would be thankful for help.

Best

Lukas

