Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 39D2E6C835
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 13:58:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s07DwB5c003171; Tue, 7 Jan 2014 13:58:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j8TMc0La1rAT; Tue,  7 Jan 2014 13:58:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s07Dw7fY003166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 7 Jan 2014 13:58:09 GMT
Message-ID: <1389103082.6899.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <ming.liu@windriver.com>
Date: Tue, 07 Jan 2014 13:58:02 +0000
In-Reply-To: <1389082433-19396-2-git-send-email-ming.liu@windriver.com>
References: <1389082433-19396-1-git-send-email-ming.liu@windriver.com>
	<1389082433-19396-2-git-send-email-ming.liu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] sstate: remove binutils-crosssdk from safe dependent list
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
X-List-Received-Date: Tue, 07 Jan 2014 13:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-07 at 16:13 +0800, Ming Liu wrote:
> binutils-crosssdk is being depended by other packages like
> gcc-crosssdk-initial, so it's not safe to be skipped when checking the
> setscene dependencies in setscene_depvalid().

Can you explain this change a bit more please?

Personally, I think the code is right as it is, if the sstate object
exists, it was already compiled and we don't ever need bintuils* so its
a 'safe' dep and can be skipped?

Cheers,

Richard


