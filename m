Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RFsbq-0008S2-04; Mon, 17 Oct 2011 21:12:26 +0200
Received: by pzk33 with SMTP id 33so9215572pzk.2
	for <multiple recipients>; Mon, 17 Oct 2011 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Y+9mUryXB4la1DfxdwEFpXXa/n7fk283s7COEtjF8t8=;
	b=LfZKl70nB3jL8xiPS9oIIR4Z6enqp7spf1E/96Jqi1WEUfSnmGxZ0MIHkl6p4f7WPV
	vFRdpOnpr8UvjDU0F+gOVscCFT1MnUrouwIFQRyX2Z6cV7UAhZYpO78SwLEXjMnqeji2
	2a5djJd/p0H4PnZ2yBAqhO3FjIQ08+3GTEmRc=
Received: by 10.68.20.226 with SMTP id q2mr39668466pbe.115.1318878394071; Mon,
	17 Oct 2011 12:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Mon, 17 Oct 2011 12:06:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2011 12:06:04 -0700
Message-ID: <CAMKF1sqwC26Qo2MPCmNcwvsqweC-8F1P2y9myNOgihrBtCdTXA@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [ANNOUNCEMENT] New Patchwork available for testing
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
X-List-Received-Date: Mon, 17 Oct 2011 19:12:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Here is a new instance of patchwork accessible at
http://patchwork.openembedded.org

This instance uses same database therefore it should not be any different than
existing patches.openembedded.org

However with the new patchwork you will see additionally "Mail settings"
link on the right hand upper corner this could be used to subscribe to patchwork
activity. This is a new feature so try it out and report any issues.

The patch capturing is done by the new patchwork.

reiterating what Koen already announced, git post-recieve hook is
installed for meta-openembedded repository to interact with patchwork
on push so it will change the state of patch to "Accepted" once
it has been pushed. This should avoid lot of manual work for the maintainers
Please test this and report any problems you see with patches being marked
incorrectly or something else. Eventually if this turns out to be
useful we could
consider it for oe-core and bitbake as well.

Registering new user should work now. There has been issues with old server
sending out emails.

Eventually patches.openembedded.org will just be an alias to
patchwork.openembedded.org

Happy patching

-Khem


