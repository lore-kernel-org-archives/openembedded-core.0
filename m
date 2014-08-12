Return-Path: <mike.looijmans@topic.nl>
Received: from smtp06.online.nl (smtp06.online.nl [194.134.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id 89E2862252
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 17:40:10 +0000 (UTC)
Received: from smtp06.online.nl (localhost [127.0.0.1])
	by smtp06.online.nl (Postfix) with ESMTP id 3915B96247
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 19:40:09 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp06.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 19:40:09 +0200 (CEST)
Message-ID: <53EA5178.7020209@topic.nl>
Date: Tue, 12 Aug 2014 19:40:08 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp06.online.nl)
Subject: Autotools and "foreign"
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
X-List-Received-Date: Tue, 12 Aug 2014 17:40:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I tried to upgrade to the current master, and got a few dozen packages 
now failing to build because of automake errors like this:

| Makefile.am: error: required file './NEWS' not found
| Makefile.am: error: required file './README' not found
| Makefile.am: error: required file './AUTHORS' not found

This apparently traces down to:
74b05bba64589da0e4439a4293559ad9670104bd
"autoconf: remove automake patch enforcing --foreign"

Is there an alternative to manually patching all of these packages to 
get them to compile once more?


-- 
Mike Looijmans

