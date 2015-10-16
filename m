Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05A04770E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9GA1f0b030766; Fri, 16 Oct 2015 11:01:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CwOJq0fyp9MV; Fri, 16 Oct 2015 11:01:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9GA1SKC030744
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 16 Oct 2015 11:01:39 +0100
Message-ID: <1444989688.17974.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Date: Fri, 16 Oct 2015 11:01:28 +0100
In-Reply-To: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Fri, 16 Oct 2015 10:01:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-15 at 12:27 -0500, Benjamin Esquivel wrote:
> +            if (bb.utils.movefile(sourcefile, destdir) == None):
> +                raise Exception("moving {} to {} failed".format(
> +                                        sourcefile, destdir))

Its a minor issue, however rightly or wrongly, the vast majority of the
code base uses "xxx %s %s" % (var, var2) instead of .format(). Is there
a reason we should be using the latter as for consistency, the former
would seem to make things more standardised?

Cheers,

Richard




