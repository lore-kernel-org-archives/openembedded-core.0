Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 83A3F6F8DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:13:59 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so7446487qcx.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 04:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=98aZj7NwneLLZYCygaO80BtPmHQnwNMiX7xnug/7N1w=;
	b=GrAvwtLv0xChzTVKnV//V5PW51GAWtwaBOIT2/S2L9A282lemIJ6Ae183NxiWqxGtV
	oETEBDhKYfTyKVfF714vrkcvDq/UyfNHY9sWaGfnNVShT1aASUwVONEIJINKbE11Q7KR
	qXic6gU8v5bGfmrGQUHzs6qkM0P2qI216OSnUp6mh+xVrEAyhBqYUtGqPivORVN2Nszt
	Y9971blvSvzGwT5sv6ZVEoQD2IC/W4RRjkwB9UwgxupncFy5ScS1pxN3fCxSf+VeA5D2
	nUffsLrnU48CFfVWB8dOjifR7DCMIdxpaS2wa3z0JnxiQaTYL07/eaQqaUspR3/jurWh
	dZ9g==
X-Gm-Message-State: ALoCoQnfDsh59KQizL6XpoRoT4IJ8YarBdTXhqamVN5ibREwt6C7OkrfZyPys977+CBeHQsRwKgk
X-Received: by 10.140.81.74 with SMTP id e68mr1749242qgd.99.1395141240859;
	Tue, 18 Mar 2014 04:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 18 Mar 2014 04:13:40 -0700 (PDT)
In-Reply-To: <4fe38ebdc644fa0880bd83bcf3325fd34070a73e.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<4fe38ebdc644fa0880bd83bcf3325fd34070a73e.1394948105.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Mar 2014 11:13:40 +0000
Message-ID: <CAJTo0La2Xtib5BrN3hpZbKZdXT8zqGdObQ1kjXni2MYM1Ly+UQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] glib-2.0: Fix localedir expectations for uclibc
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
X-List-Received-Date: Tue, 18 Mar 2014 11:14:02 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2014 05:42, Khem Raj <raj.khem@gmail.com> wrote:
> ++          *-*-openbsd* | *-*-linux-uclibc*)

Does uclibc have the same file naming as bsd?  eglibc uses .gmo.

Ross

