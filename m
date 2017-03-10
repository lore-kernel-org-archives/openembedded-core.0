Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 106CC776E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:43:54 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id z13so48744884iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=bsYSPDJUeo5gHNTh3p3QI4EdqWyUABOGx8k5rtHn4Wk=;
	b=UqkgraAL3DoFyot7cNpreBai62YDAF4f/uzRkny2rsIh4EUenbY0Pdny7W960Zj3zn
	V7TDqZlTIx6IXZIQcQwaMj6KzYKcXlrfybRsYFdw7agLaANbDv28YFICGMUupYPJkQe+
	4oTgGxHU1rMopustrxtEhvQBslSnmzz39XV0lrRONjUlVJf20UyUxLxObm90VSpq0isK
	KZmAnheN3GFVhoipO7SbjKXs1SOSQ70e/FEogd7lpUaxgeWMYeS/Cq0+P0I9Nv7w+Xwp
	ObRbSEaM4eEn1o66YoRRKZ/yJbFMThEssFSgh5gr5zqd8+qkMLfJ85dtBp+nDy4UTY7s
	gXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=bsYSPDJUeo5gHNTh3p3QI4EdqWyUABOGx8k5rtHn4Wk=;
	b=jHuHH5DKUoUBwHvaBjZxqULh7AUk7jMORVMv9VhJeahP60jbKOMgY5o/v28KGnt+9J
	5RW+ZRqvNRaOBlt+iztAGWmje7/Fr2ZgkQ6GhK37tA6IcCMggb0SjCDqfvCA0oOPYbse
	ngUDk6NK75ha38T+ykChyqBRhK4GRTXss2OkXbcBhttR9rY/MUqIAtg8jCwcsxF0Y1s5
	PazoRAqir5DaPt71YiuUDSvrRLa1g81WHSXgMgDVihwboOYBcfFBTRgb1Ti6lvVxRrzV
	3FL7A6Clj2xv/jwsyyaelM+fUyb/2rWEl8kcmqpem9t4LQvWaMQ7i8P6WN6C5YdC2zU2
	9QnA==
X-Gm-Message-State: AMke39kIR4yX66aKDp9q/FrPxasUoE1CevBP3ngbdDlKAfaT2o2QY+ZYdujYBkI1ELoEWMCQ
X-Received: by 10.107.19.222 with SMTP id 91mr10253655iot.211.1489153435812;
	Fri, 10 Mar 2017 05:43:55 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DCF9.dip0.t-ipconnect.de. [93.232.220.249])
	by smtp.gmail.com with ESMTPSA id
	i189sm981032ita.23.2017.03.10.05.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 05:43:54 -0800 (PST)
Message-ID: <1489153432.7785.448.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 10 Mar 2017 14:43:52 +0100
In-Reply-To: <CAP9ODKoVRj+Fqx1W4U=Nr1RgFvQgbvwrzatBpv==PpTJX1P3NA@mail.gmail.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
	<20170306190728.GA19275@linux.intel.com>
	<CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
	<1489131232.7785.390.camel@intel.com>
	<CAP9ODKoVRj+Fqx1W4U=Nr1RgFvQgbvwrzatBpv==PpTJX1P3NA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Fri, 10 Mar 2017 13:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-10 at 10:32 -0300, Otavio Salvador wrote:
> On Fri, Mar 10, 2017 at 4:33 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Suppose IMAGE_FSTYPES = "ext4 wic", and the WKS_FILE has multiple
> > partitions and thus needs more entries in /etc/fstab than the
> > single-partition "ext4" - the result of do_rootfs simply cannot work for
> > both.
> 
> That is the point. If the machine requires to use multiple partitions
> the ext4 should have the /etc/fstab ready for use when deployed.

My thinking was a bit different. I had in mind a setup where the "ext4"
format as used by qemu has all files of the rootfs in a single
partition, whereas the wic image splits out the data into multiple
partitions (it recently gained such a feature).

This could be made to work if wic knew how to change fstab without
rewriting the root filesystem. But as that can't be done, such a
combination of different image formats is only possible for a rootfs
which always works with just a single partition.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




