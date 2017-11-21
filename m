Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9125178623
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:52:27 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id v123so8422385oif.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 04:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=bJSkj0fWuFePe5cmaLkEqVpFpDa7tENznVK3jy/Wz6s=;
	b=fmuhiVC9Z5or2nVd02VYXjukC+x3rACvCNoLkv3KQXfBHZi0LJjRFxyemfsVsLDwkC
	cfe4oSihorRBKBYBYaL108yON2iqx1yKOo04BPOsRccbw0GNC4Y6w7X20SZvM3Pf76Gg
	9+9ZSkUcjvbZ89xY03zfv1pqCQ6ZdkcG8YIx5RQ2fmsKdriUQxnEUHvx+OL/XjRpQCJh
	5AFOwVP8vKxkRRJi+6l2KdWiaLFPoNiNxS9C7/Mi3RBMKehZBtNqNKxm6vz7rYVbaVfw
	bLYNsoQg8Zp+eRrZp6jqogtEqUb6puC/T6FTWHNnrwFzKTB4q4HVOPTI7L5XCVYEroS6
	8zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=bJSkj0fWuFePe5cmaLkEqVpFpDa7tENznVK3jy/Wz6s=;
	b=TurnVNEJjsRn8Jj8NwpxBmzz6lYIN+F/Pj67ulnkAK/1AG7aTVGEk5POE4M/c1wkaH
	le4/ffq4C41fl8yF8G7bm6KVnu0QYRP5fDLsI0moIEIyBJSrVEmijryIDYTdhHfpGv3W
	JmQwmCWbF4+D/PzBQOr9hY+/X0XjXE6/ScjQPA3pc54CVWZXIRChbH+InMmL1c1G4IkA
	70LBNRFiw+Gi84MRmvcfd9wVrP9AY+XtR1hyCgWoQGPPf7h2Sep7Trl5EXgFqvHBI5Do
	V0l55n39DUaoI3Os34Gc/eBCno23XmXD3eKbSg8/BRhqmQ6Omxr2a+w3tLOFENOZysMl
	DXfw==
X-Gm-Message-State: AJaThX6L91LkbAZ1mM74JVO3pn014gIhsFL/ufCH2IcvaQ0a6sp0Lv4h
	xk/KyAgYRPJELP4qwSFhfndrropl
X-Google-Smtp-Source: AGs4zMYuz86PqPUxuPIRTNX7+vMNAUdY3h8p3zPBro8CjT1k6NfjLgPv68TixQo5em1ReNa6MvGEnw==
X-Received: by 10.202.214.203 with SMTP id n194mr1133146oig.195.1511268748016; 
	Tue, 21 Nov 2017 04:52:28 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176]) by smtp.gmail.com with ESMTPSA id
	x127sm5419743oix.8.2017.11.21.04.52.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 04:52:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id v15so10412828ote.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 04:52:26 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr10034174oth.370.1511268746408;
	Tue, 21 Nov 2017 04:52:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 21 Nov 2017 04:52:25 -0800 (PST)
In-Reply-To: <1511266891.5979.56.camel@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
	<1511251487.5979.54.camel@intel.com>
	<CAP9ODKqxbnkpimHmdoYEax6Njmxfcf9KVJazzvpgn=QzRWPc4w@mail.gmail.com>
	<1511266891.5979.56.camel@intel.com>
Date: Tue, 21 Nov 2017 10:52:25 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo154yFY92zAmkGo5o5w0rLbc7-9xEg-sBXQJz6iYLwzw@mail.gmail.com>
Message-ID: <CAP9ODKo154yFY92zAmkGo5o5w0rLbc7-9xEg-sBXQJz6iYLwzw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: native CA cert bundles (was: Re: [PATCH 3/3] cve-check-tool: Use CA cert bundle in correct sysroot)
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
X-List-Received-Date: Tue, 21 Nov 2017 12:52:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 10:21 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Tue, 2017-11-21 at 10:06 -0200, Otavio Salvador wrote:
>> On Tue, Nov 21, 2017 at 6:04 AM, Patrick Ohly <patrick.ohly@intel.com
>> > wrote:
>> > On Thu, 2017-02-09 at 21:38 +0200, Jussi Kukkonen wrote:
>> > There is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9883
>> > open
>> > about some aspect of this, but it doesn't actually address the
>> > underlying question about what the right behavior should be. It's
>> > based
>> > on the assumption that libcurl-native should always use ca-
>> > certificates-native.
>> >
>> > Thoughts anyone?
>>
>> I agree it should use ca-certificates-native for all native; it
>> allows for self-signed internal certificates to be added for internal
>> development.
>
> But that's not what bitbake itself uses. Are you saying that bitbake
> fetchers etc. should also use whatever certificates are configured for
> ca-certificates-native? That leads to a chicken-and-egg problem.
>
> A solution where custom certificates need to be configured in two
> different places (system for bitbake, ca-certificates-native for some
> other tools) sounds sub-optimal to me.

I know and we could override it to a place.

We ended doing it ourselves:
https://github.com/updatehub/meta-updatehub/commit/e9c34faddb6a59d560147798b37ac6a0e3fa57bf

but this is not generic.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

