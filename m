Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 315C973D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 12:01:21 +0000 (UTC)
Received: by qgeh16 with SMTP id h16so43455019qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SEkgwLLxdL4Xf1QDtcJyjg0y6TR/Vy/TZjCDgL4DJWU=;
	b=UFpcVRqCQ7+WqUR0Bjl2xEwQ8rIUaOjE86KOGQsqNq84tUjcdqYWbjbRJESCqoPWyO
	t1gPFbnlV80BroWnxGkqnA5rPNhIC/SBrTOHPxcrqGT412kLQa3hTsbtXHYNt5eSWe87
	mcFwxAirqPsbi3QOaSDhuzKldyy4lghFa4thcrCzvQl3Z3CHqKH5qnRGwLDhNC/P1S92
	DXSIWUyHiqt5cmmSNd/VrRGdr/3xg9URHhWI1OsBTzP6o15opnlB5llgrpH7W//2wQ07
	AKdvoJ/n+LlcI5ghSwSmgNldXhJcMPHKaxdeNbjEF+OeyIHKBQ2g9YdCaq85I9/n1wh1
	h5sQ==
X-Gm-Message-State: ALoCoQk/C2TfHPL6NS0iv648h0LllgZDEygllhzlmKEjmSHA1VgoGXI98/hAQwaPHu1saxsvGFII
X-Received: by 10.141.28.200 with SMTP id f191mr3666051qhe.52.1438344081251;
	Fri, 31 Jul 2015 05:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.8 with HTTP; Fri, 31 Jul 2015 05:01:01 -0700 (PDT)
In-Reply-To: <1923146.uIJODXP6Gm@peggleto-mobl.ger.corp.intel.com>
References: <55BB1C0F.90508@windriver.com>
	<2950215.CmNeN3gmTU@peggleto-mobl.ger.corp.intel.com>
	<CAP71Wjwh7VZJubtjL0oy4CmzKFh3p9+7c9v92we06U6KE5YfZQ@mail.gmail.com>
	<1923146.uIJODXP6Gm@peggleto-mobl.ger.corp.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jul 2015 14:01:01 +0200
Message-ID: <CAP71WjzRNtGutTGyz_vm7S8R5+2vUwMzefArwvqnuWia-R+d_g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta/lib/oe/rootfs.py: dont' remove any packages by default
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
X-List-Received-Date: Fri, 31 Jul 2015 12:01:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 31, 2015 at 1:12 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>> I am not sure to understand the relationship between runtime package
>> management, and adding/removing users? Why would no runtime package
>> management, imply no need to add/remove users?
>
> I guess the underlying assumption is that if you have no package manager, in a
> typical embedded context (if there is such a thing) that implies you won't be
> changing the system after setup.

well, that still sounds like 2 separate 'features'.. i think it might
be a good idea to split them out...

