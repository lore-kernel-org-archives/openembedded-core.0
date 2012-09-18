Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TDw3U-0008Bg-UU
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 13:33:29 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 04:20:47 -0700
Received: by oagn9 with SMTP id n9so6001281oag.6
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 04:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=pXqVrDywK1uhYRGWnUap/Pj7iqT0t3Q1n2g6RY6P3fk=;
	b=jl7B/8ccoA8PDS2o1Lh6Cfu4sYqeB6zvWhKAEIkxhge11myNIw7+edcD4kz/PQp9jV
	/OIRVmA/uXdj+xXbbQduKNELkl8tGgqhE15GnTk+yTF7vS8odNbSlEYqIhpX40csqgpa
	cYvJQU1x7Syhd8do/3MFFWGg6LMxTRq1/gEtKR4/5LCug2LobxX3jSiefPdbe5rfgxPH
	mw+sy1hCmPOJdbONTQhatEY41XqDVcKkJ5CF1j+ME2/YQwKDQYzLwGkEIdFvWL/w/a6Z
	y5WVIPV31EedVMi8Gywv9lQSUGsNrx9W/V/itKgQ/Q0IFawP8tKKj2aSfo3QdfYxhU8/
	V52w==
Received: by 10.182.44.7 with SMTP id a7mr14762823obm.80.1347967246220; Tue,
	18 Sep 2012 04:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 18 Sep 2012 04:20:25 -0700 (PDT)
In-Reply-To: <1347958808-20182-2-git-send-email-marcin.juszkiewicz@linaro.org>
References: <505837BA.2040305@linaro.org>
	<1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1347958808-20182-2-git-send-email-marcin.juszkiewicz@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Sep 2012 12:20:25 +0100
Message-ID: <CAJTo0LZg-u9dePdVbM+zH-izFjiE99Ks9aRKt1=_3qZFQWnhZQ@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Gm-Message-State: ALoCoQmxky5ud62ZZ965Muu92L3fNxbfzkodQ7ugmATmwzk188wiceUD2F/x+3gcHpbizyy9ynCM
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] db: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 11:33:29 -0000
Content-Type: text/plain; charset=UTF-8

On 18 September 2012 10:00, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> +# Update gnu-config files to version used by OE-Core
> +do_configure_prepend() {
> +       install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
> +}

Why can't the autotools class do this for every package?

(IIRC, Debian recommends this too)

Ross


