Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 41C317777D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27KlTXM016328; Tue, 7 Mar 2017 20:47:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ihws746KpcLA; Tue,  7 Mar 2017 20:47:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27KlNCi016323
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Mar 2017 20:47:24 GMT
Message-ID: <1488919643.22968.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm-oss@mcclintock.net>,
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Mar 2017 20:47:23 +0000
In-Reply-To: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 20:47:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-07 at 13:48 -0600, Matthew McClintock wrote:
> This is useful in a few scenarios:
> 
> 1) A developer wants to be able to grep all the code in a particular
> without having to run patch on various components until they guess
> the
> right one (e.g. which component is generating an error/warning?)
> 
> 2) Other code scanning tools that can be run without requiring a full
> image to be built (legal, static code analysis, etc)
> 
> Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
> ---
>  meta/classes/utility-tasks.bbclass | 7 +++++++
>  meta/conf/documentation.conf       | 1 +
>  2 files changed, 8 insertions(+)

I have mixed feelings on this. Whilst I can see the attraction, extra
tasks like this do actually have a parsing overhead. We already have a
lot of them and its only a question of time before someone wants
another XXXall task adding.

I'm wondering if we can solve this at the bitbake level instead with a
new parameter instead? That would allow us to delete tasks and speed up
parsing rather than slow things down.

Cheers,

Richard

