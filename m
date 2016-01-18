Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 709AF7317C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHqaPl032761; Mon, 18 Jan 2016 17:52:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IJP53BzhXtCL; Mon, 18 Jan 2016 17:52:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHqVDA032757
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Jan 2016 17:52:32 GMT
Message-ID: <1453139551.27999.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Mon, 18 Jan 2016 17:52:31 +0000
In-Reply-To: <20160118165317.GC2614@jama>
References: <cover.1452848807.git.liezhi.yang@windriver.com>
	<85829b7950f74cb41f39b5f1fbd8541bcb7b6d1e.1452848807.git.liezhi.yang@windriver.com>
	<20160118165317.GC2614@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gstreamer1.0-plugins-good.inc: add gudev back to PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Jan 2016 17:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-18 at 17:53 +0100, Martin Jansa wrote:
> On Fri, Jan 15, 2016 at 01:07:20AM -0800, Robert Yang wrote:
> > The 66e32244aed8d33f1b49fbe78179f2442545c730 wrongly removed gudev
> > from
> > PACKAGECONFIG, now add it back.
> 
> It was removed intentionally, because for systemd images there isn't
> libgudev provider in oe-core, only in meta-oe.
> 
> RP's fix:
> http://git.openembedded.org/openembedded-core/commit/?h=jethro&id=bc4
> 58ae9586b45b11b6908eadb31e94d892e698f
> 
> breaks the dependencies again, because when systemd is used there
> won't
> be libgudev needed by gstreamer1.0-plugins-good
> 
> Please revert both "fixes"

The "backported" patch should have made mention of the changes compared
to the version in master since otherwise, "intentionally" looked like a
mistake :/.

What is the impact to gstreamer of removing libgudev?

Cheers,

Richard

