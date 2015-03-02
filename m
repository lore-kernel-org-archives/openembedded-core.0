Return-Path: <openembedded-devel@urbanec.net>
Received: from mail12.tpgi.com.au (mail12.tpgi.com.au [203.12.160.162])
	by mail.openembedded.org (Postfix) with ESMTP id 3D88D65C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 04:35:34 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 2 Mar 2015 15:35:28 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t224ZQns015596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 2 Mar 2015 15:35:28 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YSI4k-0008LK-E0; Mon, 02 Mar 2015 15:35:26 +1100
Message-ID: <54F3E88E.3080703@urbanec.net>
Date: Mon, 02 Mar 2015 15:35:26 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
	<54F3E5D4.7070808@urbanec.net>
In-Reply-To: <54F3E5D4.7070808@urbanec.net>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Mon, 02 Mar 2015 04:35:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/15 15:23, Peter Urbanec wrote:
> I think there's a typo here which prevents this from working as
> intended. The second check is done on "-O0" when it's supposed to be "-Os"

Tested patch submitted.


