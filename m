Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A13656CC42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 22:30:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQMTwUB002874; Tue, 26 Nov 2013 22:29:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D14ki5AAOW67; Tue, 26 Nov 2013 22:29:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQMTr6r002870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Nov 2013 22:29:55 GMT
Message-ID: <1385504990.11246.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristiana Voicu <cristiana.voicu@intel.com>
Date: Tue, 26 Nov 2013 22:29:50 +0000
In-Reply-To: <c7fa6446c62669988711ad9c0bc2ddeb4c34e303.1385469411.git.cristiana.voicu@intel.com>
References: <cover.1385469411.git.cristiana.voicu@intel.com>
	<c7fa6446c62669988711ad9c0bc2ddeb4c34e303.1385469411.git.cristiana.voicu@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] apr: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 26 Nov 2013 22:30:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-26 at 14:39 +0200, Cristiana Voicu wrote:
> The following typo was fixed in the license file:
> < code for the these subcomponents is subject to the terms and
> < conditions of the following licenses.
> 
> > code for these subcomponents is subject to the terms and conditions
> > of the following licenses.
> 
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>  .../apr/{apr_1.4.8.bb => apr_1.5.0.bb}             |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.0.bb} (89%)

Unfortunately this upgrade showed regressions on the autobuilder:

http://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/21/steps/BuildImages_1/logs/stdio
http://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/20/steps/BuildImages/logs/stdio

Cheers,

Richard


