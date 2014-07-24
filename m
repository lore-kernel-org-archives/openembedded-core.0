Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 36D3765FE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 11:15:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140724111524895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 11:15:24 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.102.254.33] (port=30564 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XAGzX-0007Kw-72 for openembedded-core@lists.openembedded.org;
	Thu, 24 Jul 2014 07:15:19 -0400
Date: Thu, 24 Jul 2014 07:15:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1407240709110.8468@localhost>
Message-ID: <alpine.LFD.2.11.1407240714050.8468@localhost>
References: <alpine.LFD.2.11.1407240709110.8468@localhost>
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
Subject: Re: simple dependency question
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
X-List-Received-Date: Thu, 24 Jul 2014 11:15:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 24 Jul 2014, Robert P. J. Day wrote:

>
>   i realize that "DEPENDS" represents build-time dependencies, as in
> ... all of the DEPENDS recipes must build *completely* before this
> recipe can *begin* to build, is that correct?
>
>   however, in something like module.bbclass where one finds:
>
> do_make_scripts[deptask] = "do_populate_sysroot"
>
> does that now *override* the normal build-time dependency to say only
> that this recipe's do_make_scripts task need only wait until all of
> the "DEPENDS" recipes have completed their do_populate_sysroot tasks?
>
>   in other words, the instant i define an inter-task dependency, does
> that relax the normal strong build dependency? since, if it didn't,
> this wouldn't make any sense.

  sorry, i shouldn't have described that as an "inter-task"
dependency, i realize that's different, as in:

ncurses.inc:do_test[depends] = "unifdef-native:do_populate_sysroot"

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


