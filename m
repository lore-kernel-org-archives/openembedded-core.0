Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 36AF77E63A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:44:55 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id i11so8582782ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p8GqrXh/g4Z5kL0ErLcDVCkOqSSpkravBgpYGM2XQPU=;
	b=qn1ycLfOIgPa3qLHXPGSHtesBcVApGq+0+PW+lY/oyyrRe0SbudOQ4qOoOItRMguB0
	kshXb4Byn2YWIAzId8pAG9KSIjDdYCiNUXSpYWuGKNK3SEs5c6BPEe1SfAdbJpyuceVl
	r88x303FlhaTp+hySnlVTAwsJXduYADeV29yewXGpojYoLRxUXnrfyYzZOGMXgLLZ5ty
	xG3z97vFxE2tzBuFeEhV1TfSR1sxK/eWDNZb6QkrxzKs4pqFDGD9UPz0qwKyZnjkkJHT
	ftoJHLkdTSQhxgM2hHdKKuM7CD4JkpVpjYNVeVjnKbYWQOkYcUJypwXAYd2oqRwznNE1
	pMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p8GqrXh/g4Z5kL0ErLcDVCkOqSSpkravBgpYGM2XQPU=;
	b=RC78qL4X3Nfz/g39d2Z03FkCk2b20VW8Z4CSvOTO/QbKBk6if2lj/J2azb5RjTK2S9
	Y11nXnZ95gfWnHFshzqzNkq8jfvnfyQbIYvE+zL9xtgpSVYEDQ2FARZBXIhr+cwRWtP5
	yPv7LcfQ7dn6FY2+MH79mXf07xzW8YI4jV7nJnZMvZFTWuzZjVGa1XJ+yuPQq/bBM3zW
	2plwhufekqnBsZHlsUy39j5QvAqb6g+UdsokR7Xg2dQyNPxwd8qA2tOMsbd0Zp5+DYnR
	w08IgXnrgHGvkoL+nX3YQozWPAkePmljtEVJEgBzYi0ZwbxzMAVXEpnvVJppVqlYbnuN
	zYFQ==
X-Gm-Message-State: APjAAAU/KQUwd4ZLmPnXj1PF/JMpflSzeDjRe3ec8hquai50Jk3wz57z
	w5htJXNyoj4sgIzL4z2PWxshpCZ1rH4T5k+RJwQ=
X-Google-Smtp-Source: APXvYqyI/Ss5+ObE99rpttq0TMk0CKx1dMD9F2QbREi7uyT58Nxl0ebMbUtoWwzd8TivIkQsHJLTRLehWcIvxaZrqRM=
X-Received: by 2002:a6b:740c:: with SMTP id s12mr9847961iog.108.1578602696664; 
	Thu, 09 Jan 2020 12:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-2-schnitzeltony@gmail.com>
	<CANNYZj_ZS77tDpmBO-_AaYb6KYEQTi-B=AV8snywaOa-KrPLVA@mail.gmail.com>
In-Reply-To: <CANNYZj_ZS77tDpmBO-_AaYb6KYEQTi-B=AV8snywaOa-KrPLVA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 21:44:45 +0100
Message-ID: <CALbNGRSMELu18v7UyqHiaYQGkFqcsdP+Hx_HS1FbqMSzvua2dQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] itstool: add from meta-oe
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
X-List-Received-Date: Thu, 09 Jan 2020 20:44:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 9:35 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This also needs a maintainers.inc entry.
>
> Alex
Shall I add me - or who would like to?

Andreas

