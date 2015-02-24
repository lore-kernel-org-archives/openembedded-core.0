Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF4471633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 23:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ONjBrh013553; Tue, 24 Feb 2015 23:45:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K7_jwJR_gNdK; Tue, 24 Feb 2015 23:45:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ONitrV013550
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Feb 2015 23:45:06 GMT
Message-ID: <1424821495.26813.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Tue, 24 Feb 2015 23:44:55 +0000
In-Reply-To: <1424718281-9133-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1424718281-9133-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Tue, 24 Feb 2015 23:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-02-23 at 13:04 -0600, Alejandro Hernandez wrote:
> Adds symlink-to-sysroot check to the QA_WARN, Changes filerdepends
> from set() to dict(), hence methodsfor adding or deleting items had
> to change, keeps track of the key:value relationship, flags the
> issue along with the offending file accordingly.

I'm sure this is a good change but I'm struggling to understand it from
the message above. Could you make sure to say:

a) What the change does
b) Why its important/useful

as well as how the change modifies the code (which you cover).

Cheers,

Richard


