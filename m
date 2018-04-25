Return-Path: <daniel.ceusan@kalosis.com>
X-Greylist: delayed 996 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Apr 2018 09:51:44 UTC
Received: from mail.kalosis.com (mail.kalosis.com [94.130.64.79])
	by mail.openembedded.org (Postfix) with ESMTP id B196A71957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 09:51:43 +0000 (UTC)
Received: from [193.231.162.33] (abderus.integrasoft.ro [193.231.162.33])
	(authenticated bits=0)
	by mail.kalosis.com (8.14.7/8.14.7) with ESMTP id w3P9Z8Xs030360
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 09:35:08 GMT
To: openembedded-core@lists.openembedded.org
From: Daniel Ceusan <daniel.ceusan@kalosis.com>
Message-ID: <4a5afd6c-7ffc-793c-611a-79dab6626710@kalosis.com>
Date: Wed, 25 Apr 2018 12:35:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
Subject: loopback interface not brought up on 'ifup -a' automatically
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
X-List-Received-Date: Wed, 25 Apr 2018 09:51:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

I am building an image using rocko branch and installing ifupdown package:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb?h=rocko

If there is no loopback definition in /etc/network/interfaces file, then "ifup -a" brings lo interface up automatically.

If I define the lo interface:
"auto lo
iface lo inet loopback"
then lo interface is not brought up automatically by "ifup -a", even though from ifupdown's changelog/documentation it says both approaches should work.

Anyone else seen this behavior?

Thanks and regards,
Daniel


