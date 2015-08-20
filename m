Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 21A2073E14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:43:14 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 0526837A3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:42:54 +0200 (CEST)
Message-ID: <55D5A12F.3060007@pseudoterminal.org>
Date: Thu, 20 Aug 2015 11:43:11 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Suggestion: sanity check for git branch value
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
X-List-Received-Date: Thu, 20 Aug 2015 09:43:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

several recipes have SRC_URI lines like: 
"git://server.name/repository;branch=${SRCBRANCH}". If for some reason 
SRCBRANCH is empty, this essentially evaluates to "branch=". I think a 
simple sanity check that outputs an error if the branch value is empty 
would be useful, since otherwise, this leads to a very confusing error 
later (git fetcher tries to use a command line like: --set-upstream 
origin/  , which causes git to complain that "origin/" is not valid).

thoughts?

