Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U9ydd-00030I-CV for Openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 15:02:59 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1PDrSrH016936; Mon, 25 Feb 2013 13:53:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4D2Amv8n+UVX; Mon, 25 Feb 2013 13:53:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1PDrJgx016922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Feb 2013 13:53:25 GMT
Message-ID: <1361799965.25338.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 25 Feb 2013 05:46:05 -0800
In-Reply-To: <1361390738-62451-1-git-send-email-jason.wessel@windriver.com>
References: <1361390738-62451-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Add ability to compile with nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2013 14:02:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-20 at 14:05 -0600, Jason Wessel wrote:
> Some of the tools in the util-linux are used for disk and text file
> operations in the nativesdk so as to get around different versions
> that may exist on the host system.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc       |   90 +++++++++++----------
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    3 +-
>  2 files changed, 49 insertions(+), 44 deletions(-)

As far as I can tell, this patch was written and tested against denzil
or danny. Master has improved support for nativesdk and doesn't need
many of these changes apart from the BBCLASSEXTEND and EXTRA_OECONF
lines.

Cheers,

Richard



