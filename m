Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TqlRi-0007w7-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 15:06:58 +0100
Received: (qmail 17627 invoked by uid 1003); 3 Jan 2013 13:51:53 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jan 2013 13:51:53 -0000
Message-ID: <50E58CF8.5010702@balister.org>
Date: Thu, 03 Jan 2013 08:51:52 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.6
Subject: Using simple-agent on oe-core built image
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
X-List-Received-Date: Thu, 03 Jan 2013 14:06:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I am trying to pair a headset with a USB bluetooth dongle on a console
only machine. Googling suggests I need to use the simple-agent python
script.

If I copy this script to the target and try to run it, this line fails:

from gi.repository import GObject

It is not clear to me how to install the missing module on the device.
Does anyone have any suggestions?

Philip


