Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 11C6C60110
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:46:29 +0000 (UTC)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 733221A0029
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 10:46:28 +0100 (CET)
To: openembedded-core@lists.openembedded.org
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <56ED1FF4.7040901@topic.nl>
Date: Sat, 19 Mar 2016 10:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: How to avoid the poisoned sysroot?
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
X-List-Received-Date: Sat, 19 Mar 2016 09:46:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

After this commit:
   http://comments.gmane.org/gmane.comp.handhelds.openembedded.scm/81849

some recipes fail with strange errors like:
   "fatal error: stdint.h: No such file or directory"

What is wrong with the target recipe when this happens? What's expected 
of me?

-- 
Mike Looijmans

