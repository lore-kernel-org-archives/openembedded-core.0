Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id AD4DF70656
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:53:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140722165321066
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:53:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.102.254.33] (port=51394 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X9dJT-00018R-2I; Tue, 22 Jul 2014 12:53:15 -0400
Date: Tue, 22 Jul 2014 12:53:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZAN=XYZTXYRuR1AdaD_NdeYwzDv8DyvrQaSnyqbtLC_OC7A@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407221250500.9028@localhost>
References: <alpine.LFD.2.11.1407221229210.8547@localhost>
	<CABcZAN=XYZTXYRuR1AdaD_NdeYwzDv8DyvrQaSnyqbtLC_OC7A@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why conditional assignment of DEPLOY_DIR_IMAGE in bitbake.conf?
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
X-List-Received-Date: Tue, 22 Jul 2014 16:53:47 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-458853656-1406047994=:9028"

--8323328-458853656-1406047994=:9028
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 22 Jul 2014, Christopher Larson wrote:

>
> On Tue, Jul 22, 2014 at 9:36 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         quite possibly another silly question, but i'm perusing poky's
>       version of bitbake.conf and i see this:
>
>       DEPLOY_DIR ?= "${TMPDIR}/deploy"
>       DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
>       DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
>       DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
>       DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
>       DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>       DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>
>         now, what is the value of using "?=" to set DEPLOY_DIR_IMAGE, rather
>       than just "=". i know what "?=" represents, but i normally expect to
>       see it in a context where someone might have set it earlier to some
>       other value, but this is in bitbake.conf, before any of the "include"
>       or "require" directives to pull in any of the other .conf files. so in
>       the midst of all those other DEPLOY_DIR_* hard assignments, why is the
>       images directory a conditional install?
>
>
> s/install/define/

  um, quite so. :-P

> If there's a ?= done before any includes in bitbake.conf, either its
> position in the file has changed, or it's set that way to allow the
> user to add those variables to the env whitelist and set them in the
> environment, as the env is set before bitbake.conf is parsed.

  ah, gotcha. so the obvious question is, who decides which variables
merit this sort of behaviour and which don't? why two variables out of
the DEPLOY_DIR_* variables and not the rest? seems sort of arbitrary.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-458853656-1406047994=:9028--
