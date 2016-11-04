Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26F8F71A23
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA4A3lWZ006152; Fri, 4 Nov 2016 10:03:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ISMXjqLdCDwm; Fri,  4 Nov 2016 10:03:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA4A3hUn006149
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Nov 2016 10:03:45 GMT
Message-ID: <1478253823.23123.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2016 10:03:43 +0000
In-Reply-To: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
References: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: uninative binary?
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
X-List-Received-Date: Fri, 04 Nov 2016 10:03:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-04 at 08:16 +0100, Gary Thomas wrote:
> Some of my customers need to be able to build without any
> network connectivity, so I normally use BB_NO_NETWORK="1"
> 
> Is there a way to add the uninative "binary shim" to my
> download mirror?  Given that the path includes a hash as
> a directory, it's not clear to me how to put it into my
> mirror.
> 
> Thanks for any ideas

Set UNINATIVE_URL to point at your mirror?

If the file already exists in DL_DIR, it will be used without touching
the network.

Cheers,

Richard

