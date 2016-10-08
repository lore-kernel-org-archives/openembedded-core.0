Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD4E96025E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2016 06:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u986nuOw032260; Sat, 8 Oct 2016 07:49:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CyIulNhUA6Zr; Sat,  8 Oct 2016 07:49:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u986nnXu032243
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 8 Oct 2016 07:49:51 +0100
Message-ID: <1475909389.30475.645.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Oct 2016 07:49:49 +0100
In-Reply-To: <1475876786-22027-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1475876786-22027-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH] check bitbake server-only port is a number
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
X-List-Received-Date: Sat, 08 Oct 2016 06:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-07 at 16:46 -0500, Benjamin Esquivel wrote:
> either using the memres script or the bitbake call with --server-only
> if the port is a string instead of a number then the process hangs
> indefinitely causing a loop that never ends.
> 
> adding a check at the beginning for the port being a number otherwise
> end prematurely.
> 
> [YOCTO#10397]
> 
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
>  bitbake/lib/bb/main.py | 7 +++++++
>  1 file changed, 7 insertions(+)

bitbake patches should go to the bitbake list. I've queued this anyway
since I don't like indefinite hangs. I also had to tweak the commit
message (e.g. a main: prefix to the shortlog).

Cheers,

Richard

