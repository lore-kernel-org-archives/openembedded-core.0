Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TnurW-0002bR-3i
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 18:33:50 +0100
Received: from mail-pa0-f72.google.com ([209.85.220.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Dec 2012 09:18:55 -0800
Received: by mail-pa0-f72.google.com with SMTP id fb10so9578159pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 09:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:user-agent:mime-version
	:to:cc:subject:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=ObZF5/m9wZcFu+4OsNMXhiKgn8aUAQeaK19o6Kf1nKQ=;
	b=IB2rZHrSI57aYkQjq4yPx8Hjd/V32v/p8G6FKaD4KM8jcBHeqxvhUHWsdosQgIfOyz
	kL54m9bd/xrjCJQwtCZKNlCXARX85hn02ZaKyUwaKdTC0o7diECvOE19YLDyJgi7kIeI
	RY+9Qt+20JzZ+/NOfuKbbpB/3msAsHE/zRIso8MA02/aJI3u1bfcz0q+E6fVrwTTuZBI
	eJUnmXl9e1IkZLqW4HdOFx/ZadSBCHDBGVwe1wgN6FG5CXhq0fyxYFraX6ec3mglgWBp
	LfHV4EOY5ZVcAwqFXrxMtFJmvCL4IJzed3afss3rjUv/oE8GNYviM3ZzUGu/gGjDuPjX
	Pisg==
X-Received: by 10.69.0.74 with SMTP id aw10mr87141667pbd.87.1356542334673;
	Wed, 26 Dec 2012 09:18:54 -0800 (PST)
X-Received: by 10.69.0.74 with SMTP id aw10mr87141644pbd.87.1356542334516;
	Wed, 26 Dec 2012 09:18:54 -0800 (PST)
Received: from [10.1.10.13] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id wh8sm16182276pbc.75.2012.12.26.09.18.49
	(version=SSLv3 cipher=OTHER); Wed, 26 Dec 2012 09:18:53 -0800 (PST)
Message-ID: <50DB3174.1030709@intel.com>
Date: Wed, 26 Dec 2012 09:18:44 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkCZYH9KWyTBcchw/lyA/L8HEIDAbbC6gmrq8BN+x6FZqrRhObdQDYTdOitHPLxRJnDWGMd2NZ0pThiTmXkO2bU/QyiWtw5RBAoKoNiN7jyTtTQvm0qqIYPdTn0jNFw0iRy2QPbNVfd21l8NjpMfjsYaISx3CGp1akG9POxd4kyio09MJcG8YGQEhYWnTE5yNPfpLok
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, poky@yoctoproject.org
Subject: Denzil 1.2.2 development nearly complete
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
X-List-Received-Date: Wed, 26 Dec 2012 17:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I wanted to make sure the community is aware that I am wrapping things 
up for our next denzil stable release, 1.2.2. We've had some discussions 
about this at the Technical Team Meetings, but I thought I'd send this 
out to the mailing lists as well.

The current status of my testing branches can be found here:

oe-core based tree:
http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

and my poky-based tree:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

I will be submitting a pull request to Richard soon to get these patches 
merged to the official denzil branches of the oe-core and poky 
repositories, respectively. If anyone has outstanding patches they need 
in denzil (or that I've overlooked), please get them to me as soon as 
possible.

To see a list of bugs addressed during the 1.2.2 release cycle, do a 
Bugzilla search for bugs with a Target Milestone of 1.2.2.

Our QA team will be back on Monday, January 7, and will begin another 
full-pass test cycle on denzil. If they don't find any new bugs and can 
verify the recently fixed bugs in denzil, our goal is to release 1.2.2 
shortly thereafter.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


