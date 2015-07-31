Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56AD276504
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:09:48 +0000 (UTC)
Received: by qgeh16 with SMTP id h16so42676109qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 04:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sCR5n2ej0XUU4KEY0He83DSZwQV7NYGjNv9ApqHdyuI=;
	b=BQ3O9c8LflMdP6kVkackR/hHbffJ9LdMCPaQ0Wb94Q4MGJAiTnMhHYQhV7fCm8dmaX
	TfvqhLoMeQCDBhDv2265+y7H5Zr97J8j5kcsKbCtEyp7nuYYvHa+hsVRRLVn9CZdvRwl
	i5bkpnspdZ5iAS/5D3c6qfJGL9F7+Tcr3s8K+bg8dePFbhTYUhub2mvEbrYW335e9VA8
	QRS8gEIS1mkceIegvom3toYXNHKbUekBaEdiAp+07VuasoQQAuDbR+aYfLJOjqWuh2FJ
	wm+E+6wXENdSG2iIRYYAngjFXRF2Z26L4DRwndhTNjJXuNbCWuvjAAtmMCp/4ZrOFlu2
	LqEw==
X-Gm-Message-State: ALoCoQmYWWImCDCltiMZuJHJHqTk5Q1ca+dKPbKhZisDwfKDextwMUVBnw3OqYAMJlP2MGoMF/X8
X-Received: by 10.140.109.199 with SMTP id l65mr3019390qgf.91.1438340988460;
	Fri, 31 Jul 2015 04:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.8 with HTTP; Fri, 31 Jul 2015 04:09:29 -0700 (PDT)
In-Reply-To: <2950215.CmNeN3gmTU@peggleto-mobl.ger.corp.intel.com>
References: <55BB1C0F.90508@windriver.com>
	<2950215.CmNeN3gmTU@peggleto-mobl.ger.corp.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jul 2015 13:09:29 +0200
Message-ID: <CAP71Wjwh7VZJubtjL0oy4CmzKFh3p9+7c9v92we06U6KE5YfZQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Jul 2015 11:09:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 31, 2015 at 12:46 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>> I think that we should not remove any pkgs by default, we can add some
>> interfaces/ways to let the user decide whether to remove them or any
>> other pkgs, for example, add a REMOVE_PACKAGS variable, leave it as NULL
>> or only add run-postinsts to it by default.
>
> There is a reason for these not to be there by default when you don't have
> runtime package management - the assumption is you won't be adding or removing
> any users, thus the binaries that those packages install aren't needed.


I am not sure to understand the relationship between runtime package
management, and adding/removing users? Why would no runtime package
management, imply no need to add/remove users?

nico

