Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 442226F57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:33:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s23FX9Z1021048; Mon, 3 Mar 2014 15:33:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ITMZ4_pF-8oP; Mon,  3 Mar 2014 15:33:09 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s23FX3af021041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 3 Mar 2014 15:33:04 GMT
Message-ID: <1393860775.31845.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Mon, 03 Mar 2014 15:32:55 +0000
In-Reply-To: <67abf64e39fc417fb65fed532afe0b4c@BLUPR03MB357.namprd03.prod.outlook.com>
References: <20140228160857.GL26981@jama>
	<1393860475-31036-1-git-send-email-alexandru.sardan@freescale.com>
	<67abf64e39fc417fb65fed532afe0b4c@BLUPR03MB357.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Mon, 03 Mar 2014 15:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-03 at 15:31 +0000, alexandru.sardan@freescale.com wrote:
> I've added an additional check to make sure the symlink is not created in
> a non-existent directory.

Since the change was merged, could you send an incremental patch against
master please?

Thanks,

Richard


