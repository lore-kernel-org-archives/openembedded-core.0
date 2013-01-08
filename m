Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsW66-0005b2-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:08:01 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 01:52:41 -0800
Received: by mail-yh0-f71.google.com with SMTP id 22so435278yhr.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 01:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=xzlGIX9zyVIXwaWtk2FDwwGieSL30ewUS8Eqn9NLDf4=;
	b=PUnw3LIeXvaFdujOqTCWtStdr6omFzB4+/z9g4Roq8p5spNVDActtRCKUGEEukmf4W
	6o3sxY1NY+MLynMFLIBRz+EAHVOKT1Z2FtNH+eWiSL04jorP62V3AzWm7EjtW6JVpTa6
	8dmdGqIDGjg39bznt98lGBySQL2IE5ofCb0UTLN/BAsfN/9dY0+IejB/tnGiQuhdTayg
	+AeeprELex3dmlLPJmMuF3cUP/wMFF0vZKwFhogQoUp6QI+fUYEnnECz+V7KkArfVNfl
	KR7YqtCQzTvIhNOPao5laOf83wvOkk9QOz/SFt24LXJ/v/TwQWK7cahCYotsSE6bMEs5
	I7hQ==
X-Received: by 10.58.134.1 with SMTP id pg1mr803193veb.55.1357638759713;
	Tue, 08 Jan 2013 01:52:39 -0800 (PST)
Received: by 10.58.134.1 with SMTP id pg1mr803189veb.55.1357638759644; Tue, 08
	Jan 2013 01:52:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 01:52:19 -0800 (PST)
In-Reply-To: <b35b229be238eae6d836432bbdffca31803e8e18.1357574641.git.alexandru.damian@intel.com>
References: <cover.1357574641.git.alexandru.damian@intel.com>
	<b35b229be238eae6d836432bbdffca31803e8e18.1357574641.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 09:52:19 +0000
Message-ID: <CAJTo0LZtAYaxfBEXRaVMCana_DrVpLD5_oqmhQEwv4EM9xFPRQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQm68wmj8nwLpQzcO0C/ccG8eFcJY15nO6so8WvNejmEusGYUJyW2qKXN01bruF7CpWn9J1+51YXA0Z15joeZj4ibx2upbwSxDY2/PbqcvhRGmdxOTG+v/Uhq49V0jrJxCdXw9Esll0v74ErzDKhll2sSP2asGi8F3V8qQXWDV6ipRTlRMakXLhGrFYHv6eYzg/Qw+ep
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
X-List-Received-Date: Tue, 08 Jan 2013 10:08:02 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 16:06, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +do_install_append_class-native() {
> +  sed -i -e '4,10s,prefix=.*$,prefix=${D}/${prefix},;4,10s,exec_prefix=,exec_prefix=${D}/${exec_prefix},' \
> +    ${D}/${datadir}/aclocal/wayland-scanner.m4
> +}

My previous comments still stand:

The use of addresses seems fragile, would it be safer to inject the
paths pre-configure when @prefix@ is easily replaceable?  As is to
demonstrate this, you missed a @datarootdir@ replacement.  Probably
best to do a replacement pre-configure on the @foo@ symbols.

Also using STAGING_BINDIR_NATIVE and STAGING_DATADIR_NATIVE would be clearer.

Ross


