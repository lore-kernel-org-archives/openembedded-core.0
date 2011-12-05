Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXbRw-0006eo-GV for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 17:31:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5GOXGV024107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 16:24:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23963-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2011 16:24:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5GORCx024101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 16:24:28 GMT
Message-ID: <1323102278.25960.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 16:24:38 +0000
In-Reply-To: <cover.1322782677.git.paul.eggleton@linux.intel.com>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 0/2] introduce buildhistory.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2011 16:31:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 23:56 +0000, Paul Eggleton wrote:
> Here is the initial version of buildhistory.bbclass. It provides (most
> of) the functionality of testlab.bbclass and all functionality of
> packagehistory.bbclass.
> 
> Changes/improvements over testlab:
> * Supports both rpm and ipk-based images
> * Works even if packaging data is removed in the final image
> * File listing is tidier and excludes date/time info so changes are more
>   obvious
> * Produces a separate package list with just the package names (i.e. not
>   the full file name).
> * Optional git commit occurs at the end of the build and is done outside
>   of fakeroot
> * Can optionally push git commit to a remote repository
> 
> Todo items:
> * There is no recording of licenses into the build history, in favour of
>   Beth Flanagan's upcoming work on license.bbclass. I appreciate some may
>   want this tracked in buildhistory - please comment. Could be something
>   to add afterwards when Beth's work is integrated.
> * Deb-based packaging is not supported because I am unable to test it
>   (see Yocto bug #1802).
> 
> Note that an earlier version of this was merged accidentally to OE-core;
> this was subsequently reverted to allow proper review.
> 
> 
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
> 
> The following changes since commit e57935dc18d576feb1003b48e7cdc72a444131b8:
> 
>   Revert "classes/buildhistory: add new output history collection class" (2011-12-01 23:00:52 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/buildhistory
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory
> 
> Paul Eggleton (2):
>   classes/buildhistory: add new output history collection class
>   classes/buildhistory: merge in package history functionality

I've merged this. I don't think its perfect and I know Koen has found
one potential issue but it provides a base people can send patches
against :)

Cheers,

Richard



