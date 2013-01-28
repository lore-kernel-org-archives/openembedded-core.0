Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TzrVC-0001lc-Oo
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:24:13 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 08:08:30 -0800
Received: by mail-yh0-f71.google.com with SMTP id m1so4184974yhg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 08:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=gcq31NbZKHbt6oII/P09N3RXSN8YhBfWUjQTIweP+b4=;
	b=G2+YbRzOk7nPsOev3ekz55nCv1fqlMNU4o4ZYA5+aYSoCu3uyTaSNn5U4Xe73mzdos
	M9ghJVkgIUPa9vrh7CXhhz+yio5FPAJsAWJ+f+f/QHBpx/Mdec+IrHUYhdcke+qIQo+Y
	bquR+fGxSHyYG0jFzM9ThvbQrbM2nOfDd2TiOxFZyAk26FyxiENCK1U+mBLs+bSBWYQp
	96lXOOR9eVPGSAzR7FpTMI/F7UEZFYte39gRj0EkAj3A0TOU69ZxE343tUf34uK0OP44
	lZko9RH70QbFnVmLOKfPdZAS+pIsueDdEut/gKgprLiuGzA0JByPikdORg3OOFeUKRWA
	VvPQ==
X-Received: by 10.52.178.105 with SMTP id cx9mr8528824vdc.31.1359389308940;
	Mon, 28 Jan 2013 08:08:28 -0800 (PST)
X-Received: by 10.52.178.105 with SMTP id cx9mr8528819vdc.31.1359389308866;
	Mon, 28 Jan 2013 08:08:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 08:08:08 -0800 (PST)
In-Reply-To: <1359153142-13425-2-git-send-email-otavio@ossystems.com.br>
References: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
	<1359153142-13425-2-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 16:08:08 +0000
Message-ID: <CAJTo0LaTsrfr_GES+xjA-veo9uTAvME3-MPzG3uXKPvTCX7Z5w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQm/5wqXeMrSXgKFz3KcP9s4RMP0lMiY2GNRfRUPr36zdzpWxVqO+Tm1OQ0kTXHJdTGKJm+BDopIwlKtN4VM1vod9SZdVsMz0220G4zLC0rOdEkOsFrCTCsffVh46xzP9IlIDxt0m4LTQBVJk5nOlPTP88sVOEl4q9V2dloI2h+dotVlQkGQuVUd0dZoNQuRS8Jmtrq7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: Add virtual/dri provides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 16:24:16 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 22:32, Otavio Salvador <otavio@ossystems.com.br> wrote:
> -PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
> +PROVIDES = "virtual/dri virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"

Please also add an entry to default-providers.

Ross


