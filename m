Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8130C6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:52:11 +0000 (UTC)
Received: by igui7 with SMTP id i7so14049297igu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=DmKiC6rDSAmIeSrtPld1o8bLWOdBfBjLfBtlFqeXf4s=;
	b=TxkJikOYitoGj9Eg0GZM4KYaZjtwvyp5LERi1s2F7nsF9FE7QMlNgBcI3p7j+c9xoP
	OqI7a1P3ktd/ruepoSl7IHsX3F8trAbObFc/YcT7RdYxGLOnQ0wdFAQs/dOLR1arGMZq
	O6hlWaDWBXPWikTMSs4iNQ6wxXvWye2SldZOU/MqNx9uohP67mevUf8t9/hsvBSPMwNU
	8b2urNt1gifaCPO6wP9ReaWq6rrLp9jgDazjrNKbwIrwjfmOzY7bw044gk+E/X3OmNDZ
	GrwFgwPH4LMyPr2B8L+oHBRC8pfITv7Xb0entVBu70eRTfTNZwLK48PBHF/IwXWETy00
	W26w==
X-Gm-Message-State: ALoCoQkxaXIW8Z4SZQh85j7f+/9ILEupsmxqqA7Mq/F22YFIXsIyHw7yCKbaiyjTW5kmu5Tjl/TM
X-Received: by 10.50.20.8 with SMTP id j8mr2925385ige.36.1439563931837;
	Fri, 14 Aug 2015 07:52:11 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D814.dip0.t-ipconnect.de. [93.232.216.20])
	by smtp.gmail.com with ESMTPSA id
	g123sm5018917iog.31.2015.08.14.07.52.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 07:52:11 -0700 (PDT)
Message-ID: <1439563928.28153.65.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 16:52:08 +0200
In-Reply-To: <CAJTo0La2Q-jeFBRND7pYoWW5HQByu7pgEcOzexqJw1FSe2fQiA@mail.gmail.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbnRjSYpz5F41QjR_93Ex0YdVH+QKQChbRTGLXGrRumBQ@mail.gmail.com>
	<12971906.mb086C5zve@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0La2Q-jeFBRND7pYoWW5HQByu7pgEcOzexqJw1FSe2fQiA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 14:52:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-14 at 12:03 +0100, Burton, Ross wrote:
> 
> On 14 August 2015 at 12:01, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>         Or install the buildtools perhaps.
>         
> 
> 
> Yes, I had that in my head but someone failed to write it down.
> There's a fair chance that a host with a sufficiently old tar also
> needs other updates, and that's when buildtools is used (which
> includes tar).

The hosts we talk about (Debian 7, CentOS 6) work fine for normal usage
without having to install buildtools. Having to install them for a
situation that could also be dealt with by bitbake automatically seems
not very user friendly.

On IRC, Ross suggested that I should rewrite the regular tar recipe such
that it installs tar as opt-in binary and remove the (mostly obsolete)
tar-replacement-native). I'll send updated patches based on that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




