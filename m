Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 358C560621
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24AILiO008366; Fri, 4 Mar 2016 10:18:21 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5Fvf1g0EmVZO; Fri,  4 Mar 2016 10:18:21 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24AIIC3008362
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Mar 2016 10:18:19 GMT
Message-ID: <1457086698.2804.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Date: Fri, 04 Mar 2016 10:18:18 +0000
In-Reply-To: <DB3PR04MB068422B10C54A685417DCE3AEEBE0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<DB3PR04MB068422B10C54A685417DCE3AEEBE0@DB3PR04MB0684.eurprd04.prod.outlook.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Fri, 04 Mar 2016 10:18:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-04 at 09:41 +0000, Zhenhua Luo wrote:
> > * meta-fsl-ppc breaks on eudev change (patch pending)
> > * meta-fsl-ppc breakage blocks AB artefact publishing
> [Luo Zhenhua-B19537] The eudev patch is merged, http://git.yoctoproje
> ct.org/cgit/cgit.cgi/meta-fsl
> -ppc/commit/?id=2642cf5e8a6f8d11603acf016b8c075ebce00ec0, is there
> any other blocker issue? 

Thanks, I appreciate getting that sorted! 

Unfortunately there is something else not quite right with meta-fsl
-ppc:

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/buil
ds/667

Seems something is not working in python3 do_configure? Everything else
is building python3 fine so not sure what is wrong there.

Cheers,

Richard

