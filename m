Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 7073360111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:56:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161026095634022_0684;
	Wed, 26 Oct 2016 09:56:34 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=22848 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzKwd-0005Ez-A1; Wed, 26 Oct 2016 05:56:27 -0400
Date: Wed, 26 Oct 2016 05:55:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610260549570.17717@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
	<alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
	<CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Wed, 26 Oct 2016 09:56:42 -0000
Content-Type: multipart/mixed;
	BOUNDARY="2071690107-283997265-1477475731=:17717"

--2071690107-283997265-1477475731=:17717
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 25 Oct 2016, Christopher Larson wrote:

> On Tue, Oct 25, 2016 at 12:05 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       On Tue, 25 Oct 2016, Robert P. J. Day wrote:
>
>       >   i once wrote a wiki page on "bb", distinguishing between queries
>       > you could make before you did a build, versus queries that
>       > needed a build. it seems like oe-pkgdata-util needs a
>       > completed build for pretty much everything, do i have that
>       > right?
>
>         never mind, i just read this snippet from the YP ref manual:
>
>       "You can use the oe-pkgdata-util command-line utility to query
>       PKGDATA_DIR and display various package-related information.
>       When you use the utility, you must use it to view information
>       on packages that have already been built."
>
>       so i'm assuming that means for *all* oe-pkgdata subcommands, no
>       exceptions.
>
> Right, oe-pkgdata-util is about inspecting build output via pkgdata,
> whereas most of bb is inspection tools about the metadata — before
> the build. The only exception is bb-contents, which is a
> convenience, just wraps oe-pkgdata-util under the hood and tells the
> user the oe-pkgdata-util command in case they want to run it
> directly.

  ah, excellent, this is important for me since, when i teach OE/YP,
one of the first things i do is distinguish between a "build" and
"nobuild" project directory ("nobuild" meaning configured only), and
use "bb" to show how much one can query about the project before any
compilation is done. this is amazingly useful.

rday

p.s. if readers don't know about "bb", i wrote a page on it once upon
a time:

  http://www.crashcourse.ca/wiki/index.php/Bb

i better go back and make sure it's up to date.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--2071690107-283997265-1477475731=:17717--
