Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4F76D1B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:02:31 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1VbnD6-000I60-Cj for openembedded-core@lists.openembedded.org;
	Thu, 31 Oct 2013 08:02:33 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.6/8.14.6) with ESMTP id
	r9V826LH006623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 03:02:14 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX185emzdKZ1mqJQFWNNME7vt8tsDn7g14Oo=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 03:02:01 -0500
Message-Id: <cover.1383206227.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] devshell should make finding source and build artifacts easy
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
X-List-Received-Date: Thu, 31 Oct 2013 08:02:31 -0000

Make finding sources and build artificts easy from a developer shell, while not affecting normal shells.
Also cleans up EOL issue from first attempt at patch.

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib blloyd/devshell
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=blloyd/devshell

blloyd (2):
  Allow passthrough of important placement variables when using devshell
  Removed trailing whitespace added with last commit

 meta/classes/devshell.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.8.1.4


