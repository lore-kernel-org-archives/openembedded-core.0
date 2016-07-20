Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C2F8C606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:47:31 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i5so69767349wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 06:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lZdap5AMSmZbv5Zcjip8Ta/4U3jH0GgApuFqgIrQjDo=;
	b=F7Jl1EKhNWQI+LpIkVineq8c3Majs5wUwiukjq972Curwf/Kw2GPBX83N5u89sH2Ho
	kYnqXdB3PjEIlJ235jeA5wDKzCkBqqBdyX1p/8s55RPZsxy9myDhn2v6pv4UStvLRR6j
	CwsVlLpRzD5xkxWP0B+gRBKn1Aici+NXldum4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lZdap5AMSmZbv5Zcjip8Ta/4U3jH0GgApuFqgIrQjDo=;
	b=UUdaWLvkK9qlq9EDgCRvYw9oT5rO9zgOtX4T0NmBFPH8ud2XV0pb21bOzxERuKlxzE
	+cy9+w/dPXOZCX5Y8k9unROsQZVy721incDM+ZZrhBUAOm0W144KII29pWj/bstMia4z
	liheouA7o8ZIA+Jjo/RiFxTdyW61FMGzmUWUhR18wAFzNUSaHSbpfZKHUDEkYYQxABXv
	XUbUWu9duL/QPN9FyDbpf5ZzdtliUS7hISsbwJoQBDhCDp4G32nib9nI0bxU3TjuJA7B
	pCR3lQDHbrQriTPeo0wrfwrrHhFFrr+EL41b1LVbOHXofV6Kvy7CU4zqJmPvkr4FjCdc
	gn0w==
X-Gm-Message-State: ALyK8tIiKCNsLUudf15NLDYVzbscPvBnmH0WcA/c9jlZWyrhDFdRDX9iS9RwHc5wkIohESpKKpXmhZy7E1K9JcjV
X-Received: by 10.194.85.104 with SMTP id g8mr1462137wjz.105.1469022451165;
	Wed, 20 Jul 2016 06:47:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.163.225 with HTTP; Wed, 20 Jul 2016 06:47:11 -0700 (PDT)
In-Reply-To: <f5075f44fdc9bc1ca976ccb80a99f066b20df9c0.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
	<c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
	<f5075f44fdc9bc1ca976ccb80a99f066b20df9c0.1468848064.git.jussi.kukkonen@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 20 Jul 2016 17:47:11 +0400
Message-ID: <CAP71WjwkpzzouLO0jtt4EcBoPnDQM0YTpJBz9eaGt-piLo8FZQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/9] mesa: Upgrade 11.2.2 -> 12.0.1
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
X-List-Received-Date: Wed, 20 Jul 2016 13:47:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 5:34 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Massive mesa upgrade (OpenGL 4.3, GLVND support, vulkan driver
> for intel etc), although many new things are disabled by default.
>
> License file change does not change the actual licenses.
>
> piglit results (with piglit update on ML) on an old NUC with Intel
> HD5000 for reference:
>        pass:   33972
>        fail:     306
>       crash:       2
>        skip:   30857
>        warn:       7
>       total:   65144
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

thanks for the upgrade.

I have tested the mesa upgrade with Gallium3d/freedreno on Qualcomm
based boards.. so far it seems to be working fine.

