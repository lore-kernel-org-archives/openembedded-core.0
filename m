Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAP0w-0002v0-JN
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:12:36 +0100
Received: by mail-ve0-f178.google.com with SMTP id db10so3953316veb.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=1jk4BoEku4jVUokkPwvXRPrKqeD5pMtEIAQ0Qwm+APg=;
	b=GHrxZo/E1kGrCaidLjSV1ToyC+4BFcLFXvSJatkJJWzxdzU2ppmipiSnBc04gTQsWp
	pxI+48NWlpWU3v3I28T/3gUxKxeHvuJbZSHHF2k6tOVEgDZvH/10338jqz4MQb9NEq3J
	GgcRbs2ovh2ZdQ9qogVXxAAISsqDiCm6mnUaySt328ps8uRFhZ80NjY4PUtAln9l595x
	spRsYq9IL0KToOv4xUdgTwoCG6TVRmAqWq/Ou2ogLm3n5NfrytKHl27PHAWccHtb86Xc
	K6/5UKPidb8gfjz73XUcZUGeHpBJe906voHMYRMkg7p8PaEfoF120Y7M/Ckjyk8oP72A
	XXwA==
X-Received: by 10.52.67.105 with SMTP id m9mr10551233vdt.128.1361901370845;
	Tue, 26 Feb 2013 09:56:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 09:55:50 -0800 (PST)
In-Reply-To: <CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 17:55:50 +0000
Message-ID: <CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQkez+2GEtwOZ4su+GdGWQXS1LxIYOBNvSSZQc6yBzoR0KS4xtkqQWEjsKXOejVEqGwS6Ruq
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 18:12:39 -0000
X-List-Received-Date: Tue, 26 Feb 2013 18:12:39 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 17:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
> If it changes the build depending in target and host, in the end it is
> not architecture independant code.

I think this is just autotools being nosy and failing when it doesn't
know what "alllinux" is.  The files don't change as they are literally
just installed.

Ross


