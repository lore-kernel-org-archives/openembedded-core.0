Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TgYRc-0003To-Sc
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:12:44 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.78])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 8E6D9400A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 10:13:55 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 10:49:26 +0100
Message-Id: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Subject: (No subject)
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
X-List-Received-Date: Thu, 06 Dec 2012 10:12:46 -0000

I was trying to create a minimal core image with python-setuptools and noticed that the python-setuptools recipe does not work.
The reason is that during do_install, it creates shell scripts that refer to python-native instead of python.
The attached patch tries to solve this issue. Another minimal example thta shows this issue can be found at https://gist.github.com/4223250.

Lukas Bulwahn
BMW Car IT GmbH


From Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> # This line is ignored.
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Subject: 
In-Reply-To: 



