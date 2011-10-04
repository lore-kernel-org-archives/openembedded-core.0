Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RBBDh-0004Av-Vs
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:04:06 +0200
Received: (qmail 30884 invoked by uid 1003); 4 Oct 2011 19:58:31 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.179.234)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Oct 2011 19:58:31 -0000
Message-ID: <4E8B6564.4090002@balister.org>
Date: Tue, 04 Oct 2011 15:58:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.22) Gecko/20110906 Fedora/3.1.14-1.fc14 Thunderbird/3.1.14
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Tue, 04 Oct 2011 20:04:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm about to start bringing some images I use from OE to OE-core. The 
first issue I saw is there is no task-proper-tools in oe-core (where 
oe-core means the set of layers created by the Angstrom setup scripts).

Should I add task-proper-tools to meta-oe, or is there a better way to 
add a full features set of tools to an image? Basically, the image is 
more desktop like than embedded.

Philip


