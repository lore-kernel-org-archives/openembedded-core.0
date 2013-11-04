Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 789226CA2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 11:40:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4Bee6A009306; Mon, 4 Nov 2013 11:40:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9-cdPjTt8qJR; Mon,  4 Nov 2013 11:40:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4BeX9Z009296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Nov 2013 11:40:35 GMT
Message-ID: <1383565229.6271.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong.Lu@windriver.com
Date: Mon, 04 Nov 2013 11:40:29 +0000
In-Reply-To: <1383554475-20223-1-git-send-email-Chong.Lu@windriver.com>
References: <1383554475-20223-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: fix return error value when input invalid arguments
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
X-List-Received-Date: Mon, 04 Nov 2013 11:40:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-04 at 16:41 +0800, Chong.Lu@windriver.com wrote:
> From: Lu Chong <Chong.Lu@windriver.com>
> 
> Remove "-q" and "--squash" options of help information.

Why are we removing this?

Cheers,

Richard



