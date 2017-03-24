Return-Path: <cody@arrc.ou.edu>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id ABFBC6AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:21:37 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id a5so5014926oth.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrc-ou-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IE1LNNVvRFTkwTzLjnYqjVMKOh8EpkFaww5elrPIeZ4=;
	b=kLC2MpAMaMDsHyj9k3vcMBhUNDButubvYvLQaCMMCtcn6B+O7nD3LScdQdv4DNCTgA
	IQqjQA6JaiMYfnfQzcrg3WDzZ0/03BnnpADg1wJmq5ngCXUKfX3HaGvEWbf4QqJ1lvIe
	YOE9RC0s9eTPKkG9uoF6+jWGlYXHCooDcAJYrbGtvLkEVenbkWlHB6pMisB8p/m8IYT5
	qNMFMmv/7YdkYC9yaXy3E5lSLrJa7Yhmcg+ARqMtzRXVw4KsehgnynkyPE2fvvtF9KhO
	zCSdTJ7P6vnVYNhRbYGf7trgA5aGN8tDeKAFngCtnNV7HD8DC7nGKsuqjKYICx4RmBQZ
	9vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IE1LNNVvRFTkwTzLjnYqjVMKOh8EpkFaww5elrPIeZ4=;
	b=pNbQVYC+crCtJRLU1it5ATuRNrayaFmQqN221ckQ8QCzkZPe9Iq9ux0rMAsiLO0lVh
	1/bH2nZZrbIYgGGXhkk2W6uY165Dt5W8v4bYLLmDFRv3OJ2wXJzHO3HCHHFjp0/dJcwx
	HNcrAQ+zawlX6hqk1a7fnCfUGgJDl5c7vhOAei6Ove6mxOybSXTwN5XVhpw+e9UFnZz9
	vlg+i/g3IHUbipIkKU/y0l9JsGaseRGcnQJD2dUiULWIb16k//jG1Peqxup4tUG5IAwa
	aBXrku4zOq2E4nwHFcR+JFnIbLobhwIRZC1MPgAoDavPxo2Uo41sALUyki1zREDnlpxC
	JRSw==
X-Gm-Message-State: AFeK/H0J74sSkHEgeuAdZhWciooL3wFHiaYnEcxh8bXEAC0IxEQ0bUonp1CVUEvU8q9vaTXKdqLXt4RulSXVnv9q
X-Received: by 10.157.7.230 with SMTP id 93mr4357387oto.223.1490372498544;
	Fri, 24 Mar 2017 09:21:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.203 with HTTP; Fri, 24 Mar 2017 09:21:38 -0700 (PDT)
In-Reply-To: <CAJTo0LbrMMXLGy78MZcRAGe9npRs9Q=rFDhnSTqZ+E5w8+E2EA@mail.gmail.com>
References: <CAKEinFxuOqEeYv1zt5oL9KpPQnN=jQ+rA3++igT7dWuWeBX=rg@mail.gmail.com>
	<CAJTo0LbrMMXLGy78MZcRAGe9npRs9Q=rFDhnSTqZ+E5w8+E2EA@mail.gmail.com>
From: Cody Piersall <cody@arrc.ou.edu>
Date: Fri, 24 Mar 2017 11:21:38 -0500
Message-ID: <CAKEinFxLMBZvO6g3bFey7i1GrZwFwEi1jxCxXCuo7x-tvEjEOw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Remove do_install_append() from zsh's recipe
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
X-List-Received-Date: Fri, 24 Mar 2017 16:21:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 24, 2017 at 9:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Patches for meta-oe need to go to the
> openembedded-devel@lists.openembedded.org list, not -core which is specific
> to oe-core.
>
> Also put [meta-oe] in the subject prefix, and send the patch using
> git-format-patch with a properly formatted commit message.
>
> Ross

Thanks for pointing me in the right direction. I've posted a patch now:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-March/111929.html.

Cody

