Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Tqpyd-0005rX-C2
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 19:57:18 +0100
Received: (qmail 7651 invoked by uid 1003); 3 Jan 2013 14:42:39 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jan 2013 14:42:39 -0000
Message-ID: <50E5D101.9030701@balister.org>
Date: Thu, 03 Jan 2013 13:42:09 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.6
Subject: Enabling NEON instructions for fftw
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
X-List-Received-Date: Thu, 03 Jan 2013 18:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

So, recent versions of fftw have NEON support for the single precision
build. In the poast, I just passed --enable-neon to configure or the
armv7a case. Now, this is not entirely correct, since some armv7a's lack
a NEON coprocessor.

Does anyone have a suggestion for how to handle this better? Personally,
I think if you want to run fftwf without NEON, you should have your head
examined, but I would like to avoid generating packages that SIGILL on
people.

Philip


