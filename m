Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UcyaD-00073s-FE
	for Openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 15:51:02 +0200
Received: by mail-wi0-f176.google.com with SMTP id hr14so6244204wib.15
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=mlM+/Db9W0ZWq5ytGMcZcRQ7qUMt8S9ibXcNmbFxJIc=;
	b=TauMWZf9SQ07aCTmhH6fl2h3LtsQCBkO36tle4HZ+LbEV4Sble0lwK5q3Q+IAo4W2Q
	Xd7flzZ2hWfqU3N3/C8nTjvYHQT3Ks8Yh2ASMRO6yIRr8oPp88pV1zCLObV8Kl8Ip1GW
	+9vuvI6ezEyFZ5KvWskRMUdi9tBqR/PWiJHnpPdXby0fw9xk03hsPlVrOHaC4HaksLLj
	uGm73jjg8ixTnivaTEiHYEYmWJH8386/Q/1faI8rinoPzo8HM6WuwhHcYokhl5pMa+00
	BhcDcChyaZlPfn4k38f51JgPou6k3zHBc25UpFrp4FMIQVkvJNjEPfjR012+83iBo6Dd
	j3MQ==
X-Received: by 10.180.90.164 with SMTP id bx4mr24509034wib.13.1368711165095;
	Thu, 16 May 2013 06:32:45 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPSA id hl6sm3897238wib.2.2013.05.16.06.32.42
	for <Openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 06:32:43 -0700 (PDT)
Message-ID: <5194DFF9.5080103@gmail.com>
Date: Thu, 16 May 2013 15:32:41 +0200
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
Subject: Problem with QTcreator and meta-toolchain-qte
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 13:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Host development machine
- Ubuntu 12.04 (native and into In WmWare virtual machine)

OE/Yocto version
- Yocto Dylan 1.4 (and master)

Machine
- imx53-qsb (and at91sam9263)

After setting /opt/poky/1.4/environment-setup-arm......
I can successfully make the Qt/e app in console mode, but...

1. Launching compilation into QTcreator I get this final message

  http://pastebin.com/NVWCb4yq

2. Moreover if I enter a wrong command I get this message instead of the 
usual Ubuntu error message "Command not found"

  http://pastebin.com/QLcZWFxc

Any hint would be greatly appreciated
TIA
-- 
Marco


