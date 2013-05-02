Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXtJk-0002WB-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:13:10 +0200
Received: by mail-vb0-f46.google.com with SMTP id 10so410829vbe.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 05:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=kBr/SXc+/qkFeswp8j26n1yARQ9CfaTJZwS7uRQsJBM=;
	b=hXLVtc8fD+9/MaoE9/C4iNWRAR9KJZ6NFNxGNekNPS+6J3MEBUldDVsk7A29qSe8ih
	kuTqkzbsQahNYWAlZ9oozxMtWcidjvf50ssFuw+EsuSZV5a5YF/gYD9ldxv60/ivwy94
	bFAnnZLY4wCfKHRu9sAnO+WNf2k7zZy+mZnSf3SisQWAMZvyH11ED9+3+6zuj3N/xF4m
	H29Hdp6aCNR1JfRLZPkFgSfrclbUXUZaicj97SlEMQ15C3l3/l2oFntyADPF1vTM0c6S
	uMnLtCToWO/he1nuNQ5V6ha5MVEcchx8Yzvob1l0Oslz437uyZFeY+rdmmwrOpfRLH2b
	F1Mg==
X-Received: by 10.220.176.71 with SMTP id bd7mr2078741vcb.12.1367499306625;
	Thu, 02 May 2013 05:55:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 05:54:45 -0700 (PDT)
In-Reply-To: <1367497165.14512.247.camel@phil-desktop.brightsign>
References: <1367497165.14512.247.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 13:54:45 +0100
Message-ID: <CAJTo0LZf1D75XU5CUWqyvNbY5A1kbXufiJDBKmc-Bmf9RxAjCQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmLyc+t0n8KhVyoRBXcZJYwTDWMz8aa6QmMAkfXZN+x4n2F7O4LgpiEbxdh2Ksuh9F1F292
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-runtime: Avoid error when trying to remove nonexistent directories
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
X-List-Received-Date: Thu, 02 May 2013 13:13:12 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 13:19, Phil Blundell <pb@pbcl.net> wrote:
> If we didn't build libgomp then we won't have installed anything into
> ${infodir} or ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude.  Check
> whether those directories exist before trying to remove them, else we
> will lose.

Isn't it neater to use rm -rf?

Ross


