Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UH1TM-0003uK-PI
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 01:29:12 +0100
Received: by mail-ve0-f176.google.com with SMTP id cz10so3479408veb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 17:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=UICe1guqegKbXDgBySEjPJ3El1+U8HdWt3H2rKRM7WY=;
	b=ZwsBcL3t6lPsbtthCO8voUxIVbGO61YN//oa2PGgDn8EaxDycB3gp8+tdXnTpKiJIL
	o0NLYoEcuBpuaZXJ60KwxGROjUXEXceN2mpO3xHtKJOgCylAKEWCS6j/sleUg+ym59k3
	AaFF3CmRjV/lQZoU4MVtn+SQSd5seoPsnxh2VKABWWcLt2vyEiTJR/n+ffE492IwqY+s
	u2rYvuuEHWZ8iMZjNl8DGw1K/KWh2ZZOrqNcFzcNpGs7p57SQ6XX/ubAp5P6ugX4uxuc
	MlzOfKinLnIwlHwZqQoCZneHzRIcmytU/mTvZoWgJ87ONzlYpEztONr3gP2Y6PtQLn/y
	94lw==
X-Received: by 10.52.155.5 with SMTP id vs5mr11520046vdb.24.1363479146634;
	Sat, 16 Mar 2013 17:12:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Sat, 16 Mar 2013 17:12:06 -0700 (PDT)
In-Reply-To: <5145098D.6080205@linux.intel.com>
References: <1363307422-24753-1-git-send-email-jslater@windriver.com>
	<1363307422-24753-2-git-send-email-jslater@windriver.com>
	<5145098D.6080205@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Mar 2013 17:12:06 -0700
Message-ID: <CAJTo0LZjHG5ZPRv3A4cov-xCyePJu57HLoHJA_Scv3yc9=wunA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQk4xxO+vIedsYmmLtDk7ob1YJuakT3xNLZhOVekXjJrcVLfLAAtDShTCuMsNGxHq7n74/x+
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] [v2]tzcode-native & tzdata: update to 2013b versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 00:29:13 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2013 17:08, Saul Wold <sgw@linux.intel.com> wrote:
> Please add a Signed-off-by: line, also please explain why the changes to
> do_install and do_postinst, what issue are you trying to address?

Those changes are bringing back code that were removed a month ago (by
Otavio, iirc).

Ross


