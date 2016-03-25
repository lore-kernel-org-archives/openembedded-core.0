Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 51ADD606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2P8R3K1024869; Fri, 25 Mar 2016 08:27:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RIpisQ_NqzVn; Fri, 25 Mar 2016 08:27:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2P8QxGp024866
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Mar 2016 08:27:00 GMT
Message-ID: <1458894419.3073.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenhua Luo <zhenhua.luo@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2016 08:26:59 +0000
In-Reply-To: <DB3PR04MB0684386FD5BEA86D54DDA26EEE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <DB3PR04MB0684386FD5BEA86D54DDA26EEE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: LE and BE build for the same machine in Yocto
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
X-List-Received-Date: Fri, 25 Mar 2016 08:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 06:07 +0000, Zhenhua Luo wrote:
> If the multilib feature is enabled in Yocto, two cross-compile gcc
> binaries will be generated to do both 32b and 64b build for the same
> machine.  Currently we have requirement to build LE u-boot and BE
> kernel/rootfs for the same machine, may I know if there is similar
> multilib mechanism in Yocto to support BE and LE build for the same
> machine?

If u-boot doesn't need any support libs, the existing compiler can
likely cope with that. If you need libgcc, then you will need multilib.

I'd like to get to a point where we can support this using multilib
however it might not all work correctly today. It would be interesting
to try it! The intent is to get to the point where it would work but
its not currently a priority as not many people have been asking for
it.

Cheers,

Richard

