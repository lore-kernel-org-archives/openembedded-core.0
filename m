Return-Path: <paul@betafive.co.uk>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74A057CB4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:29:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 88881578
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 03:29:36 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Mon, 25 Nov 2019 03:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=s4iVVBDkszaKHp7Qehyz58+NNafYD+9
	nDuHXQXRw3u4=; b=nZr/KL1Ri7X9nNgrseHHa6cLluzM4XMm4DrAz0FkNTVT8LJ
	KQP32IA0Tqc0XIPej+LDYzrVgdhiuZzz8qkbysdbKnsaMX1Dg1nh3pQb3gJR+aQH
	wHf+nUh8coA4tuVmquQ4ZujGgI75mnM3XefbZY6bRabd4/CZ+JSoJMzK7MSD8qU+
	6WZWx9iWbi6InLSUl0NFMQIk1mSSDBJizTBiAZnMBavu37EGvugInyG1oQX1a807
	q45DBiNjN5rzjFAVU4nWrPgdSMMmaM5WBvASMZ+rIL0pfR8GM0cf5W71D+1Vcb98
	0FBv1REW3ZAMuYLhsgx4NaeRxrqkZ7S7+TRFFWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s4iVVB
	DkszaKHp7Qehyz58+NNafYD+9nDuHXQXRw3u4=; b=CHHc6pRQWLs0Af5ldmMEoh
	ND53V7Kx253qNbKpDEOyganY4vvlfbDyOmpDnY25AwG+3KK2V3KrhDAyDV7PU+Rs
	Jr4HvKVi61qb2TA0abA9Bl7Eul+FCUbVARWTchBkLwmN2jhiGDOod3ZVPwY0TeFz
	VZL147hk6F3YUzaUXnvWIZIhYzjpAgA8I6DVr3C4c65jltcZ2cnOIW4tZcw8nwX6
	0FPGImxNSQzxX10CHOE7WosA/1laYKkpD+P4a4V3lENxx6RLkAkjQoRNpKTZD9rn
	D16fz04gQbdtyjwiXJMzqOq+t6VNoP3Uzol+f2cHZJA1pfN2fuQ3gyr4GwvX+LBw
	==
X-ME-Sender: <xms:75DbXRQ6N-OfpK2UPDWHIagDsad0EWRhmrZMoq2dAinUfidz8LDJUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeitddgheelucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfrrghu
	lhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfrrg
	hrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:75DbXfCnRuD_1_xQ9QJ9olasoOYBup1HfTJWYqudXNhufhSP9AFFYg>
	<xmx:75DbXR0O4qvywWhGHS9I5ThPc8Jp0AdZXptmmZBFjLWUXEq7VGFR2Q>
	<xmx:75DbXdUZqX9jG5kF4-ZCY-aeIHFyt6pv3i9t58gnNcUiSrECCgvGwQ>
	<xmx:8JDbXaIys7N1HOthpcDwFzHOTbD00RgWtG9W9OizKSdZc9a4esXqdA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B9DDEE00A2; Mon, 25 Nov 2019 03:29:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <955733c7-49b3-4ca0-8174-772e2cfe5d72@www.fastmail.com>
In-Reply-To: <20191111141621.319368-2-paul@betafive.co.uk>
References: <20191111141621.319368-1-paul@betafive.co.uk>
	<20191111141621.319368-2-paul@betafive.co.uk>
Date: Mon, 25 Nov 2019 08:29:13 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa: archiver: Add basic tests for all archiver modes
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
X-List-Received-Date: Mon, 25 Nov 2019 08:29:35 -0000
Content-Type: text/plain

Ping on this, it hasn't been accepted yet but also hasn't had any review.

On Mon, 11 Nov 2019, at 14:16, Paul Barker wrote:
> 6 new test cases are added to cover the various archiver modes
> documented at the top of archiver.bbclass. Each test sets the
> appropriate configuration options, runs the `do_deploy_archives` task
> for the selftest-ed recipe and checks for the presence of the expected
> archive file.
> 
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  meta/lib/oeqa/selftest/cases/archiver.py | 66 ++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py 
> b/meta/lib/oeqa/selftest/cases/archiver.py
> index f8672f8abb..6bd0e06ec4 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -129,3 +129,69 @@ class Archiver(OESelftestTestCase):
>          self.write_config(features)
>  
>          bitbake('-n core-image-sato')
> +
> +    def _test_archiver_mode(self, mode, target_file_name, 
> extra_config=None):
> +        target = "selftest-ed"
> +
> +        features = 'INHERIT += "archiver"\n'
> +        features +=  'ARCHIVER_MODE[src] = "%s"\n' % (mode)
> +        if extra_config:
> +            features += extra_config
> +        self.write_config(features)
> +
> +        bitbake('-c clean %s' % (target))
> +        bitbake('-c deploy_archives %s' % (target))
> +
> +        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
> +        glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 
> bb_vars['TARGET_SYS'], '%s-*' % (target))
> +        glob_result = glob.glob(glob_str)
> +        self.assertTrue(glob_result, 'Missing archiver directory for 
> %s' % (target))
> +
> +        archive_path = os.path.join(glob_result[0], target_file_name)
> +        self.assertTrue(os.path.exists(archive_path), 'Missing archive 
> file %s' % (target_file_name))
> +
> +    def test_archiver_mode_original(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[src] = 
> "original"`.
> +        """
> +
> +        self._test_archiver_mode('original', 'ed-1.14.1.tar.lz')
> +
> +    def test_archiver_mode_patched(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[src] = 
> "patched"`.
> +        """
> +
> +        self._test_archiver_mode('patched', 
> 'selftest-ed-1.14.1-r0-patched.tar.gz')
> +
> +    def test_archiver_mode_configured(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[src] = 
> "configured"`.
> +        """
> +
> +        self._test_archiver_mode('configured', 
> 'selftest-ed-1.14.1-r0-configured.tar.gz')
> +
> +    def test_archiver_mode_recipe(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[recipe] = 
> "1"`.
> +        """
> +
> +        self._test_archiver_mode('patched', 
> 'selftest-ed-1.14.1-r0-recipe.tar.gz',
> +                                 'ARCHIVER_MODE[recipe] = "1"\n')
> +
> +    def test_archiver_mode_diff(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[diff] = 
> "1"`.
> +        Exclusions controlled by `ARCHIVER_MODE[diff-exclude]` are not 
> yet tested.
> +        """
> +
> +        self._test_archiver_mode('patched', 
> 'selftest-ed-1.14.1-r0-diff.gz',
> +                                 'ARCHIVER_MODE[diff] = "1"\n')
> +
> +    def test_archiver_mode_dumpdata(self):
> +        """
> +        Test that the archiver works in with `ARCHIVER_MODE[dumpdata] 
> = "1"`.
> +        """
> +
> +        self._test_archiver_mode('patched', 
> 'selftest-ed-1.14.1-r0-showdata.dump',
> +                                 'ARCHIVER_MODE[dumpdata] = "1"\n')
> -- 
> 2.24.0
> 
>

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

