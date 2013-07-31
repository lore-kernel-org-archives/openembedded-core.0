Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id B8B0461619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 16:07:36 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id d10so991879vea.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 09:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=tKg9Uc8xIyKfq0F/j2swW3ToZPUr+hKDk9aS58ZrjxY=;
	b=mv/SUqEDQOIGgRFhAOOkLUeFESo8iy4Gj3MuNmDX0YKbR3bwmoGFtwvh5i7CIbgF3v
	oZ5A/5BugYFn84TPG1pQ4yAvuWGhb2tlA9AgfNRUpjVrE9SqCehIDzkdOiGyZ3sIRYiu
	jRK9ZWdmP1ftoxp1hLRT1r6YVpjdzQnVKeaTd1KnLSB75qIyw48ff2qkcWli7nqgNqWq
	NqOO+tGNVttGFm6Yo0zjKKvjLR3pnP5W1uCrw34vQ5WNKlu+tKpf9f1DRtvhc/BFbl4M
	Gs2gv4JyRf6zRIZrpd3goT8vANdqLgnIRw+QfnjGJUQ957Tc2T2nR12U/s5yeuGctbxY
	T09w==
X-Received: by 10.52.163.46 with SMTP id yf14mr23953812vdb.58.1375286857198;
	Wed, 31 Jul 2013 09:07:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 09:07:16 -0700 (PDT)
In-Reply-To: <e63ad84faf8021c7d5b964e0c3c220b044fe8072.1375278766.git.ionutx.radu@intel.com>
References: <cover.1375278766.git.ionutx.radu@intel.com>
	<e63ad84faf8021c7d5b964e0c3c220b044fe8072.1375278766.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jul 2013 17:07:16 +0100
Message-ID: <CAJTo0LYUjDoK=kry8CHNMaorC7srzPaH_wz1of=GdgdbPjdb+w@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQmh2rgWc70MWoFRApSpzz6nLikjBBaFEM+xBjGNzK5h6mqkQK1FODgrbnO5VefyBPwzgJiu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] freetype: Upgrade from 2.4.12 to 2.5.0
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
X-List-Received-Date: Wed, 31 Jul 2013 16:07:37 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 14:58, Ionut Radu <ionutx.radu@intel.com> wrote:
>  .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}        |    9 +++------

There's a 2.5.0.1 which fixes an installation problem, please update
to that instead.

Ross

