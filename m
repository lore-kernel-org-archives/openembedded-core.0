Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 9A98C7F9B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:12:56 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iNhbT-0001IS-I0 for openembedded-core@lists.openembedded.org;
	Thu, 24 Oct 2019 20:12:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Thu, 24 Oct 2019 20:12:47 +0200
Message-ID: <qospj1$49m$1@blaine.gmane.org>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
X-Mozilla-News-Host: news://news.gmane.org:119
Subject: sudo: recipe broken
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
X-List-Received-Date: Thu, 24 Oct 2019 18:12:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

It looks like https://www.sudo.ws/download.html changed certificate and 
directory structure. So that breaks not only thud, but also warrior and 
zeus. It can be fixed by changing the path in the recipe to 
https://www.sudo.ws/dist/sudo-${PV}.tar.gz or
ftp://ftp.sudo.ws/pub/sudo/sudo-${PV}.tar.gz.


