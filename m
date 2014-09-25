Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 293BE60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 10:50:10 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id w7so1913299qcr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 03:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pZmEKB6rtEGCMSaepOUv4PdwcEF3IXB15J3/y+omJvM=;
	b=aE1eHN2z58Xsr04/0LLdKAaSRFAsqKcSS0Si1anfJ7XFyZ4WWc8C/VtNvZUp100kSp
	mm18DjVAaJmZR6LXZBN92Fo2hHiYWZSUiF4IhZvRWeO/IT7BY9AwKNauTzkbADbKPYpG
	B5UonkU6ZwuHpQZnRtDu3EC3hCzT/B2IDTKPKkXEmmz+4F+MsEJePScQ1ypfPl+kY5Lb
	CDsgiAX97SArbCyuv7W6L1enLuEewVJT+mTA9ghvCg/UnIQqZCYZ4xRHbC7PJul21Xmv
	ePCpFaxI2ftj+sImss+LoSs9ilaMR18QqZbRgOEHP6z5nzCBw12inuJfFgZPEAK7ttOq
	oylw==
X-Gm-Message-State: ALoCoQmvSR1QIzh0y7LB/9wdn62+ZjhNi/maJ+6mhkVj2UL4rCApxvTbhCS/s6GVhjRn5+iUykOB
X-Received: by 10.224.121.80 with SMTP id g16mr12336264qar.64.1411642211605;
	Thu, 25 Sep 2014 03:50:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 03:49:51 -0700 (PDT)
In-Reply-To: <54229DB5.90806@pabigot.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<54229DB5.90806@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 11:49:51 +0100
Message-ID: <CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 10:50:13 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 11:32, Peter A. Bigot <pab@pabigot.com> wrote:
> Ping for this one too (it re-opened Yocto #3780 and has 1.7 as a due date).
>
> That's all I expect to have for 1.7, unless u-boot 2014.07 gets in (there's
> a patch needed for BBB in that case, but it's already in meta-ti's version).

This produces errors for nativesdk builds:

ERROR: QA Issue: nativesdk-git: Files/directories were installed but not shipped
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Error.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/perllocal.pod
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto/Git
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto/Git/.packlist
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/IndexInfo.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/I18N.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/GlobSpec.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Ra.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Log.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Prompt.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Utils.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Fetcher.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Editor.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Migration.pm
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Memoize
  /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Memoize/YAML.pm
[installed-vs-shipped]

Ross

