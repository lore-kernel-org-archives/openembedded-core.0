Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1328D77A54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:04:21 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170328120420347_0484;
	Tue, 28 Mar 2017 12:04:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=55639 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csprB-00021o-Ee; Tue, 28 Mar 2017 08:04:13 -0400
Date: Tue, 28 Mar 2017 08:04:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYhHdYHb8ecGCuF_L=Cf_29a0pW3_1yk7di402C3mObLA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703280803580.17834@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
	<CAJTo0LYhHdYHb8ecGCuF_L=Cf_29a0pW3_1yk7di402C3mObLA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
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
X-List-Received-Date: Tue, 28 Mar 2017 12:04:22 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-341264423-1490702653=:17834"

--587868445-341264423-1490702653=:17834
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Mar 2017, Burton, Ross wrote:

>
> On 28 March 2017 at 11:50, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>        gconf_postinst() {
>       -if [ "x$D" != "x" ]; then
>       +if [ -n "${D}" ]; then
>
>
> This totally changes how the postinst behaves.  I'll leave
> understanding how as an exercise to the reader. :)

  *sigh* ... my bad.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-341264423-1490702653=:17834--
