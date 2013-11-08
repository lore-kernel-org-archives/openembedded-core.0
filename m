Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id E2BE66D3E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 09:25:34 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id w20so1206791vbb.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 01:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D6UtVgwITAXxc+nZcgItA44Q+2KA65z7p4bja22AwWM=;
	b=JnXY/bielzDG+I5KJ9x8y1lR5quGkgYLtZP6ldb+Mkm8eqv+i9gRYfqlEj5C6brzrx
	MslmJCuDh6vcEGV53vpCvpZIRoVkhEMcMKLAlznbZ5XsdN/MfkXl5ofIhf24mxjYpjZA
	khkCSjI40ymqkmoJv2KCRdUfymHwNksPXGadzwKVIpxlxkjojS1QTGNsNBRZ15phdKyh
	SPTqS3yNKGKQetYZ7bfz2cTr8vZZItYkY28LZra/9N8/gjrlrmOa7sSND2HstfJ7l13o
	LrR2Zjx6q0N6VF/CrJLmMkxEhSLZ++LusblBq+b7uP/UbrCEEF3TzWvTrP3wbIJufO0d
	HMzw==
X-Gm-Message-State: ALoCoQm/yRzDvo0hbLAhPhve+x0iGZeUSVxlWOp8xt9oKjRoYdgG84gMTUgjuj8+Y2sDoEkmtxtE
X-Received: by 10.220.174.200 with SMTP id u8mr11118586vcz.6.1383902735084;
	Fri, 08 Nov 2013 01:25:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 01:25:15 -0800 (PST)
In-Reply-To: <1383866326.6271.286.camel@ted>
References: <1383866326.6271.286.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 09:25:15 +0000
Message-ID: <CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 09:25:35 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 23:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +DISTRO ??= "nodistro"

Wouldn't "oe-core" be a better name, considering that's what
DISTROVERSION becomes if DISTRO is unset?

Ross

