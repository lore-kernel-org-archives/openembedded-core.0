Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TDfXq-0006YH-PB
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 19:55:42 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Sep 2012 10:43:02 -0700
Received: by oagn9 with SMTP id n9so5147795oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 10:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=gaE19QH7o6a7abMGfjq/lEyPSxiUry6VfSMg85MnVwE=;
	b=Y83pokNRrL2i+T9VdEmq542e57Hxt2VmMkVB8JnwPPl8HHQGy74ctdGeewpHtzdRNJ
	gRAE68Kwr/6hHI4gFy+SaS7AOShOoba+myYH9tYzAiWShS+0tmgTI2w+OUEePq2QQOGA
	Fkojto7fzbdqywBxBG9+3pUSRSn95ZFdiMd4yKK4uCjRE6NAOIQPZpuIjR6CDcbEPC2n
	c+xZi3GkB0hGSB5BJv6jGLXO3qT8qEsXc0AGmsHcv9RGlHqKomecTm63tboO3+P2/CdR
	wLylEehWEGbQVqFnwlF6RG4jWlo2nJ5Mxa/WaL4dQsPVSDDMx4MxEU78LeX+xFuD7sx1
	Umpg==
Received: by 10.182.43.40 with SMTP id t8mr12638233obl.93.1347903778322; Mon,
	17 Sep 2012 10:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 17 Sep 2012 10:42:37 -0700 (PDT)
In-Reply-To: <505753AC.1090809@windriver.com>
References: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
	<50575042.3090405@mlbassoc.com> <505753AC.1090809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Sep 2012 18:42:37 +0100
Message-ID: <CAJTo0LajpPGxzjXsXw19GJqERFbVihU_fd1js5PpV5Usm2cTug@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQm3EvC+MlBaw16SLP2DjOo92hUf5W9hx9P+U87pjUXQmd+WKWC+g8hg8yghVHNsmAkbdtFA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: Modify RREPLACES for RCONFLICTS
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
X-List-Received-Date: Mon, 17 Sep 2012 17:55:43 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2012 17:45, Mark Hatle <mark.hatle@windriver.com> wrote:
> This is deb/opkg style syntax..
>
> <package> (<comparison> <version>)
>
> So it means ${PN}-module-exa will conflict with any version of ${PN} older
> then the current version.

Does this actually work?  I was talking to Constantin earlier who was
attempting a similar migration path for the netbase package split and
he was having trouble making it do what we'd expect.

Ross


