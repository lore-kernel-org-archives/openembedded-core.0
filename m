Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyOaE-0004Vw-MQ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:19:19 +0100
Received: from mail-gg0-f199.google.com ([209.85.161.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 07:03:44 -0800
Received: by mail-gg0-f199.google.com with SMTP id v5so10103519ggn.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=oUOldWlzyQhAKtgiPuMFOFJ7/A+zm6rCHcu6B40Ua9Q=;
	b=keRhi8P+2SD+n/T+6R9ji05TKh4+iIJI08TRPbk8Xc1XEN1udwXAKUsnv1OIApBjCF
	E9n9vbowi7wy+9v+3ES5MBqEI/mefrWqgqiY294I3OrSnmW8y1jwuV0Y4Qjm+v9ls0cx
	ZDUepsHYDvQWqVGiKEejOv7YIA5ix+sn5f2IF96WMKT6iUxpXy7w/8pYrCeF/DddWrbV
	Q1GByVf0uui/4EfLux6uURFr4wFwQrSEU//ae1vdCWOsGCqb+bkyjBjRAlFBOwS/v01h
	sy11ufKhd3EFzvRjLKJkLMxcMysgI8BftSad/mrfnWmy64TuFcooHaiG9aFGub3wLZfK
	dGRA==
X-Received: by 10.220.148.205 with SMTP id q13mr2207645vcv.6.1359039823385;
	Thu, 24 Jan 2013 07:03:43 -0800 (PST)
X-Received: by 10.220.148.205 with SMTP id q13mr2207634vcv.6.1359039823302;
	Thu, 24 Jan 2013 07:03:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 07:03:23 -0800 (PST)
In-Reply-To: <CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 15:03:23 +0000
Message-ID: <CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQmch1zPpfwL/g5FpyRCbkv3iF2wMOvXa9tVuDgOKZUJHMn16HnqblYzXPUaCeUlWVv7eZ+7D06Oe/h66lTQW5WVBn5KhZ4cJ0Oyzj3VUSG5ldZKjscgwkAGq7Fkn3fcb/oycXwsA88c/kMZI/GgcwfsHE/pnH3WTzDfZNPc+SBTk2sf8LOw3Sz658g6Ngk0QHjpcj6w
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 15:19:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

A fairly uncomplicated way would be to have a variable that defaults
to multi-user, but allow images to override it (e.g. all the X images
in oe-core would do this), and set the symlink at image creation time.

Ross


