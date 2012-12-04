Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TfsNb-0005Tt-Gh for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 14:17:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4D3KHq007078;
	Tue, 4 Dec 2012 13:03:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07032-02; Tue,  4 Dec 2012 13:03:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4D3A3W007072
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Dec 2012 13:03:11 GMT
Message-ID: <1354626180.25268.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 04 Dec 2012 13:03:00 +0000
In-Reply-To: <1354622874-4038-1-git-send-email-Martin.Jansa@gmail.com>
References: <cc05da7f236a0c8367c3cff3b4a0d297fe6a8dd7.1349356755.git.Martin.Jansa@gmail.com>
	<1354622874-4038-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] scripts/sstate-diff.sh: add simple script to compare sstate checksums between MACHINEs
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
X-List-Received-Date: Tue, 04 Dec 2012 13:17:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 13:07 +0100, Martin Jansa wrote:
> * takes tmpdir, machines and targets from command arguments or env variables
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/sstate-diff.sh | 107 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100755 scripts/sstate-diff.sh
> 
> diff --git a/scripts/sstate-diff.sh b/scripts/sstate-diff.sh

Can we call this something a little more intuitive like
sstate-diff-machines ?

Cheers,

Richard



