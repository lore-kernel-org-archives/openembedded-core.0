Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4759E6D73C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 09:39:37 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id i6so8501296oia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 01:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GII+NwdNbhjRimD2dZX0rlQjV0t22pZuO1AD58ebDWg=;
	b=deOLFJ3apcUstQvF7oRI26ExjDp+qDl2ri+unyI9pC9NoHMfrQ/ykQYTJeDgukI5Z9
	LetEJL5F5TlaHz2SHpziw8U3p4lAy9lXWuLXVcn8HIudFECmEvqKXXPxUXwXgXR166hy
	BuFkxuZool02UJA+inJbIizQw7TgZ+W4IIX2Pqk0VDrHdTJXWx1Kpg+QnJzR+zNLLzlO
	jQOFRYZx2jeTuOcUTpsGDCdgu8uuhAXW13CkIjV1b0FdYvhf8DCO4XC+3rhkqolOYDL4
	sfXhuRSXcLMFDIWAQLZyZZiSDZRI4yVpHSXtawcezEWfl6xWcO5cuXbOxk5SMZWOjO6B
	j8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GII+NwdNbhjRimD2dZX0rlQjV0t22pZuO1AD58ebDWg=;
	b=boIfOvZyX42kHjOmNHF5S73RdQ1CNwAtGybihPpEfpS9S93ZbsERFYY8pbDnMEZ0oc
	Fz9TJc71W/MOBgo3xttptCQnNb0w+yQtuB2lzZ3jmPWhfXsWKG+t0Bo9XIslvgINK8GD
	yPOJdOBR+QliflQlN6PCBltoVP/lMVananNny9ZFGG9LTPVShb66y8G8O+1CxxMzJLlw
	/P7QBoTr6v/WOMiRG8LXkV1+9awzUbUWWrnnO09EzHdgqsK3lUtUIc2k9cy4OWnJGC3q
	zHr8P+NXNa8LCZXkl7kq92ukMXcs5E6MMyCi68Gxxu2UcwxmxsVfqwG0LWEChD/tOIpt
	UZnA==
X-Gm-Message-State: AJcUukeRDnsuEWCA9LVzkMEjBjEESDEX+ytOtOTb429WlTLHWlQk9LlT
	+bGHJMYebA+ki4IYkFy6ZboDc1XSLDa7+Rqe26U=
X-Google-Smtp-Source: ALg8bN5GsJojejWYAbz3b3gykAlPK/zj0J/nvwgMwegaCzvZf2MSFK9VoXd28rJeSCLlexlgOoJivVwEOVnW18aa3qU=
X-Received: by 2002:aca:4b4f:: with SMTP id y76mr266323oia.88.1547804378038;
	Fri, 18 Jan 2019 01:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20190117104456.E6876440001@auh.yoctoproject.org>
	<5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
In-Reply-To: <5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Jan 2019 10:39:26 +0100
Message-ID: <CANNYZj_cKj2+RwqyaCYjSfERWeGugBrhmgKoYVrwxof4c8Vpkg@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot: upgrading to 2019.01 FAILED
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
X-List-Received-Date: Fri, 18 Jan 2019 09:39:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jan 2019 at 08:10, Marek Vasut <marek.vasut@gmail.com> wrote:

> > Next steps:
> >     - apply the patch: git am 0001-u-boot-upgrade-2018.11-2019.01.patch
> >     - check the changes to upstream patches and summarize them in the commit message,
> >     - compile an image that contains the package
> >     - perform some basic sanity tests
> >     - amend the patch and sign it off: git commit -s --reset-author --amend
> >     - send it to the appropriate mailing list
> >
> > Alternatively, if you believe the recipe should not be upgraded at this time,
> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > automatic upgrades would no longer be attempted.
> >
> > Please review the attached files for further information and build/update failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Can AUH be fixed please ?

We have previously discussed this: fixing devtool to upgrade several
recipes in a single transaction is non-trivial as it operates on one
recipe at a time. Please try to accept that AUH is not perfect and
take these emails as a reminder to do the version update (which you
should, as the listed maintainer). The attached patch is actually
useful as a starting point, you only need to rename the other two .bb
files to complete the update.

Alex

