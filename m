Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 496D060557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:45:38 +0000 (UTC)
Received: (qmail 10395 invoked by uid 1003); 20 Oct 2014 17:45:38 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Oct 2014 17:45:38 -0000
Message-ID: <54454A41.7090900@balister.org>
Date: Mon, 20 Oct 2014 13:45:37 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: wic debug suggestions
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
X-List-Received-Date: Mon, 20 Oct 2014 17:45:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I'm trying to make an sd card using the sdimage-bootpart.wks file. I've
made an image and dd'ed it to a card. The card has a good vfat
partition, but the ext4 partition won't mount. Looks like bad
superblock. I can format the partition manually, so partitions seem OK
and card works.

Does anyone have any suggestions for debugging this?

Philip

