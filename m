Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2805B60290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 10:00:40 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c9-v6so1297921iob.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OA0a34MQn97/nXVc+XZ9Sdn+7H+jv/OCXIvIJ4LWyak=;
	b=KqbAsjAB5xDceLd3vNUwiudV1m2BebSMp+NQ618WlttwDAwV+7KOKRVsTWwMGZiwuw
	Shwfkl0dSDoq3hcjLkLLkCJmP+s2bj37+nAzB6y5s1j487kTpliyX7cRlwvrwtZBjZx0
	1RCk2FYe/KieFbh0xlD9Rh0ECSE6n9VdMBX/ISObBjZioaPreuTU8eE4/JLWUbnxQW4R
	1kV8yeaw+rpxN6Oy5sR7/MpMC99j8nPFt1Fkg+MIAXlxwxgQgTxS2vMRUQdo+TKFWGUD
	rOqErIzR8ycYNPQ2NwAQoH2qDrPnLUX4EFlsYkBJuZJy1OqUIzooH6cAtyoHCc+0TZf9
	+KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OA0a34MQn97/nXVc+XZ9Sdn+7H+jv/OCXIvIJ4LWyak=;
	b=bnQN1kQ/JZvPSpneMyMhbfff7MK6Nvn7DSMqrv0GuNyaA0qqwcrnbAYgH3jIrB4mPX
	VcnXeBr53Cuw3iARfaIfTOPqcIU8RMZexEj0ZhwNw3pLrI7V4xAxeh5JpaOTgkdSKQSK
	+BvRibTozJ+CTKMAHSp9Flum6/8eQHY9DazgeNK4AqsPkyMy0og9ZgLdb4zvhmUyCFRC
	8ys2LLLDgiCRcUAbsU7NjTBeymZ5zN6faucWLBOb7EqLRzXkgzCbbCllB07r8Hg5e+KW
	cjAjRNWnc2k4UhlNf/XSTvaZv/G+6ymrMfxvYu+T+7lqj9tj2WZTCIBzIS06uSitzBT+
	Y4tQ==
X-Gm-Message-State: ALKqPwelsVKORjeqEICloF0tnKBX+ZUewsl0siqb6mjl5AsC5UwxAZPX
	UR6V1Iq7pI3XZEcZb0T8ZyQ2Jxj2yL5LLp96NXLlwEdN
X-Google-Smtp-Source: AB8JxZqWw6AHXqxrOjV4dwh4ZtOtb8SgxfIBt0Gl4tufPacNEimju496ilgjVPXTPkMBKHT/UTgv3AAwVyZ2gNAjp4E=
X-Received: by 2002:a6b:752:: with SMTP id 79-v6mr5230572ioh.216.1526551242063;
	Thu, 17 May 2018 03:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 17 May 2018 03:00:21 -0700 (PDT)
In-Reply-To: <6d46c58082741876ffc994c6e37364b65fe16f1f.1526447201.git.Qi.Chen@windriver.com>
References: <cover.1526447201.git.Qi.Chen@windriver.com>
	<6d46c58082741876ffc994c6e37364b65fe16f1f.1526447201.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 May 2018 11:00:21 +0100
Message-ID: <CAJTo0LZdoMNLNxyLg+T=F3+yZT8UGPi2XURdnETRHRT2VvR+RQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/sdk/cases/buildgalculator.py: skip if gettext not available
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
X-List-Received-Date: Thu, 17 May 2018 10:00:41 -0000
Content-Type: text/plain; charset="UTF-8"

On 16 May 2018 at 06:07, Chen Qi <Qi.Chen@windriver.com> wrote:
> +        if not (self.tc.hasPrefixedTargetPackage("gettext")):
> +            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")

  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/sdk/cases/buildgalculator.py",
line 14, in setUpClass
    if not (self.tc.hasPrefixedTargetPackage("gettext")):
AttributeError: 'OESDKTestContext' object has no attribute
'hasPrefixedTargetPackage'

Ross

