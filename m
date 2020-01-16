Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD9757F8A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 20:07:45 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id i1so20014468oie.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 12:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=jxiDyUZHjSEJNGczrm3KPVwu5yyFqtM6gAI8QtkOmXo=;
	b=a5JJPSOzBckZ+BOf28iPV7a1gv/Xt4mNkQ1/HDd7zIDt9W8foq0p25T28sDoa3z+BX
	jYXe48b+K8+dWcvOixseDbBY+h9JGt8+ApGDWxk3HtDdEv4h/eFgGAAHLfEZPvcCxPpF
	CJhg4r4hfIIOYtC0R5nUPTwOKe7y+QWX5P78I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jxiDyUZHjSEJNGczrm3KPVwu5yyFqtM6gAI8QtkOmXo=;
	b=VMaUtFMP3sXAvXKDI8d7LuyOSEYqscop+nQU8hHO9PefYEZp3aSea8jdeiHzdIupBB
	GhQRkHOeBobDxxMBUxMJa4Tv+7tiB4uZlbYAMeI19nBMZwjZ1BEl2K7GKbIl76JqUCeM
	SmFknQajna9TGKK3qkXte4K/XYqgd66sUBMgNbzhac4E1awK69LFlihVDAekowft43CQ
	DV94gd+JVSe9IdPMAEA810zkq8arTig3EXwEFRgLGBb3GZbDKLMf2gebMY55TG1RjAE2
	0E/VeDRXFHPAZ0BqQVsMZAW9mjC4gXDkscmnAprfB/RM2FqVT/mwxJC+Og//dKamOPa0
	5AMA==
X-Gm-Message-State: APjAAAVF+Jguj1d0PsDfyRUgGVAaecAnSXlOhuT7+HdgR6FvopXCBzkH
	J/y9pWwOJHe52HKop1kZ1C3z8ll/2ONWQ5PzDuGyhQ==
X-Google-Smtp-Source: APXvYqw8dUP/g7ZWQPph8uC5jIX7wo349q28baNBIJkqQvG7V8AQgiQ0Hi4vxbUiQ638QHV94C4ti4qWMeKDcscZiX8=
X-Received: by 2002:aca:d985:: with SMTP id q127mr653929oig.132.1579205266818; 
	Thu, 16 Jan 2020 12:07:46 -0800 (PST)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 16 Jan 2020 20:07:36 +0000
Message-ID: <CAM9ZRVv1O-vdWAtN=2GXjSz=sJ+LDGZYMKv0qiFzEa5Q3J9+Wg@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: patchtest licensing
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
X-List-Received-Date: Thu, 16 Jan 2020 20:07:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hey folks,

I've started looking through patchtest & patchtest-oe in detail and
spotted that all the scripts, support code and test cases are licensed
under GPLv2. Is that ok given that we plan to copy this into
openembedded-core (probably under meta/lib/oeqa)? Is there any
practical effect of this not being MIT licensed?

Thanks,
Paul

