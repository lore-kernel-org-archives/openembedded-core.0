Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsb3b-0002G1-Gk
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:25:50 +0100
Received: from mail-yh0-f70.google.com ([209.85.213.70])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 07:10:27 -0800
Received: by mail-yh0-f70.google.com with SMTP id f73so1060048yha.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 07:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=w3uifyutZ7ILnLnMvglblizp8Mn/UH5rOxEsSqZSciI=;
	b=UPW37D6RsCBDBLMOgvSi5/4R61pZfvg5Xc5lLM8t/PU3OS+exljBYZbxvt/CCTzyMM
	cEN28ligc/lrkgP1xqwrR2GzVtdZ0OFlq3dKqsmcV5bbXgPd0bsIVmeAe4DzzhJB7aqz
	ONgj5CRkFZNkI4/xn8mIMAIl05775D2eODrGPPMwFLBLYKPRKBhLaiYR6Nd82v3qa5Sa
	b+LRhCLUHRisOwl/0EoQCTSNUuvTiyrLjBxeAJV4nYXh1XF9Kjh0YTo58aZQq+Mr1btY
	VK4xtWLYiB9hyFNAguA2AdSdbeSp2nWDiBFllANQbKEdzhJobQKVYsx04eIsZGfhLOhI
	mNDQ==
X-Received: by 10.52.17.70 with SMTP id m6mr75672334vdd.92.1357657826054;
	Tue, 08 Jan 2013 07:10:26 -0800 (PST)
Received: by 10.52.17.70 with SMTP id m6mr75672324vdd.92.1357657825983; Tue,
	08 Jan 2013 07:10:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 07:10:05 -0800 (PST)
In-Reply-To: <50EC3725.2060604@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
	<CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
	<50EC3725.2060604@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 15:10:05 +0000
Message-ID: <CAJTo0LYSY-Ucbthhr0UObuugMBdxKj_3NbC5y1FFPf=GBQ+PfQ@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQneIjH6ivW72KvDQLI8craHYiRtJtRJTFHrySEd/ayAqTZQ6SIRH9A+wtb5UqXwtkuAtYY1ZCz4MscIUgYgFUxhQKHPjBxSIIaGFJehxOeQRyEQiz+8oZiw3VDkyl3u3jxlwhYWvwOI1rdScY7j0WpllynjU4JNj/0CHj+Y1jDbN85IiagWlN9AexjSYr1a/uE9lM9u
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Tue, 08 Jan 2013 15:25:53 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2013 15:11, Radu Moisan <radu.moisan@intel.com> wrote:
> No question about that, the question was whether to add Sign-off-by from the
> author itself. I know that we are doing it like that right now, but I don't
> understand it's reasoning. Being the author of a patch what would be the
> point in adding a Sign-off-by with the same name? I can agree either way, no
> question about that, just want it to get it clear why we do it like we do
> it.

It's usual to sign-off your own patches, but in this case where
people's conributions are being remixed, merged and so on, they didn't
strictly speaking sign-off on the actual commit.

Ross


