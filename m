Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SDEMu-0007dx-CW
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 14:22:20 +0200
Received: by wgbdr12 with SMTP id dr12so1387972wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=dSq7NeEIpYQENHiztqNLmxCMqRj8UGcR60k1VKFxTPE=;
	b=pO/7s0mq1qR0YFkRqAnifxXtWySCs4Buw+gh4AAyXQFcTeHPDJOdQDPLCPtkgz+znm
	bNjkgKmiqri64lv6cAMJZJg0pVo4tRNcTCxOPYckgAtkDYdb8GSqLQ2uZyBfDuOe636p
	VgrV5P15w1A8AA4Pav51Evd/UeRdWzq0O7WL5XyZ0vsFer79Fl1kHXIAOEpIND5zjPA2
	LeuQQ3vE9X8axQ75RcMXDyopgsOGbxKfUg6PuVu25nCbVjS1BZsU0vbBDrrAOfrXxExR
	vfTnAZYFItmTUMICiBa3oio3u/OpMFv7g0E0hsPeLxdhrokflm+uU3xIlIumosLNTbVR
	d5sg==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr5136896wix.4.1333023197214; Thu, 29
	Mar 2012 05:13:17 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 29 Mar 2012 05:13:17 -0700 (PDT)
Date: Thu, 29 Mar 2012 14:13:17 +0200
Message-ID: <CAGiJk9esiphHKT9GaH8dLgOFB_xbLDr86PX-rzzsR8X66OVNaQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Fetching code via git over ssh.
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
X-List-Received-Date: Thu, 29 Mar 2012 12:22:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
as I have set up a git server on one of my PCs and secured it with ssh.
I tried to use the repository in a recipe, cloning via "git clone
ssh://user@server/~/repo.git" works.
But bitbake tries to fetch the repository via scp instead of git (also
if I add protocol=git).

Tried something like this in my recipe:
SRC_URI = "ssh://user@server/~/repo.git;protocol=git;branch=master"
(note: the git repository is in the home directory of the user, so the
tilde is not causing an error)


Anyone else tried to fetch a repository on a ssh secured git server via bitbake?

-- 
Regards
Samuel


