Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id D210265F89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 08:53:34 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i17so8281563qcy.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 01:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=w6sTw0KDvVS3KujbrQJSBg89d3J45Ac3vASd3/UvvgM=;
	b=QIKFvLfgYmycrPf033JCyvgN4VgZvjwDv5IjL6vDN9RQY6hce5p1v8rvfxZTijqxQI
	HTmd+VK3rEEbPtxZioNd4lW+0K/IS1OavJI/hG9dE47UQU2oA5iOl/avNoPm84lnA3tH
	fSsXq95woMZ8XpmkLdgowWFC2hnMgQYgxvEzXV/T/CjPS8kkUFNn1neoNkvWfF7Jj8GL
	Ixcsv59RiYBZAjlO2VMYURffi/A+pOAbPoXjAna4llT37CZxELQhWjC1qMF6A8o1E//o
	LxFKVfjHWvpKog0ykuPALUMrz3+5zYJhafGY8zHRI2aEfKgDcXj/pe6iUO2uhZmV3jz0
	UArw==
X-Gm-Message-State: ALoCoQkZa3v7m1TQzbJp1XM1vysAZ1CXBL6BA/hDmQNaYNG6qof9Y/QZtE/qlpqkiDi9CcKjuN2m
X-Received: by 10.224.160.142 with SMTP id n14mr53681996qax.17.1399366415079; 
	Tue, 06 May 2014 01:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 6 May 2014 01:53:14 -0700 (PDT)
In-Reply-To: <5366DC9E.1020702@ti.com>
References: <5366A8B5.6020900@ti.com>
	<CAOjnSCb-Fkxs3J_5eycnQ6gpRaoJpbsdP6H9+UVEHRm6kwbd8g@mail.gmail.com>
	<5366DC9E.1020702@ti.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 May 2014 09:53:14 +0100
Message-ID: <CAJTo0LarnY3ZHU-3OHTi0nv-dvJCWdeG6kTMtcL1NkYVsOdX5w@mail.gmail.com>
To: Joel Fernandes <joelf@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Quick question about OE-core/bitbake's re-building
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
X-List-Received-Date: Tue, 06 May 2014 08:53:37 -0000
Content-Type: text/plain; charset=UTF-8

On 5 May 2014 01:34, Joel Fernandes <joelf@ti.com> wrote:
> However one thing, is the updates don't happen if you revert the changes
> back to what it used to be in an earlier revision.
>
> For example if I make changes such that task hash is now X
> Then I build, and its called r0.0.
> Then I make some more changes such that the hash is now Y
> And it becomes r0.1.
>
> Then after some more changes, it becomes X. Now instead of rebuilding
> and calling it r0.2, the rebuild doesn't happen. I wonder if this is the
> right thing, or the updates should continue to roll.

So the hash that Joel refers to is used as a key in the "sstate
cache", and the build packages are cached in there.  When you revert
the package back to X instead of having to do a rebuild, it can simply
extract the relevant file from the cache.

(you can verify this by reading the cooker log of the build)

Ross

