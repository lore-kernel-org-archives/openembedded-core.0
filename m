Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8ZRE-0001Vq-HO
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 17:56:05 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy27so2929799vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ogxt2oLDEjrQHdJ7s99+E3Ap5cwZhjK98NttoYcDYUM=;
	b=h7X7Q1y5AUBVnXighaxwOAUOmb+YwShVqXJ7GT3/J1vnn9qZxpIt+Q2nUI5Rltg3ma
	aeztJCUH2xc8QUpx/xYSFzfEbABSwDF0SnQJpyr6EtRUX6Js8fk8OEWSxuPfx3MbvSfz
	j0nZaUVDna87ARcg+f0azzjbOZE7OiSaQrnHsDEw76V+izS66k9adpSEB/h9iQKU0wVA
	HJjvth2VAiEA9NmHQysRKx8MP3mYH2E6HsIOwpEFWO9I+56zzYdMaBXnkXF01/iibBMv
	ZBF5y83EhTdjtxvW+X0iwJUTjQPm9vhqDqUqxcvT3nQvLslDgbc7YNkiuUDlAgVXBsZd
	km8Q==
X-Received: by 10.58.106.161 with SMTP id gv1mr32968287veb.35.1361464791055;
	Thu, 21 Feb 2013 08:39:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Thu, 21 Feb 2013 08:39:30 -0800 (PST)
In-Reply-To: <cover.1361464203.git.sgw@linux.intel.com>
References: <cover.1361464203.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2013 16:39:30 +0000
Message-ID: <CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQl3Sbq298+ke4Rm97JrlU0VK29qdfvnF+zmn29L6e+IkSM2nVu91J2QqZENVfdbWNHD31v1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/41] Selected Updates and fixes
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
X-List-Received-Date: Thu, 21 Feb 2013 16:56:07 -0000
Content-Type: text/plain; charset=UTF-8

On 21 February 2013 16:31, Saul Wold <sgw@linux.intel.com> wrote:
> MiLo (1):
>   util-linux: Add package for libmount

This appears fine but I'm seeing weird problems where although the
library is moved out, the shlibdeps are not correct (i.e.
util-linux-fsck will occasionally revert to finding libmount.so.1 in
util-linux).  I'd love to understand why. :/

Ross


