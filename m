Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1FFD719CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 13:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA8DpUm9003052; Tue, 8 Nov 2016 13:51:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QQ5qHC2S9tZ9; Tue,  8 Nov 2016 13:51:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA8DpPCY003049
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 8 Nov 2016 13:51:26 GMT
Message-ID: <1478613085.23123.137.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>, "Jolley, Stephen K"
	<stephen.k.jolley@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2016 13:51:25 +0000
In-Reply-To: <e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
	<e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: Yocto Project Status WW45 - UPDATED
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
X-List-Received-Date: Tue, 08 Nov 2016 13:51:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-11-08 at 11:00 +0100, Andreas Oberritter wrote:
> Hello Stephen,
> 
> On 04.11.2016 18:06, Jolley, Stephen K wrote:
> > 
> > ·        There was a challenging taskhash mismatch test case this
> > week
> > which has resulted in some significant debugging improvements for
> > taskhashes and basehashes which are now in master.
> is there an entry in bugzilla about this issue, or can you please add
> a reference to the actual commits in master? I'm facing a similar
> issue, so it might be helpful for me to backport them to the branch
> I'm using.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0a4a6d6956a10aa0a6589de12b0b2380a9f0a7d9

has info in the commit message. You also want:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=589f08aa852dd43af5d05d698cfa917bec084210
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=157947efc7e505e01baafb33ec93fe2f485308fe
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6b0c60664e86fec55d282f1ea41238abd74712d
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=71c837611690ab4bec1656a58d13ca48e7c6a6e6

Cheers,

Richard

