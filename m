Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3B1F73759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1QLlTfN027769; Thu, 26 Feb 2015 21:47:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FX75PN1wv_xV; Thu, 26 Feb 2015 21:47:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1QLlF6S027756
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Feb 2015 21:47:26 GMT
Message-ID: <1424987235.26813.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Date: Thu, 26 Feb 2015 21:47:15 +0000
In-Reply-To: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Thu, 26 Feb 2015 21:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
> On WIN32 the file argument to gst_debug_log_valist is shortened to just
> the filename. This is useful not only for MSVC, but also with gcc/Linux
> when doing cross-compilation builds and out-of-tree builds.

Ultimately I think we need to address this issue in gcc itself, probably
setting some kind of base path in the environment which it removes from
__FILE__ (set to ${S}). There were more complex discussions about using
the same mapping code as can be used with the debug symbols code too.

Cheers,

Richard


