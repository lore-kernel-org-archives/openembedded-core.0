Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85BC77FE71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 04:16:12 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r14so5954830lfm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pZq+Q+enCKsk61ijmEpZDVQUfOxzOijPsL37aaFOzEI=;
	b=j0TKfLo2d7vII+XH6X9w8v9o3X8P2rOdYZuX22I3X9/9cErJzC21GKY6jR0qa4ktaN
	xEfmtXVxSErMWCzVG9WGoIRO5LFH3is/aetFnaW9Ul3MUbyO7g5XbK7mOX9mQ/3C8Wys
	m+f/Ump87JzLy0GtRxfnTkxWgP7X216ai/oLABZmOtAzVGg4kQVtGGIRZ4qez8OsdTL6
	z9wqw0IBz6n23xixhNz0vlwoDQ5gJkKBfP2B1xgeuRa0AR5Wl1dk/hle40CwfEaBGR+H
	5EsBu//ohj6RiF0wbBTXT5669MybmMPrdnAc7ZnfnrXvBJ92U4f/Kz4XipDjrnk3CSmj
	Y64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pZq+Q+enCKsk61ijmEpZDVQUfOxzOijPsL37aaFOzEI=;
	b=AaHKYrWdoX5n+t1pFRMhGo604cW5B8d7scvW6BXEHLNXz2kkd/in9uQjNI+ZaZLr/q
	i5nbQcJ8MjTmn1FACSdis8oh+mkfJIcts4XBT4RMg+6Hi9+DHSZroBXdP5thWmTGPS78
	TCvnPb6sBRKfXgqE5am+5x1vSP1g6p4Jpi2AVPHwUeSeHc/BIoyh6QAI7fc1YS2ZPlLh
	mUAXbyU6544ebiu/vgdUI0EmJW5yr5LGqFPsvwEc7EW6B/KN3mo0uo6QpOCiHQiiAHbB
	nMTNEELOcgYBH5iudjRDz3WM1U349BWuxVkixiabBEBQeUNJHoOt5M2sQZZscOVWWbO+
	WAUg==
X-Gm-Message-State: APjAAAVHlj5kQhJdeg55ZWeyxw0Lw7fmr3piQ/5LmiE1fGajPwjBYCV1
	mXGT8sAesQqptLaKx7g7791+pGub66v29RbxSsk=
X-Google-Smtp-Source: APXvYqz+0ysC8FXzR+6ISy2R9NIr6nf1fQYq2+RrC8q/6G1n47MdYPX2JYUDJxeRUHlurUBaNqE6JFWp+T9b323Z1yA=
X-Received: by 2002:a19:2389:: with SMTP id j131mr7286024lfj.86.1576815373092; 
	Thu, 19 Dec 2019 20:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20191219051543.20185-1-alistair@alistair23.me>
	<20191219051543.20185-2-alistair@alistair23.me>
	<42acb127-07f7-8457-2f20-d8ce4c82e264@intel.com>
In-Reply-To: <42acb127-07f7-8457-2f20-d8ce4c82e264@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Dec 2019 20:15:46 -0800
Message-ID: <CAKmqyKN-icfQniTBfaG7-V6C+7CL+u9EpqNwQw2U6pTkkkKzSQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Fri, 20 Dec 2019 04:16:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 3:36 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 19/12/2019 05:15, Alistair Francis wrote:
> > Upgrade mesa to 19.3 and refresh the patches.
> >
> > As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going
> > to change the do_install and add a patch to libepoxy to use the new
> > define.
>
> I just remembered last night that a Mesa .0 release isn't intended for use:
>
> "Mesa 19.3.0 is released. This is a new development release. See the
> release notes for mor information about this release."
>
> 19.3.1 was just released, we should ship that and change the version
> checking regex to skip .0 releases.

Done! I just sent the v3 patches.

Alistair

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

