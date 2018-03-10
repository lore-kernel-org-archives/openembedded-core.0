Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA92577E87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 21:34:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2ALYIcm016109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 10 Mar 2018 21:34:21 GMT
Message-ID: <1520717657.10851.169.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Mar 2018 13:34:17 -0800
In-Reply-To: <CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
	<CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 21:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-03-10 at 22:04 +0100, Martin Jansa wrote:
> Feel free to ignore my feedback.
> 
> I didn't mean it as strong objection to get this merged as-is.
> 
> It was rather an advice for next time or in case another version is
> sent (e.g. with that missing patch from Khem) and Juro decides to
> rework it in order to save himself some time later when preparing the
> changes for pyro and rocko (as he said in the e-mail that he plans to
> prepare). It shouldn't be too difficult to rework anyway, because
> Andre already has the cherry-picks for morty and Juro can do just
> rebase of his change on top of that to get those new patches in
> separate commit.

Juro's mail reply was a bit messed up with formatting but that missing
arm patch appeared to cause an internal compiler error when compiling
valgrind for x86-64 and I suspect that is why its missing. If we do
want to consider that one I'd probably make it a separate issue.

I can't really merge anything due to our backports policy until we have
at least the pyro patches sorted. I'm still torn on which way to go but
if someone can pull together a good set of patches for the various
branches I would take it. I'm also pretty sure Juro will be fine if
someone wants to break that patch up.

Cheers,

Richard



