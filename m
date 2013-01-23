Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Txyxu-000714-P6
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 12:58:05 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 03:42:30 -0800
Received: by mail-gh0-f198.google.com with SMTP id r11so4542081ghr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 03:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=mjlN7ux6HhuTVU3hE7Jl00N5JubgYgeK0KP9omfhhAA=;
	b=JXqZ0Y9iExx0POOKca5RaLuLSQClJoaiL3swV8iKz7Vmh5RZKMIBi5npwvspe0gvrG
	2zhLrlAoqEhmDkJfihx6jYvV7y402wenbV7qY3f8S7H7YxnQrgKoKp/0gQYdMz/5VV1x
	0XdxNJ/VaPQmA4rQ32gHwg6p/ucJ/QE/vPshEJqzAWOMgrMj6s9eeI+1HG+pr2rN4G7p
	A4UVpTB4a107GWRGPtVAK1GvfRqEHniM8I8U7IcHup/+lrrJR2bmtVwsDka6XJYKxBPj
	iYmEQoeWCdWQcbC4DYR2jiw/u/04P8LxrSKeDxTIf0j5MlqOJjzMIWK09CmaP9xYBKPS
	y/jw==
X-Received: by 10.52.72.232 with SMTP id g8mr769291vdv.69.1358941349209;
	Wed, 23 Jan 2013 03:42:29 -0800 (PST)
X-Received: by 10.52.72.232 with SMTP id g8mr769277vdv.69.1358941348942; Wed,
	23 Jan 2013 03:42:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 03:42:08 -0800 (PST)
In-Reply-To: <1358909100-21633-1-git-send-email-raj.khem@gmail.com>
References: <1358909100-21633-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 11:42:08 +0000
Message-ID: <CAJTo0LaEfVfd3NKHDSZapk2+Gm2yo6-aHzAPTt=CwThO1pGMWQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQnuKkop7CrjPd9sfgq1Ole8b0nTx0ysC3qhQUG5fiNpohiSY3sAadQWjTbsKg4VMms4Cs87mbuoyb/TD/YabQPXaDawBWBLNukhiCG7s6sKaR0RxoY/VB7QRU04r7G1u0OGV8EBYxee0LoHTg5uGghP9e65/Evw2nyCb0cNnHtX1EPq/GvL3BGhiJXjpz7lL8qJGmhb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Fix build on ppc
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
X-List-Received-Date: Wed, 23 Jan 2013 11:58:13 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 02:45, Khem Raj <raj.khem@gmail.com> wrote:
> ppc discovers an interesting issue in linking systemd where a library is
> missing in link cmdline and linker barfs
>
> ./.libs/libsystemd-core.a(libsystemd_core_la-manager.o): In function
> `manager_check_finished':
> /builddir/build/BUILD/systemd-196/src/core/manager.c:2092: undefined
> reference to `sd_notifyf'
> collect2: error: ld returned 1 exit status
>
> For more info see
>
> https://bugzilla.redhat.com/show_bug.cgi?id=888255
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

(note that in oe-core you don't need explicit PR bumps anymore)

Ross


