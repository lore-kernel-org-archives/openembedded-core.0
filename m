Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B67556CC92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 11:27:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2013 04:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,492,1378882800"; d="scan'208";a="416474226"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2013 04:27:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Oct 2013 12:27:45 +0100
Message-ID: <3629318.cbsHQ1o6XL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <F5284B34-0CDB-4F68-93B1-E748158FF690@dominion.thruhere.net>
References: <1381745377-6129-1-git-send-email-koen@dominion.thruhere.net>
	<2930108.6fy5UNzbWP@helios>
	<F5284B34-0CDB-4F68-93B1-E748158FF690@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] openssh: allow login with empty password
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
X-List-Received-Date: Mon, 14 Oct 2013 11:27:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 October 2013 13:09:55 Koen Kooi wrote:
> Op 14 okt. 2013, om 12:37 heeft Paul Eggleton
> <paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Monday 14 October 2013 12:09:37 Koen Kooi wrote:
> >> Currently both PAM and dropbear allow logins with empty passwords, but
> >> openssh doesn't. This commit changes the default in openssh to allow
> >> empty password logins.
> >> 
> >> This should be changed to be a global config option in the long run.
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config index
> >> 4f9b626..175e8f3 100644
> >> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> @@ -59,7 +59,7 @@ Protocol 2
> >> 
> >> # To disable tunneled clear text passwords, change to no here!
> >> #PasswordAuthentication yes
> >> -#PermitEmptyPasswords no
> >> +PermitEmptyPasswords yes
> >> 
> >> # Change to no to disable s/key passwords
> >> #ChallengeResponseAuthentication yes
> > 
> > We do already have logic in image.bbclass to set this based upon
> > debug-tweaks being in IMAGE_FEATURES; is that not working for you?
> 
> I haven't tried that, but that still doesn't fix the inconsistency issues
> and presents problems during package upgrades.

It shouldn't be an issue for package upgrades - ${sysconfdir}/ssh/sshd_config 
is included in CONFFILES for openssh-sshd.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

