Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (unknown [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id DCD5865E87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 15:04:38 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 373AF6630C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 17:04:39 +0200 (CEST)
Received: from [192.168.1.10] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 17:04:39 +0200 (CEST)
Message-ID: <53762907.8060600@topic.nl>
Date: Fri, 16 May 2014 17:04:39 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Subject: Living without shadow
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
X-List-Received-Date: Fri, 16 May 2014 15:04:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Any package that wants to add user accounts (e.g. dbus) automatically 
installs the "shadow" package into the image. This appears to be done by 
adduser.bbclass.

We want to keep it small, and can easily live without the shadow 
package. Busybox already provides adduser and similar commands, and also 
handles login etc. just fine. So I tried adding a line
RPROVIDES_busybox+="shadow"
to the busybox recipe. I would expect to have an alternative provider 
now, and no more forces installation of the big shadow.

The result was much more surprising though. Letting busybox provide 
"shadow" resulted in failing to build the rootfs. The "adduser" command 
did not work on the host. This was very unexpected - does shadow deliver 
something into the sysroot that adduser.bbclass needs?

How can I get rid of the shadow package?

-- 
Mike Looijmans

