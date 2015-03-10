Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C73B8739D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2AAWZei028916; Tue, 10 Mar 2015 10:32:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ADdWUU1WH9oL; Tue, 10 Mar 2015 10:32:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2AAWLxt028889
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Mar 2015 10:32:33 GMT
Message-ID: <1425983541.9701.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 10 Mar 2015 10:32:21 +0000
In-Reply-To: <30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
	<30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Tue, 10 Mar 2015 10:32:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-10 at 02:25 -0700, Robert Yang wrote:
> Workaround when:
> MACHINE = "qemuarm"
> DEBUG_BUILD = "1"
> 
> Errors:
> {standard input}: Assembler messages:
> {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
> {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
> make: *** [cmds-fi-disk_usage.o] Error 1
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../btrfs-tools/btrfs-tools_git.bb                 |    7 +++++++
>  1 file changed, 7 insertions(+)

I really don't like workarounds like this. They tend to get left in the
recipes for ever more and never get fixed properly. Please just use
something like

DEBUG_BUILD_pn-btrfs-tools = "0"

or similar.

Cheers,

Richard


