Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A777737DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 67F4B3151193;
	Fri, 27 Feb 2015 10:35:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cNrC9OVqQ2pP; Fri, 27 Feb 2015 10:35:04 +0100 (CET)
Received: from [172.22.22.61] (55d45078.access.ecotel.net [85.212.80.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 487063150CD1;
	Fri, 27 Feb 2015 10:35:04 +0100 (CET)
Message-ID: <54F03A47.8020208@opendreambox.org>
Date: Fri, 27 Feb 2015 10:35:03 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Urbanec <openembedded-devel@urbanec.net>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>	<CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>
	<54EFDF33.2000609@urbanec.net>
In-Reply-To: <54EFDF33.2000609@urbanec.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Fri, 27 Feb 2015 09:35:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Peter,

On 27.02.2015 04:06, Peter Urbanec wrote:
> On 27/02/15 08:52, Burton, Ross wrote:
>>
>> On 26 February 2015 at 17:57, Peter Urbanec
>> <openembedded-devel@urbanec.net <mailto:openembedded-devel@urbanec.net>>
>> wrote:
>>
>>     -SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
>>     +SRCREV ?= "${AUTOREV}"
>>
>>
>> I'd say that the git packages should track the tarball releases *and be
>> tested as such* so that they actually work out of the box and don't
>> break over time as upstream changes.
> 
> I disagree. There's no point in having a git version of a package that
> is exactly the same as a release version. Doing so would also bring in
> all the patches specific to that release, which may not be appropriate
> for a different git revision. If you want a tested release, you would
> stick to something like gstreamer1.0*1.4.5.bb instead of choosing a git
> version.
> 
>> If someone wants to make a bleeding-edge build then it's a simple change
>> to set the SRCREV to AUTOREV at the distro level.
> 
> Well, as it's shaping up, that may actually not be possible in oe-core
> packages. It certainly does not work with the current gstreamer1.0*git
> recipes, because as soon as you do that you end up with infinite
> recursion when expanding SRC_URI.
> 
> I think there are two main use cases for git builds. Case one is keeping
> up with the bleeding edge, which implies SRCREV="${AUTOREV}". Case two
> is freezing at a particular revision that suits you, which implies
> SRCREV="git-hash". In case one, you will probably want to run a fairly
> lean set of patches (or even none) to track the upstream. In case two,
> you could potentially have a comprehensive set of patches that will only
> apply to that revision. Both cases will be a lot easier to manage if the
> *git.bb recipe gives you a clean git repository without patches.

as far as I remember, OE-Core policy forbids AUTOREV in recipes, because
it would make network access mandatory.

The syntax for enabling it from local.conf is:
SRCREV_pn-gstreamer1.0 = "${AUTOREV}"

Regards,
Andreas

