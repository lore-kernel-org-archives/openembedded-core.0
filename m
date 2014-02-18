Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 678466EE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:52:13 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id m12so7584150iga.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=av1RIn5csmgGKEi9Kykfn8GfFZvgMZs3i92pbLA1S8s=;
	b=qNqD8hUVkr5soUpY1CyLlS6KCwqa0VL83Fzt5QK6tCF7wMawt83d3BLe03LJHi6e2K
	R/hvq72JuhcIOJE/avWR6f5mDp0a29dB2jSA7N+iLzUp8NEcOE71d8srHmJXNmkc66Dz
	LfOSgKm9AVeB+5+/7MPVTxSObXwao0ljwY0C5VDgpehk4P/B1xJt8yOTIKvamRr+uID/
	shg3Mr2S9PND6R36RAWCr3HatM95V3sHvOWf462nh7/l+8wsEdOlwzy2AI/U1FAJLw9k
	olQ+XSN4w5PSIJmwSdORMrBJoCkM5E3t4KvORiItFTiTTMKupQtnZSPn7hU7Mje5fTZZ
	hsiw==
X-Received: by 10.50.60.103 with SMTP id g7mr23367263igr.20.1392745934563;
	Tue, 18 Feb 2014 09:52:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 09:51:44 -0800 (PST)
In-Reply-To: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
References: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 09:51:44 -0800
Message-ID: <CAMKF1srUcG1euTY2kzKroG5k5h7R-nUd7aFhqk2dVvcu-k8BrA@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 18 Feb 2014 17:52:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 9:49 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
> and meta-toolchain-qte respectively.
> Whitout this static library, compiling qt apps which needs uitools will fail.

can you also figure out what is the licensing terms of these static .a
archives please ?
and make a note of it in commit message or somewhere

