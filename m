Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5D160167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 15:24:35 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id BD3026663F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 16:24:34 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 16:24:34 +0100 (CET)
Message-ID: <54A2C3B2.9010006@topic.nl>
Date: Tue, 30 Dec 2014 16:24:34 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Subject: How do I change the "Architecture" of a package?
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
X-List-Received-Date: Tue, 30 Dec 2014 15:24:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

What if the architecture of a package was accidentally left at its 
default, but it should have been "all" for example?

Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the 
recipe is not enough. You get stuck with a "more specific" older 
version, so that no device wants to upgrade to the newer version that's 
"all" architecture compatible.

Only way to fix this was to manually remove the old version from the 
feeds and also manually remove it from the device, and then reinstall 
it. This works for me personally, but what if I want to apply this to 
about a million devices that are already in the field?

What can I do to get them to upgrade from the (in this case) "mipsel32" 
to "all" package?

(and I have a few dozen of these mis-architectured packages...)

-- 
Mike Looijmans

