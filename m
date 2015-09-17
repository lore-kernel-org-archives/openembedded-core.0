Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC8AB77003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:23:07 +0000 (UTC)
Received: by lbbvu2 with SMTP id vu2so9161013lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=iWz4W2Rq7i4LiZqm0ybqaXjjmP5uXmDT8aDRMM1heyc=;
	b=Y+UIo9V6RV9SDvUr3c+NK7z5Maw5PR8WbvpegqK8WQGNXUgwl5lV/p24sq3gZULWFh
	bb6I50kenKWrFtFwMGQ/BKdryTpDOGgPMIgSbUoaA3sMLNoE6B6JhrUQqO5BKNU8AAjn
	X2itIv5k9fx7wfvGrDW+hnn/88C0aDg5sWQZrWOKk/6L1wZxQvYM2730DiNorz/FOpb4
	jULdvB4t6GgbKCUrpc0XFhnjud0LQXdigx595v3Up2B8Kudk0hdMJB9YjG4o4urruKFt
	elZWexJmGxqoFYFTSUjWLlJZIjNqXE21gsUbt3Az1er7JmK1MM8SmrWvkZykAlcC377x
	tuOQ==
X-Gm-Message-State: ALoCoQk/J5J4KEfhMWTH0ZUWSerMRimo5siqgsbYrBTTgNnIu02IF1a097deCO7BTScBF6vtdKVc
X-Received: by 10.112.172.165 with SMTP id bd5mr20534987lbc.51.1442496186216; 
	Thu, 17 Sep 2015 06:23:06 -0700 (PDT)
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com.
	[209.85.215.51])
	by smtp.gmail.com with ESMTPSA id n10sm519424lbc.37.2015.09.17.06.23.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 06:23:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by lamp12 with SMTP id p12so10888705lam.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:23:05 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.11.200 with SMTP id s8mr36322478lbb.44.1442496185070;
	Thu, 17 Sep 2015 06:23:05 -0700 (PDT)
Received: by 10.112.252.229 with HTTP; Thu, 17 Sep 2015 06:23:05 -0700 (PDT)
In-Reply-To: <f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
References: <cover.1442494048.git.jussi.kukkonen@intel.com>
	<f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
Date: Thu, 17 Sep 2015 10:23:05 -0300
Message-ID: <CAP9ODKqRyVK1mrOA4ofZVN+iS8fY48dovQ8VihBPQFZT8F7DWA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xinput-calibrator: Add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 13:23:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 17, 2015 at 10:00 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> This prevents xinput_calibrator from popping up on every boot in qemu.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Why you don't provide a valid calibration for it instead?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

