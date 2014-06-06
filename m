Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id ACA4F6B5E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 15:37:19 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id k15so3761796qaq.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 08:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7ty/n/JtHK9IlI82B4yiJrKuvhap0N+fvSiPto0U04k=;
	b=MITeuxXgk4nnzMVD6dJuv9Qs2t3AoPL23z1+/a3kb/tBp/LR9VXGyTWrDetTDZ8Pl+
	z620HUgRTCsHCFkEx9NrFhVM4sHfDX4vvfRTXyk3wyX8chkTCDIERHzcBxmAw0vPr0N6
	qX5sN+VyxL0dWuEA4I8VLACjlfDARdpk/Nj0gRg/YK7ozgssNER6wFdyWQB5SlRRWQJ/
	x6Xc54+oJ2Seks2wZN5zJxaVe+nBACa6iTb6EZiZOCBR4LLIHi47/Qa/rHx/MS7ZWQxl
	H0QgRf2SvfzGftIXzYrfvERVdbtyIbHv/ytGFYGPYTie1xZBUxQ1EgPVN20lKZIpa4vW
	Jf2g==
X-Gm-Message-State: ALoCoQmRG65E2S29OxHGFt80w8T16IRJHW+qiPs/8BkJCIv0OEezRyE4XGgE9euAPyMSfe1aTWp7
X-Received: by 10.224.165.70 with SMTP id h6mr10025947qay.78.1402069040120;
	Fri, 06 Jun 2014 08:37:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 6 Jun 2014 08:37:00 -0700 (PDT)
In-Reply-To: <6d4c4b72f95fa7b7a4bced0e7747ae341b9af71a.1402021350.git.Qi.Chen@windriver.com>
References: <cover.1402021350.git.Qi.Chen@windriver.com>
	<6d4c4b72f95fa7b7a4bced0e7747ae341b9af71a.1402021350.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jun 2014 16:37:00 +0100
Message-ID: <CAJTo0LZom5K2eeOdVbrBhWsQbKrCo=mCaMbbt4ExAwtFNLmn+w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/4] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Fri, 06 Jun 2014 15:37:27 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2014 03:28, Chen Qi <Qi.Chen@windriver.com> wrote:
> -FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
> +FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/* ${libdir}/gawk/*.so"

grcat and pwcat are installed into $libexecdir, so this patch is wrong too.

Ross

