Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DC64560249
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:50:51 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 9so89099180iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 10:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2DUFvUM8BRPgWXgXtKyoAEwS9QSYbChrX1FeF5e/puY=;
	b=Drju2O0lc6T6pqfk4BfFp/ZKQFHfmnOP5Tm3SI/F+TEXt8zfVL4/ce1xFrNdnLEbdk
	gVOKMi6tK0gS3TYAT+3I3WahU8Fgq4jiREZ+A9sR3RwwwO5lsVMzn+hnqueDY7ZGro8m
	0YgOTC4RrE8HLYAfb/jQocXcJ2R0Z+dRmrfW8BF5zWyPmW7mFGw5ywiX0tywGG2XJ9rD
	BP8yCFBILp7R7hwAKU5T+IluCZi0UZRv58CMqI6D+5cIi66T+mL/1UzMBI5yuoQuSoFt
	qBdCcGsZ7Ow1pZ1MnEZIUT4RQ9b6t7SFq/rjCYrwc34hGzDN2e2QXJDtugrFyVVbibeY
	V0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2DUFvUM8BRPgWXgXtKyoAEwS9QSYbChrX1FeF5e/puY=;
	b=lDoX0vf5m50799ImjDXQLQqsUaGSTveX0q+d6Aroft3BjBCTjcxdwDNzEVHipRe6e+
	ZVKoxlpwyNMOeRt18mMXyN2orU9TWcxfc2tSuwN86yv9FQilZh40t/vxItIN3nps93il
	mpBZTB994nrfZba+wuKgDc2FKp4IWI4CWqdfsGLuE97n/vh2bjlCL1TWhID11Jih8x3B
	wVM4VD/uywhVruWvQEdG6YyrQGyj98Xk9PrduK4NnU0pZYWbr5AoGFqBQIo+yMaWQqhw
	ejPJRva0J8sG1T6rKHv4ahv3ERmZyPrmCMs0WKiPUg7vGWFeMinxJYDKs8lUUWuZ/iQN
	K66w==
X-Gm-Message-State: AG10YOSeoyUuAhNtom8ToQwCWxZ7Ou39kLKZed4CeqDH/aWPSR1EjHf8HWZoGO9yf0PI7+tKPQaTOy89p4vouA==
X-Received: by 10.107.9.211 with SMTP id 80mr17851747ioj.112.1454352652173;
	Mon, 01 Feb 2016 10:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 10:50:22 -0800 (PST)
In-Reply-To: <CAJTo0LYmqnOfCQPUd26Jo0qn8MHOy=iDJQzYD0-ZH+NHx+kBQQ@mail.gmail.com>
References: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
	<CAJTo0Lb3ZpOqC4Hik_cNh7PZqCF7-=EvosN82HWfpw6TKLNuig@mail.gmail.com>
	<CAJTo0LYmqnOfCQPUd26Jo0qn8MHOy=iDJQzYD0-ZH+NHx+kBQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 10:50:22 -0800
Message-ID: <CAMKF1sozknq8vz-K3U0g-0oH+=d+x2T0KdiwKjWR2_3vP0s_vA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adam Chappell <adam.chappell@ni.com>,
	Jacob Champion <jacob.champion@ni.com>
Subject: Re: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Mon, 01 Feb 2016 18:50:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 5:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 29 January 2016 at 21:21, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> And for even more fun the resulting package doesn't actually depend on
>> libssl, due to the layout confusing the shlibs code in package.bbclass.
>
>
> Sigh.  Clearly I need a break.  Inserted a load of debugging and then the
> obvious jumped out at me.
>
> Using oe-pkg-data to see what files are in what packages:
>
> apr-util:
>         /usr/lib/libaprutil-1.so.0
>         /usr/lib/libaprutil-1.so.0.5.4
> ...
> apr-util-dev:
> ...
>         /usr/lib/apr-util-1/apr_crypto_openssl-1.so
>         /usr/lib/apr-util-1/apr_crypto_openssl.so
>         /usr/lib/apr-util-1/apr_dbm_gdbm-1.so
>         /usr/lib/apr-util-1/apr_dbm_gdbm.so
>
> Those .so files are not development links, but library modules.  They should
> be packaged into FILES_$PN, and no mention of apr-util-1 in FILES_PN-dev.

I wonder if we should have a QA check to decipher that if .so is a not
a symlink then provide this
as an error right away until the recipe takes care of it with
FILES_SOLIBS or something like that

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

