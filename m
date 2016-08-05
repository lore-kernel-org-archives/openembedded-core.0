Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDC377070
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 02:49:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so19347606pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=KwxzTI0itdVERszrk3Nmb9DZfUjF5VWesnW1rtK2uuI=;
	b=M2rZra5lAmtRfsq1NoqcqRu8CeOwzh8LrQ0os5m1ARFcgta98OoQwpRMHnuuR7lFSk
	jJygoUJKmVAx/P7CyjPwD5z7TpJuG7LDj/skpDAUZBwTXl9BsdUzMbOcvQwKqoQwBX0g
	Xnv86QQ3YeKOURiGyLkW0d//7x11L0iXkJxCQ4bDDqrFpqy41CNSXwqzutDmEDrhCTmS
	xIgwTL3k0a3hivXAsn03xCjmrDjYvaDeWorGtAiPRgZeVxbBHHG55/ReNsNcZL6OKFod
	S8p+JSgwQmnsAvq/QZgHwGLRTvvJq+wQPejVgu6JP8JEeCKtwkvNPOFHZJpm9CPMblhc
	NihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KwxzTI0itdVERszrk3Nmb9DZfUjF5VWesnW1rtK2uuI=;
	b=iqm//42NjW5xF8INbyyFJhmuSoBeWoqPrwnsodcx9UU7Drkt/AaBiSwiwr5ESmu1a+
	2LBIzMdZXoDaBN5AKRRoi64mEzHK0o0wcYypwkqDrb1Xs2V9eOjfpTb1/bzpQGLYJ6j5
	NnYenJGqyBToKHch3399zyc2XloClqV5txtqRA474pGLm3GNq61PjbrgrXdD+g54TdNt
	UR27Wcma3vCLInbVm3082rKg2sMmt+8Zx2GZaj+fJXEJsiOISV8tr0JbgacXnghLwjti
	RVM9dxycdFU65gbH6Xz8eJFpYu3UggIf95wv0NBxU2yLibxA+C1qYuS/qYGPXXOndnG8
	+6Sg==
X-Gm-Message-State: AEkoouv9/Cyeo9uriuwXmoSlbtqeiprlNSK2zRhboimPNlwWesMY15C8e2Di1VYfk28kEg==
X-Received: by 10.98.31.219 with SMTP id l88mr132010409pfj.155.1470365353641; 
	Thu, 04 Aug 2016 19:49:13 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4ce8:4a2:83d6:3a55])
	by smtp.gmail.com with ESMTPSA id
	184sm23364083pfg.20.2016.08.04.19.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 19:49:12 -0700 (PDT)
To: Brian Avery <avery.brian@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CAKV_0einF1siokeL5FFx2jLbwAk6xYSnb42fCZ75wpfQ3MbqRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b41fd09b-cb0e-8702-d789-27ab70d56787@gmail.com>
Date: Thu, 4 Aug 2016 19:49:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAKV_0einF1siokeL5FFx2jLbwAk6xYSnb42fCZ75wpfQ3MbqRw@mail.gmail.com>
Subject: Re: RFC: eclipse debug functionality issue
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
X-List-Received-Date: Fri, 05 Aug 2016 02:49:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 8/4/16 2:20 PM, Brian Avery wrote:
> The core issue:
> The busybox resize command breaks the eclipse ssh debug stream.  This is
> because the resize command for busybox sends a set of cursor control
> escape sequences to stderr. The resize cfg was added to Krogoth and is
> still in master.  The point of resize is to set the environment and
> terminal settings to the current xterm window size.
> 
> Additional complexity:
> eclipse-debug is an IMAGE_FEATURE.  If it is turned on by a user in
> local.conf via EXTRA_IMAGE_FEATURES then I can conditionally turn off
> busybox/resize in the cfg file.  Unfortunately, if a user makes a new
> image with IMAGE_FEATURES += " eclipse-debug " in it, I do not see this
> from the scope of the busybox##.bb recipe.
> 
> So, there are a couple of ways to solve this and I'm not sure which is
> the best one.
> 
> 1) conditionally turn off the resize.cfg if eclipse-debug is in
> extra-image-features.  Also, make a rm_resize.bbclass to rm the
> usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which can be
> inherited by the various sdk images we build.
> 
> This is problematic since if a user makes a new image recipe of their
> own and includes eclipse-debug but doesn't inherit the rm_resize.bbclass
> eclipse debug will fail.
> 
> 2) elevate eclipse-debug to a distro feature which would make it visible
> to the busybox###.bb recipe.  Unfortunately, it is really an image
> specific set of packages to be included so elevating it doesn't seem
> reasonable.
> 
> 3)   use the update-alternatives method (busybox is currently doing this
> for syslog) to make a separate busybox-resize package and make an
> eclipse friendly resize package that is empty and add the eclipse one to
> the eclipse-debug packagegroup.
> 
> 4) Just turn off resize or patch it so it doesn't try to control the
> cursor via escape sequences sent to stderr but still sets up the
> environment.  It's worth noting that the ubuntu  resize doesn't send
> escape sequences to any of the streams.

this seems to be best option.

> 
> 5) Something else?
> 
> Thanks,
> Brian
> an Intel employee
> 
>  
> 
> 

