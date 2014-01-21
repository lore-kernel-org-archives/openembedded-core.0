Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 50D9E6157A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:42:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0LAgHQe009522; Tue, 21 Jan 2014 10:42:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g3EZVGvDDCWU; Tue, 21 Jan 2014 10:42:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0LAfeE3009504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jan 2014 10:41:41 GMT
Message-ID: <1390300893.874.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 21 Jan 2014 10:41:33 +0000
In-Reply-To: <1390218017-10423-2-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
	<1390218017-10423-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/7] ltp: rename recipe to ltp_20140115.bb
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
X-List-Received-Date: Tue, 21 Jan 2014 10:42:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-20 at 13:40 +0200, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta/recipes-extended/ltp/ltp_20130904.bb | 78 -------------------------------
>  meta/recipes-extended/ltp/ltp_20140115.bb | 78 +++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 78 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
>  create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb

So we rename the recipe but don't actually change the SRCREV to the new
version (since you do that in 3/7)? 

This seems a little confusing?

Cheers,

Richard


