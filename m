Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 803337FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:52:46 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id a203so4817942qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CfuRHHMCvCX7CBPmZnSRheC24CWxGQIxq4szEd1G+QA=;
	b=fIuvvs01s4qc7KtPyJ6UP24n3gPF//yKMA1BS9Y7Ryja3tzLN02R7XLH/+kL5S30kQ
	OvAK0neP0mOE2FqLDws1fQMM0p7h78uYCqSwRwuh9mH+okGJDYvy8vt5QB8XCam1Ontc
	qROsdFhCFQEJuLuL2J+s8VZD8EVfZr4yC57KQVO9oteawuYOiKi2Go8N2bpJIGtU+HZs
	aAJKKxBiGNSi4EGUFhwVoXpLaG5KvahnMoJY30A18i3DFY9j3aLOMxKXipQVLNmsX5hV
	rJ7N0fHaaGYcnFwv+In4AI4UknDQcvrVE/yTumFqqVscWGUGtCnNOHOqZhZ2plVtMlws
	SNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CfuRHHMCvCX7CBPmZnSRheC24CWxGQIxq4szEd1G+QA=;
	b=WJikhn1d5/6upk3YUNPw4PACdjBxbswvEmh4Hwx2/SATxzabuNVho2iQt+/Dfs9it3
	vpCDp/PiPy8zy3Q4aIh9TgbFA9N8ozBhWL6AQBa8QIRdPqBMPXSM/aGzxwB51USO0Crl
	RF0TxpT7lgbO7WXLaDCsVZjXbePZL7AL5GeRbwxjvWKT0j/jy+Ch+T/NbwvIYrwncfHq
	pSwAidnW0QFbAebTqjdOXKk2xwRAdONJmrSDUXmiVa9O7VtgZO/rmbIzX/D6sthNJr5T
	YwkGTkK0Ok0Vej4K0ehv782s/hYbtr3bVvMjOyWHaiHy/Yw1QkY7vDspAGI65aWW3Psd
	qPUQ==
X-Gm-Message-State: APjAAAXUFho1LfWOA0D66zoq5aPPCM0YvaZX5Cv25ZBIPneSn4yuWr0U
	cJTwS0H/F0ikRzobW5RkpuKaPLy1fpE+lsLojgQ=
X-Google-Smtp-Source: APXvYqwlNSl5tFnml5qCznu97dUJvtqHAhG2UUCBqCKTklKom92h3txKo+Con8ZWG7Nz1Wbbp03WfXA2pH+WKBWyEOg=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr7427374qkg.71.1578541967090; 
	Wed, 08 Jan 2020 19:52:47 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UPHV8GYZRxXBGXUQLvCqxJShvhU262xOQdEiH0kTPTSug@mail.gmail.com>
In-Reply-To: <CABPh3UPHV8GYZRxXBGXUQLvCqxJShvhU262xOQdEiH0kTPTSug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 19:52:20 -0800
Message-ID: <CAMKF1so1aHVVnSnOpqk_Sd1GjM92oR3bo788ANyOxxEuFQkujw@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Update layer compatibility to Dunfell
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
X-List-Received-Date: Thu, 09 Jan 2020 03:52:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 7:39 AM nick83ola <nick83ola@gmail.com> wrote:
>
> Hi,
> is it time to update the layer compatibility for meta* to dunfell?
>
> Especially because after change
>
>     commit 9702544b3e75d761d86cae7e8b36f3f2625b68ce
>     Author: Denys Dmytriyenko <denys@ti.com>
>     Date:   Thu Nov 14 19:40:07 2019 -0500
>
>     distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES,
>     rename
>

perhaps not yet, many layers provide single branch that works with
multiple prior releases
and this would break that, it has to break at a certain time but I
think close to release is the right
time perhaps.

> a lot of recipes start throwing warnings.
>
> The change
>
>     commit 98e34b71ef54fdada2fdc199905f8f2dfae7e933
>     Author: Scott Rifenbark <srifenbark@gmail.com>
>     Date:   Wed Dec 11 13:02:24 2019 -0800
>     poky.ent: Updated variables for YP 3.1
>
> already changed the release name
>
> Thanks
> Nicola Lunghi
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

