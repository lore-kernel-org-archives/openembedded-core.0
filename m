Return-Path: <mike.looijmans@topic.nl>
Received: from smtp06.online.nl (smtp06.online.nl [194.134.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id F05A465D15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:08:12 +0000 (UTC)
Received: from smtp06.online.nl (localhost [127.0.0.1])
	by smtp06.online.nl (Postfix) with ESMTP id 546AE965E0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 11:08:06 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp06.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 11:08:06 +0200 (CEST)
Message-ID: <53523CF6.2040208@topic.nl>
Date: Sat, 19 Apr 2014 11:08:06 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp06.online.nl)
Subject: How to migrate from PRINC to PR_SERVER?
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
X-List-Received-Date: Sat, 19 Apr 2014 09:08:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Attempting to move to the current OE-head now yields about a hundred 
messages like this:

WARNING: Use of PRINC 7 was detected in the recipe ...

The https://wiki.yoctoproject.org/wiki/PR_Service page tells what the PR 
server is.

However, it does not tell what to do with the recipes. Just removing 
PRINC from the recipes will break the upgrade path.

What are we supposed to do now?

-- 
Mike Looijmans

