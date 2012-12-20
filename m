Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlhP7-0003V8-F2
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 15:47:22 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 06:32:35 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so4897441qcs.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=fTCIgbRhQXRBRsj0ZiGoDJPLcIBbpmA8lvUUrRrnVaA=;
	b=JwWEnhQyp8eAX8UiRYiZbcEEA2byewMzMS8RPnrBuWDOKnFWrZXWlOPZh8MRr7Un3P
	m8CirZ3ObDttmBWZ24Npw8N92k0xb/fsqiblu5wA6d/WSLFfL3VkZ8cmOXNBswy6xTGb
	4CI/soRvX+7QsCj8Yw+o22IQdrT9a4NQxCNedHaXHTXZuYVW9Ls4fPd5wQ2IFmu782n9
	QXsdVVtGeE1KMO5VE22QjJBmpLglcvaEEA/cUkd7xTc3VB6lp0qAV/MZgu3I1rNbiFZ5
	hJFG2UuDsuKBSIBOTi4/B23WAem6hu1u1qaqEnlJKtDLvuix+L5X1jkuznXmYM3+pAYc
	+28A==
X-Received: by 10.58.221.130 with SMTP id qe2mr15293352vec.14.1356013953928;
	Thu, 20 Dec 2012 06:32:33 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr15293317vec.14.1356013953583;
	Thu, 20 Dec 2012 06:32:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 06:32:13 -0800 (PST)
In-Reply-To: <20121220131641.GI14543@jama.palm1.palmone.com>
References: <1356008353-12375-1-git-send-email-ross.burton@intel.com>
	<20121220131641.GI14543@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 14:32:13 +0000
Message-ID: <CAJTo0LYrj7ak-2FJmWHWPiequpNPx0UBxeow=cex_kFYUYY2mw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkTC1OlLBg7WGg+EtEv8dXKGvYLJIVbxtwrFS7wLbTBdCPs24fRGMtiTTbsxirGlztmRLG/KMA35FoKU3ozM7NSvtc1dfI+iSSw7B3IOgYtsI1l6xOYMnkzMzAJ8Cp3xY72ta+qnquDv18PfZIi5AEYn8XDXjF8in0AlBH8sPRivZCMVyN70R2hGkyPNoNqGHNT7COm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python: add -crypt as a dependency on -math
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
X-List-Received-Date: Thu, 20 Dec 2012 14:47:23 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 13:16, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 20, 2012 at 12:59:13PM +0000, Ross Burton wrote:
>> random.py imports hashlib, so add this missing dependency.
>
> Please follow warning in that file:
> # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
> # Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
> # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
>
> and change it in
> openembedded-core/scripts/contrib/python/generate-manifest-2.7.py
> first and then regenerate python-2.7-manifest.inc

Whoops, thanks, I just did a grep.

Ross


