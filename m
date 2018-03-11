Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2B2F788AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 12:06:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2BC6ENL008700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 11 Mar 2018 12:06:18 GMT
Message-ID: <1520769972.10851.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Mar 2018 05:06:12 -0700
In-Reply-To: <CA+chaQejU2YsEFWMydDJgbhtFP5r-e_45k7YqkUo3UdLRvbxVw@mail.gmail.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
	<CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
	<1520717657.10851.169.camel@linuxfoundation.org>
	<CA+chaQejU2YsEFWMydDJgbhtFP5r-e_45k7YqkUo3UdLRvbxVw@mail.gmail.com>
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
X-List-Received-Date: Sun, 11 Mar 2018 12:06:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-03-11 at 01:56 +0100, Martin Jansa wrote:
> I've sent the pull requests for all 3 release branches.
> 
> I'll let some builders doing more tests over night, but it's very
> close to what was merged in master (and also to what is currently in
> morty-next) so it should be relatively safe.

Thanks for this. I've staged the patches in the various -next branches.
I ran pyro-next on the autobuilder to see where we stand and x86-64 is
showing the ICE I mentioned in valgrind so we'll likely need to pull
out that patch until we can figure out a way of fixing that. I'll queue
a fixup patch and retry and confirm that does fix the issue.

Cheers,

Richard



