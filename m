Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 63880611A8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:07:22 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c5so10681307qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eQKiXC1genz3YaPQGV/yFJVf/yuLxB//IcDw+e90nA4=;
	b=EbF7ayHU/wXZGh44ElvCpjZjL2U27PBQH4vLaK6AtKJp3k4+woLRmCB79I78LzwxRi
	NT16qEov87NI0kC3KPzXCZwk+Djx4YWTbqDVu/XqNUFz0el0rX3ZslERgBnX3InFNpUa
	e3SMm4Rht44ldFpmOiLHOPfE+zo09u86kQUaCL2YOiRSWAoWO3fjgAE3AJQWHXYT5jmK
	9kUj8POsJBApslqmFjAPN289psnhI2w5gAflx+TDpDWkv8FBtdT+PRy5DrkPNjpah3+i
	6kAEsOtUUx5EoSn9fHcLOFrqG3PgvqYLYbiCWiFwt8fnnGnQGINyIKeAJ5H/pR6JowMC
	cOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eQKiXC1genz3YaPQGV/yFJVf/yuLxB//IcDw+e90nA4=;
	b=Eir5QLbYnjjrWmr+4xxnp7Ie8rKUw3LvDe8e43gML77+6sVEnixwrZ+F4i1FXmml4p
	8vu2f1AUbD8O8WmgbTUOWULXhV/Fk88SBXlydJ6/JklRXeeWFLkDqCs9/F597ksI0ipe
	p6ebFAB6nxn5lWeKuHwGGfQDHXPL0ByGf2UFVUoq7q+hOIyxz9rH92WrsCo75zLnlSi4
	0o+VHWuc5Sy4/PRlIsReBzbpASOlOIgoBxtDFcI+PF28uVvyzSXM8iGq1jmbTIsaAUJ1
	jfZgpIyBqtVKCgaoG8YQlbb7LR/62Vrl4opEXd659+uIoPoFVxFMTkY9faMDX9zsD8pQ
	rVzg==
X-Gm-Message-State: APjAAAWmbV9TiN3UL5onSO23G2P3czBuXC3FAfPYZAzs30+w5dtUkcR0
	q6TtHf6Z3dpQ0BmkNjZpLGliN7CfaFSIgTzHMho=
X-Google-Smtp-Source: APXvYqxZq3tIh1ajCry8X0witISD7PGriWzqVEblFtQlhKdklXkLRv1xAaVBSScnmGbfJjTm+HiXNhSKS5SKoPgb1W4=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr10567419qtj.80.1581883642876; 
	Sun, 16 Feb 2020 12:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
	<CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
	<CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
In-Reply-To: <CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 12:06:56 -0800
Message-ID: <CAMKF1sqrxL4H-gYab-VopR-ZUhiPqo3f3XXQhedaKrZ7eGXtZQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Sun, 16 Feb 2020 20:07:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 8:56 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 16 Feb 2020 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>> -S = "${WORKDIR}/procps-ng-${PV}"
>>> +# Upstream has a custom autogen.sh which invokes po/update-potfiles as they
>>> +# don't ship a po/POTFILES.in (which is silly).  Without that file gettext
>>> +# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
>>
>> Do we miss .in file from tarball ? Or is it missing in a git checkout
>> This is expected when building in a maintainer mode
>> Tarballs are produced by maintainers for users
>> Who wants to build from source
>
>
> The .in is available in tarballs, but not in git repo. It's generated as explained above.

right. Then revise the comment, since its expected to be absent when
we are building from
git sources.

>
> Alex

