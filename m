Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tr5I7-0003hU-68
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 12:18:52 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Jan 2013 03:03:16 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so24629520vbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 03:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=SRBS/LhpeXK8kYQGBPIExx3VZMe+FjYtrK7SZ1OAKnk=;
	b=V3N2AOsTnUOD8g/ofudaS075njwrYlqMJ2sU3g0dm2BkiqyGvJwSiK9usEQTotfwSs
	ccjHztTY1Mc+QOPV8dAyAIELwQSGj1NOua4Fj5jvKph9wAOzW0L/3gr/w6sgluPdnaFJ
	T+TPQwa02GQEpdDLCLT7w4dbUAUVyjW+GE11xV31QisUcCEjWJgq16rjglq9m7tuiff4
	rKgmA2Ay8OvRVmRFYzYqNzZPscqcRGKc+yi0fRlltGao5tyePrs8GlS5RqVN2UnaQoqO
	xUeDUcy3gsFiYR8auk/UZWv+64Ziwi6zPVfIsP5pFbQCyuEZn3jQIyEDfvjc44tA7lAo
	NOJg==
X-Received: by 10.52.35.20 with SMTP id d20mr66599433vdj.50.1357297396062;
	Fri, 04 Jan 2013 03:03:16 -0800 (PST)
Received: by 10.52.35.20 with SMTP id d20mr66599429vdj.50.1357297395972; Fri,
	04 Jan 2013 03:03:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Fri, 4 Jan 2013 03:02:55 -0800 (PST)
In-Reply-To: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356342794.git.alexandru.damian@intel.com>
References: <cover.1356342794.git.alexandru.damian@intel.com>
	<bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356342794.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2013 11:02:55 +0000
Message-ID: <CAJTo0LaFR3DZWN=x-wk1s2xyyDAmdFKzvzTbmgrwfX+z2=e4zQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkHfBqT0dRj1AkwfXuQKEYhorCrJrGH3Zp7bh1N1Ql/WslEtIq+M35VoIBiALcXOt1sVCa4lnxHVaV1kFRkf5GV6V4rggaVtQjz1d54jLSjMwvMsoiGnHW/zo+r9cG9Cfq+zE+KAXfxb/txV1ZKW8gKO5gTRmLZ5rmNlc/aXaU5QTZTu4pWjlAWFATUV2Myzu7IQ9sW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Wayland userspace library initial 1.0.3
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
X-List-Received-Date: Fri, 04 Jan 2013 11:18:53 -0000
Content-Type: text/plain; charset=UTF-8

On 24 December 2012 09:57, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +do_install_append() {
> +  sed -i -e '4,10s,prefix=.*$,prefix=${D}/${prefix},;4,10s,exec_prefix=,exec_prefix=${D}/${exec_prefix},' \
> +    ${D}/${datadir}/aclocal/wayland-scanner.m4
> +}

You can suffix this with _class-native to show/ensure that it's only
intended for the native case.

The use of addresses seems fragile, would it be safer to inject the
paths pre-configure when @prefix@ is easily replaceable?  Thinking
about it, why are the paths wrong in the first place?

Wouldn't STAGING_DIR_NATIVE be more correct than D?

Ross


