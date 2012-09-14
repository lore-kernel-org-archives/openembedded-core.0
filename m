Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TCUx9-0003VW-Dk
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:24:59 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Sep 2012 05:12:23 -0700
Received: by oagn9 with SMTP id n9so2833848oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 05:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=+7NBPMP4pibF9aREMlHp9N3FE3tDPTXMEIx8mFMzNKs=;
	b=cr0geloA5LxAff+HTiWBYBE58QH1YHOUmb18F3aWwFH3QXH2grTgApM+wih0gBdUST
	HcQSs40nPxVo2fmmz3DxtBLjH00/ejSxcZs+yDpnlfb38r8Qyx/npIm6aWo4XLp4pXwA
	rNxQi7Ety8mOcIZaWydA+DVd4xDqxtyieNY+gff0luM9PAfnliio41h+y0X2IUNYyicI
	x4BIV+hvyvTSZK7b/TjKUocbs3HWTR+Z9+NvHsJLbjQ9rB4oSiYW6Gs96s5EcEHF3vlZ
	vzNekyK+8qnZrediw3XbkwtUvnL4NVdK4p4WbM4qjjyPDRKFgVHiO/0iVVNltgpi+Cx/
	WvGw==
Received: by 10.182.154.70 with SMTP id vm6mr2773252obb.50.1347624742254; Fri,
	14 Sep 2012 05:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 14 Sep 2012 05:12:01 -0700 (PDT)
In-Reply-To: <50531E8A.8000307@communistcode.co.uk>
References: <50531E8A.8000307@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2012 13:12:01 +0100
Message-ID: <CAJTo0La+xjhWHZZGXs9KTrpi_ASnUsM=t_d0xqHhPXFSNc-zTw@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQm7E2b0ywQ0xMz9NmX2yerwo93t2sWZEVPbEVaipOfsEz8tW08lHbPQ3MnifTuO7bQTaoUF
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Nothing provides libxcb-*
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
X-List-Received-Date: Fri, 14 Sep 2012 12:24:59 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2012 13:09, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I am trying to use the package libxcb-xfixes in a recipe however when I add
> 'libxcb-xfixes' to DEPENDS I get the error that nothing provides
> libxcb-xfixes however the libxcb package clearly has it in the PACKAGES
> variable

Build-time dependencies are on source recipes, so you'll DEPEND on just libxcb.

Ross


