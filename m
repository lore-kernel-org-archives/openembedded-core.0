Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id AC9077731D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 13:43:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170127134346984_0485;
	Fri, 27 Jan 2017 13:43:46 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=25691 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cX6oV-0001qa-QH; Fri, 27 Jan 2017 08:43:39 -0500
Date: Fri, 27 Jan 2017 08:43:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbFkHqLxDZDMQMkpVbm0XLyDX=0uNqAd-sCudPcrqJGsw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1701270843200.19628@uk63952.mitel.com>
References: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
	<CAJTo0LbFkHqLxDZDMQMkpVbm0XLyDX=0uNqAd-sCudPcrqJGsw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the working directory for configure/compile/install tasks?
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
X-List-Received-Date: Fri, 27 Jan 2017 13:43:49 -0000
Content-Type: multipart/mixed;
	BOUNDARY="587868445-1918457980-1485524619=:19628"

--587868445-1918457980-1485524619=:19628
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 27 Jan 2017, Burton, Ross wrote:

>
> On 27 January 2017 at 12:44, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         i've been handed a simple example of Makefile-based source to turn
>       into a recipe, and the configure/build process is absolutely
>       straightforward -- top-level "configure" and "Makefile" files to be
>       run -- to the point where i can simply define my own do_configure(),
>       do_compile(), etc. tasks.
>
>
> $ git grep \\[dirs\\] meta/classes/base.bbclass
> meta/classes/base.bbclass:do_fetch[dirs] = "${DL_DIR}"
> meta/classes/base.bbclass:do_unpack[dirs] = "${WORKDIR}"
> meta/classes/base.bbclass:do_configure[dirs] = "${B}"
> meta/classes/base.bbclass:do_compile[dirs] = "${B}"
> meta/classes/base.bbclass:do_install[dirs] = "${B}"

  *sigh* ... i really should have known that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-1918457980-1485524619=:19628--
