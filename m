Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZlf7-0004D3-2Z
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:26:53 +0200
Received: by mail-vb0-f54.google.com with SMTP id f12so708043vbg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=cMkdKzzGTlbohRk8GbsLRlS+pB8AL4/6+zo+1fQw5rQ=;
	b=YvEYCyRoyz/BGJPBsXI9IPyVhN5QCzR9m70juPGiRLJzdXildYnVcpq3DJxjgMU/fL
	B07i/s2bjYoH1wNaYk8puif55Xb/76HCpEgfkOtv1sxZKIuDfDGuYv0e2RjDa+gbls3F
	CLUm1Z4xYR6dJHp1yN/SyvfWuDUeL+qhXbZ6tf/2kheVxAeaWWSp8gNo2ntkmT8tzXkJ
	BjcFyr38Z2f/cLZT3QH7X2yD3lk2EWhEoyv8o8U1+pWgsdrd8LFkwy4SmkKc1l4O6DO5
	tjwatPuIOixD3Pai8QYodWn3VmSJY/XnqpkqtadQX4PzBRpWwiZi79m6q6JdEfuh7PR4
	Bgww==
X-Received: by 10.52.37.196 with SMTP id a4mr1615798vdk.82.1367946526150; Tue,
	07 May 2013 10:08:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 10:08:26 -0700 (PDT)
In-Reply-To: <51892A18.4020508@linux.intel.com>
References: <1367941787-8508-1-git-send-email-ross.burton@intel.com>
	<CADkTA4Oq_2OuhPVjBuowpkyoLMrwnPZyKmGxAwTLABQo7wzfiw@mail.gmail.com>
	<51892A18.4020508@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 18:08:26 +0100
Message-ID: <CAJTo0LaJfgf5AkEdpdfTnLcKieusez2xdmVP-+CN_rDY-wrXGA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQkTNKdxBWULdTN3AGdFtp0IE+vfTg/MkN2ZXWQaUoOPUk2XBCTCv4q6u8U0zC19LepaCQBo
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86: disable paravirt guest, causes test failures
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
X-List-Received-Date: Tue, 07 May 2013 17:26:58 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 17:21, Darren Hart <dvhart@linux.intel.com> wrote:
> Have we seen the failure on 3.8? Or only on 3.4?

I've only seen it on 3.4 but it's only occasionally hitting so that
doesn't really say a huge amount.  I can re-send it for 3.4 and we can
continue to watch the AB  -- if it doesn't re-appear on 3.8 then we
can try re-enabling it for qemux86-64 too.

Ross


