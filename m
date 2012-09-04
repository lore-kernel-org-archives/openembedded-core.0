Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8vow-0005IB-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:17:46 +0200
Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Sep 2012 09:05:23 -0700
Received: by yenm14 with SMTP id m14so1428292yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 09:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=igS+wPjVlzxwmg9SB7sPh2gRNUVj0rrvFxAV0111Jbk=;
	b=oJoNYZlHSw7W7kauuMH9HiPVGRd4AFBcJf8oq++DUdxMZII5L9l3p8lwYDreCy5z73
	luFTt3APN83sYfsKSt4CPgbzITQZNN5YNFc2G4IjpYyvAD5ZmU+yHjM6fg1sXPipx5Mc
	rQ3xoLG5fVtRkNYxY25QwI/XzLpI0VRe7g2oe3+KTeY1LYaAn09Nj2inceNiBN++9Lpk
	k0QWUWjf+ly3uS7AZtXwi7cTWCu+mcXy8ZnhLLtYL8uI5HiEQeag5g1QhuA3fciAXFko
	R/lBHNaSU5q7Z6ZJNjQQ9jAmKq2j6UWyyOmTch9XD3IaC4u+CQH/U97QgXuYxs3k62HC
	yPbg==
Received: by 10.60.29.229 with SMTP id n5mr15925208oeh.103.1346774722074; Tue,
	04 Sep 2012 09:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 4 Sep 2012 09:05:00 -0700 (PDT)
In-Reply-To: <50462570.4090703@communistcode.co.uk>
References: <50462570.4090703@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Sep 2012 17:05:00 +0100
Message-ID: <CAJTo0LbfER_ywFjfK4TAy2DUF5uwe4rg2FsUsJ3TaKF6zZvA9w@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQmcrtmcV51cvPTP2dDG+6k3sxTTPeDlTxuQ2k2vm61EGfRjVZNVphFgfIA9pTlu3JANf4Dd
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cleanup-workdir script broken
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
X-List-Received-Date: Tue, 04 Sep 2012 16:17:46 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2012 16:59, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Has something vital changed in autoconf-nativesdk?

Yes, it's now nativesdk-autoconf.  That script needs to be fixed.

Ross


