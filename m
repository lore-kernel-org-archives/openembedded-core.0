Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 31D2B6F7DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 10:36:58 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id w8so9619043qac.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 03:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5YSfUETMq4rnXVno1dPD1lVt5CQ8dWw3lG895zWwuKg=;
	b=Jc9HrXhinEFSGJhbuUOux6ZiQY50NlVIfyWyQg8iTgQAMDUkYwu04fRlDqFgm+YeZJ
	mM8SvacZJBPglrlzhC18o8vJ4K59WezVsc/wxXlnFI/kAqqxbiG4A1VYQcDUqB3fljoe
	CH3YO09EcXhltDu6wfUdgKENKUveW79LPFmRo5InJC8HX8EAqpgAEUBPsj/xBCAZ4kB/
	qYaYX3QpBREbm6jXaLbJ+u1B76JBPgMpgalfmIixnv3Zj5LYF62gQUx6tgSClI76eQvQ
	3aLdzeYbZUGbMYeQAtyBZfXQSQaiMy1LGEK14CGOGnhvhZYC2jqkoGbaE0Kt3JZlkJUw
	r5Hw==
X-Gm-Message-State: ALoCoQndO/5loSx0un2wVIrTINi5yP4SsBhFFUIiN+BdMDVdT+alGC05NSpccQJ6E124UOCLiXYy
X-Received: by 10.140.81.74 with SMTP id e68mr1117958qgd.99.1394620618973;
	Wed, 12 Mar 2014 03:36:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 03:36:38 -0700 (PDT)
In-Reply-To: <1394613382-28992-4-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
	<1394613382-28992-4-git-send-email-alexandrux.palalau@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 10:36:38 +0000
Message-ID: <CAJTo0LbucMbdpEFFLN59jcYxJkr5STTe5_w2fpyYO4kTs9Heaw@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] gnome-mime-data: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 10:36:59 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2014 08:36, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
> +inherit gnomebase gtk-icon-cache mime

Should just need gnomebase and mime.

Ross

