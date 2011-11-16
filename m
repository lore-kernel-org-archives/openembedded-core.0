Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RQmxe-0002aW-Is
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 22:24:02 +0100
Received: by wyg8 with SMTP id 8so1128420wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 13:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=pN94oAzBJxzYDvcD6uZ5w+6B0MvROq88go8xlj+GtX0=;
	b=PmJNDOD2ohHTcjlUoNAUgJEJjL3iYtpMH1HPh55CmIFO6cO8okrahzcQ9GKqtei6iw
	8a+upeh8wXEEJyHzJrEkbHsPkddgg+ApTyu7/BdFsbIp16JI8WZV9+EtPgtmahHMR909
	MQ3kJSl9jjplnH61+i3Vv4ZZab+0h/qu+YEzI=
Received: by 10.216.54.83 with SMTP id h61mr93959wec.6.1321478258539; Wed, 16
	Nov 2011 13:17:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Wed, 16 Nov 2011 13:17:16 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Nov 2011 14:17:16 -0700
X-Google-Sender-Auth: tMjmfymVKK2zI30OUDnYwcY_rDU
Message-ID: <CABcZANnj3w3YQDL8Q5vTDHr3LaXC6zZLCjkcAeaPV62QJccaOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Add some explicit variable dependencies
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
X-List-Received-Date: Wed, 16 Nov 2011 21:24:02 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit a8ed4fcd79f6283c1d45f347dce894d784183900:

  xinit: rdepends on util-linux-mcookie to avoid brining whole
util-linux (2011-11-11 11:00:56 +0000)

are available in the git repository at:
  https://github.com/kergoth/oe-core vardeps

Christopher Larson (2):
      bitbake.conf: add a couple explicit vardeps
      Add some (mostly packaging) vardeps

 meta/classes/package.bbclass       |   17 ++++++++++++++++-
 meta/classes/package_deb.bbclass   |    1 +
 meta/classes/package_ipk.bbclass   |    1 +
 meta/classes/package_rpm.bbclass   |    1 +
 meta/classes/sstate.bbclass        |    2 ++
 meta/classes/utility-tasks.bbclass |    1 +
 meta/conf/bitbake.conf             |    2 ++
 7 files changed, 24 insertions(+), 1 deletions(-)

Christopher Larson (2):
  bitbake.conf: add a couple explicit vardeps
  Add some (mostly packaging) vardeps

 meta/classes/package.bbclass       |   17 ++++++++++++++++-
 meta/classes/package_deb.bbclass   |    1 +
 meta/classes/package_ipk.bbclass   |    1 +
 meta/classes/package_rpm.bbclass   |    1 +
 meta/classes/sstate.bbclass        |    2 ++
 meta/classes/utility-tasks.bbclass |    1 +
 meta/conf/bitbake.conf             |    2 ++
 7 files changed, 24 insertions(+), 1 deletions(-)

-- 
1.7.7


