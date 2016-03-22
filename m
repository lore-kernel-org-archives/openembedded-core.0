Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8D3606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M9fTg4029518; Tue, 22 Mar 2016 09:41:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hSLTjwNtD0Je; Tue, 22 Mar 2016 09:41:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M9fR5Q029514
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Mar 2016 09:41:28 GMT
Message-ID: <1458639687.20442.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: brendan.le.foll@intel.com, openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 09:41:27 +0000
In-Reply-To: <1458600779-10847-1-git-send-email-brendan.le.foll@intel.com>
References: <1458600779-10847-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: Treat .node files same as .so
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
X-List-Received-Date: Tue, 22 Mar 2016 09:41:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-21 at 22:52 +0000, brendan.le.foll@intel.com wrote:
> (".so" or ".node" in f)

I'm not sure this will do what you expect with python's operator
ordering?

$ python
>>> bar=[1]
>>> 2 or 1 in bar
2
>>> 2 in bar or 1 in bar
True

Cheers,

Richard

