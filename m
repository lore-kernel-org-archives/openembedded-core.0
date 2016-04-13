Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD0A607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 18:54:43 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so7603103vka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=d8SrxdKBjQaERmVwyTym9p+Ysh5jFyRD47oQ8uj4b+U=;
	b=CU0svD9FjOTNmkfiRLmNLXh0OpD5n+jUgA2X3HhhnrsBmoxs7x0400JJwKRv7GINsg
	hvy2L1XggE99hLmcT1HWLWPUkiaBxjgjqXP3GJBzi3UV26rlZ+Ma7Ko6s3MczFO3dyu6
	Sgeh36c7YUezB1iEWwP7W47xq4pArmaw7PQMrDdsUpzaCsZA1F60MtzhT8Lsmy3Oqqzz
	WzTO/mIQLuKSmt0qeI1nm8R/OYimFXjQw2NAuDDKRFVkZDM7oGqa7SLrELxLiE44Escj
	KTKPSz5XFDoCYwky7v5sJsVSOplXVUwMN7ISyfXPwY5ztenjLWuxL8aKNO/rdQWH8/yD
	wkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=d8SrxdKBjQaERmVwyTym9p+Ysh5jFyRD47oQ8uj4b+U=;
	b=iWk+XmM4BPtPqiJ+lMc+tYSxcQeybH28GyzH1B9cr266a0QbJkI8FUBpRP2Ka+e7DD
	paijuOwGv4fSFgIWiZ6qxVQZKNCHZtEEiCVuend7wZgZb4yyaw9PqfuL/AESpw7C1g0J
	wz8bNklvQpgfFr2BeKGyRbuj0ATSn5kKueeZoIbXVFJxdZQ9Lu3tqcB5dA6mZgueTa6L
	qcbFOG4mrguSpLM4Haf+LZ8xqloronsM8wrm5FA4LlvQcmk/pxXOSeTNU17AjMugjtGR
	0T4zeCNKPQHpq9b8PYl1bkzwAn6jaVzTriGaggyDIwbWM+IOv2DFB0wW1vsDCIGcOv9/
	CPxw==
X-Gm-Message-State: AOPr4FXWVaXkVjPJYmniIUA3InlJcPHxnCI2LvFs2lRQtPeAj9kS2tsNYYvMaBnHd4qzWTQML+jyeMWhi+tYlg==
MIME-Version: 1.0
X-Received: by 10.31.47.88 with SMTP id v85mr5510753vkv.118.1460573684247;
	Wed, 13 Apr 2016 11:54:44 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Wed, 13 Apr 2016 11:54:44 -0700 (PDT)
In-Reply-To: <1460569219.21923.2.camel@intel.com>
References: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
	<20160412165115.GY16135@denix.org>
	<CACS+7ZTTJOohmfe_iY3Y5Hc_FpLVh8Jvbpx9tdBAbifS4COWaQ@mail.gmail.com>
	<1460569219.21923.2.camel@intel.com>
Date: Wed, 13 Apr 2016 12:54:44 -0600
Message-ID: <CACS+7ZRrux05pcff6RbJfusm1a84PW188v68WJQEiNpbN_4LNA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Randle, William C" <william.c.randle@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: handle links in sorted order
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
X-List-Received-Date: Wed, 13 Apr 2016 18:54:44 -0000
Content-Type: text/plain; charset=UTF-8

On 13 April 2016 at 11:40, Randle, William C <william.c.randle@intel.com> wrote:
> On Wed, 2016-04-13 at 11:30 -0600, Dan McGregor wrote:
>
> On 12 April 2016 at 10:51, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Apr 12, 2016 at 08:22:21AM -0700, Bill Randle wrote:
>
> When processing links, the directories are processed in unsorted order
> which can result in cases like /var/lock -> /run/lock handled before
> /var/run -> /run throwing an error for /var/run because /run already exists.
> Change the link processing to ensure links are processed in sorted order of
> the destination.
>
>
> Seems to resolve the issue for me.
>
>
>
>
> For me it introduces a new issue. I use two perm files, the OE default
> one, and one that changes two links to real directories. The new
> packaging code complains that a link target exists as a directory,
> even though a subsequent rule sets it up as a directory.
>
> I think during parsing it should remove links as it finds directories
> with the same path, and remove directories with the same path in the
> order it sees them, that way when it does the in order processing it
> uses the last definition in the permissions table.
>
>
> Dan, can you provide an example permissions file that illustrates this?
> Preferably via the Bugzilla entry, or if not convenient, then here?
>
>

Yep, I just commented on the bug.

>
> [YOCTO #9430]
>
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
>
>
> Reported-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Denys Dmytriyenko <denys@ti.com>
>

