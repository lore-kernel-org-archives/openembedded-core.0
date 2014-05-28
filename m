Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (unknown [209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2336ABDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 10:40:32 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so17209612qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 03:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k2gVjfT8eeAqKoGl3IL737xv0pWfJ99Y//ZlZWLg1gw=;
	b=do8nCkgREh7cSWFtjEx0GMnRySl3NUb6MC5dSVdhIEmPs0xM+Zva11DCFbVcYmV/6h
	kRFHn+E/YrGxoykBQ+BdouC6bpoif+nV+Gy5YtACrNw3gxfzTBOQwBtuFZlV6rk2iwwA
	63wGnfZMn3v+qC8DJJnf6Ivp/H9hRAV9NakeE3yyiWC/ViCtOeeVwYjrDOT7LwzlJ4Kf
	5St4rSNz/QWjb4PABng/Y3NAX7H4EA//oihL35fwkjtsRY80gCOxG0WPMjP1u/6rSZQk
	p8g6zdzGSt0Sn0b6CY7hp8wTB8keVZyEGt0p0SVzPUCVQrTz4b/+HOe4QTWJorX4TEop
	+iAA==
X-Gm-Message-State: ALoCoQk80RBrLaNyueQOJ14bn1wykDmvqNj8kiYiNShWXo9jxEKb7wwlL/JlHSKs1mdIxpVNYtPI
X-Received: by 10.140.91.161 with SMTP id z30mr49139927qgd.65.1401273633688;
	Wed, 28 May 2014 03:40:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 28 May 2014 03:40:13 -0700 (PDT)
In-Reply-To: <1401138331-31087-1-git-send-email-akuster@mvista.com>
References: <1401138331-31087-1-git-send-email-akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 May 2014 11:40:13 +0100
Message-ID: <CAJTo0LaB94-s02ng6CXdFNLGYEasN4chZFdJXEaWnpMZ2nsWEA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 10:40:33 -0000
Content-Type: text/plain; charset=UTF-8

On 26 May 2014 22:05, Armin Kuster <akuster808@gmail.com> wrote:
> This updates both tzcode and tzdate to latest

Please send patches using -M so they're easier to review.  Also you
put "solaris" instead of "solar" in the commit message.

Ross

