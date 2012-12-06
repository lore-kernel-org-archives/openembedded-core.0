Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TgYOD-0003On-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:09:09 +0100
Received: from [192.168.101.78] (afplatform.bmw-carit.intra [192.168.101.78])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 7EEC740264
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 10:19:08 +0100 (CET)
Message-ID: <50C06B65.9050501@oss.bmw-carit.de>
Date: Thu, 06 Dec 2012 10:54:45 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
In-Reply-To: <1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: Re: [PATCH] distutils: Replacing path to native python by path to python in the image to support python packages with console-script setup
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
X-List-Received-Date: Thu, 06 Dec 2012 10:09:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I was trying to create a minimal core image with python-setuptools and 
noticed that the python-setuptools recipe does not work.
The reason is that during do_install, it creates shell scripts that 
refer to python-native instead of python.
The patch tries to solve this issue. Another minimal example that shows 
this issue can be found at https://gist.github.com/4223250.

Lukas Bulwahn
BMW Car IT GmbH

P.S. Sorry, my git-send-email did not send this cover-letter.


