Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75F8A734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31BgQAP008275; Fri, 1 Apr 2016 12:42:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Uzf4_0Tnswfi; Fri,  1 Apr 2016 12:42:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31BgLb7008272
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 1 Apr 2016 12:42:22 +0100
Message-ID: <1459510941.7348.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurent Bonnans <laurent.bonnans@hikob.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Apr 2016 12:42:21 +0100
In-Reply-To: <CABBNMXXkshQSZkKruaBjQP=oejM79JLnkAcUW_EUNfSPLpaBxQ@mail.gmail.com>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
	<1459461285.21672.70.camel@linuxfoundation.org>
	<CABBNMXXkshQSZkKruaBjQP=oejM79JLnkAcUW_EUNfSPLpaBxQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Fri, 01 Apr 2016 11:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-01 at 13:21 +0200, Laurent Bonnans wrote:
> 2016-03-31 23:54 GMT+02:00 Richard Purdie <
> richard.purdie@linuxfoundation.org>:
> > Would it not make sense to keep these as separate packages but
> > specifically exclude them from python-modules (and add a comment
> > along
> > the lines of the above as a reason)?
> 
> This sounds reasonable to me. It would require to slightly tweak the
> logic of the generate-manifest scripts.

That sounds good to me, could you send an updated patch please?

Cheers,

Richard

