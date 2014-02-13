Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 89FC86EE4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:37:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DCbBoD028618; Thu, 13 Feb 2014 12:37:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id saeDMbV9kwv2; Thu, 13 Feb 2014 12:37:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DCb5Yo028614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 12:37:06 GMT
Message-ID: <1392295019.14081.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 13 Feb 2014 12:36:59 +0000
In-Reply-To: <CAP9ODKpzN6HvJmTa62es0RY_Qr7LLk26mTkbiL6b8XmRPUHs7w@mail.gmail.com>
References: <CAP9ODKpzN6HvJmTa62es0RY_Qr7LLk26mTkbiL6b8XmRPUHs7w@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-dora] Pulseaudio fix
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
X-List-Received-Date: Thu, 13 Feb 2014 12:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 08:50 -0200, Otavio Salvador wrote:
> Hello,
> 
> This change should be backported to dora as people are having problems
> using x11-less distros with pulseaudio:
> 
> otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
> 77c4f158c6dbc8a373d2064552224f5dfe1a7bd2
> [dora 19606eb] pulseaudio: fix RDEPENDS traversal for consolekit
>  Author: Christopher Larson <chris_larson@mentor.com>
>  1 file changed, 5 insertions(+), 1 deletion(-)
> otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
> e230b4498790a3dfdc36ea5761807459fc96368e
> [dora 090424d] pulseaudio: only package consolekit module when x11 is enabled
>  Author: Christopher Larson <kergoth@gmail.com>
>  1 file changed, 1 insertion(+), 1 deletion(-)

With Robert being away, I've taken care of a few of the dora
backports...

Cheers,

Richard


