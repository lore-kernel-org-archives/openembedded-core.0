Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EED97723A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Dec 2014 14:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBRESYBC020878; Sat, 27 Dec 2014 14:28:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mYW6ps37NR11; Sat, 27 Dec 2014 14:28:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBRESJeY020864
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Dec 2014 14:28:31 GMT
Message-ID: <1419690536.29930.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Sat, 27 Dec 2014 14:28:56 +0000
In-Reply-To: <549EBB98.2090006@topic.nl>
References: <cover.1419471695.git.hongxu.jia@windriver.com>
	<883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
	<CAP9ODKqYTffL5+7uY9VTbR9nM1bMU9nA5rb0-C0FXm3GmX3POQ@mail.gmail.com>
	<549EBB98.2090006@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Sat, 27 Dec 2014 14:29:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-12-27 at 15:00 +0100, Mike Looijmans wrote:
> On 12/26/2014 02:59 PM, Otavio Salvador wrote:
> > On Wed, Dec 24, 2014 at 11:48 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >> While building busybox with QA package-missing checking enabled,
> >> there was warning:
> >> ...
> >> WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
> >> WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
> >> ...
> >>
> >> The config in ${B}/.config decides to generate busybox-mdev,
> >> busybox-httpd or not. Files are copied if the packages generated.
> >> So set PACKAGES in do_package according to the existance of files.
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >
> > Shouldn't we "invert" the logic here? This patch 'removes' httpd and
> > mdev when those are not enabled. Why we don't /add/ those when they
> > are enabled?
> 
> maybe the answer is in a question:
> What would happen then if someone typed "bitbake busybox-mdev"?

You'd get an error regardless since "busybox-mdev" isn't a recipe, its a
package and bitbake doesn't take package names.

Cheers,

Richard


