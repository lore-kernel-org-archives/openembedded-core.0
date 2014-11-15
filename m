Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D420720C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 16:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAFGLsSs020249; Sat, 15 Nov 2014 16:21:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RMI39F6n4EaQ; Sat, 15 Nov 2014 16:21:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAFGLd6S020245
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 15 Nov 2014 16:21:50 GMT
Message-ID: <1416068535.28563.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sat, 15 Nov 2014 16:22:15 +0000
In-Reply-To: <5466E6B7.2050609@pabigot.com>
References: <5466E6B7.2050609@pabigot.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: why does useradd.bbclass loop retrying its commands?
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
X-List-Received-Date: Sat, 15 Nov 2014 16:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-11-14 at 23:37 -0600, Peter A. Bigot wrote:
> The useradd, groupadd, and groupmems commands in useradd.bbclass are 
> executed in a loop with up to 10 failed attempts before they give up.  
> This appears to have always been the case, as long as that file has been 
> present.
> 
> Is there any reason why an initial failed attempt to execute one of 
> these commands would be expected to succeed on retry, other than because 
> delaying failure gives a chance for concurrently executing task to 
> complete and so satisfy a dependency?

Another recipe can be altering the files and holding the lock so in
theory, yes, the retries can help.

Cheers,

Richard


