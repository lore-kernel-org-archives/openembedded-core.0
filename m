Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Uak7t-0006UA-6C
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:00:36 +0200
Received: by mail-vb0-f54.google.com with SMTP id f12so3330852vbg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 02:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LBL9swADGpHDemh7gDmBAfrtvHOo0oEscLbtRyxwPUw=;
	b=j+sSuVeR24fXaWLNl8u9Qs+jR1TPoV1fEIFUEHeGI/3Vbtm2Z07Z38Hsc3IZGshA1u
	okHHRSu/mZWXSTvFxYjBnQHKdN33W+XQkqKDbhR+MYxBkMfXd6uIswSKtTPZLiwCbCrT
	Aqeu3r/uVGEAaMh0XPRx76vt6Ag+gJqv3GdzkIAUry+WOlQjVvSURHn6s8TMPDhRHNEw
	908xCs0z+7uk/B6IqFMcL62Kx9cSNjcJ5y64bvnumlee4mZjR68naNMc3TC9kWRejsav
	2QK5XWhFr0aTn3TTBfhf6HK8w5ITTa8eSHZGBPSBRnMI3ILKc45Jke2IMaD291WNZzsg
	sRRA==
X-Received: by 10.52.174.41 with SMTP id bp9mr8898706vdc.4.1368178947848; Fri,
	10 May 2013 02:42:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 10 May 2013 02:42:07 -0700 (PDT)
In-Reply-To: <1368054238-21389-1-git-send-email-jslater@windriver.com>
References: <1368054238-21389-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 May 2013 10:42:07 +0100
Message-ID: <CAJTo0LZW4aw9eKoXg5zZhV9-ncSWpWD=AfgW45HQrQadqZatAw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
X-Gm-Message-State: ALoCoQlXaiCQ6kDkmuQNXp1juLJiI0brc6xsWvUPl7SFyFj1CjEVRqgaL2je/dS9PnheH29sbWf1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: modify bootlog location
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
X-List-Received-Date: Fri, 10 May 2013 10:00:52 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2013 00:03, Joe Slater <jslater@windriver.com> wrote:
> The default location for bootlog is volatile,
> so we change it to something that is not.

If this is a problem, why not make /var/log not volatile?  I never
understood why the log directory was volatile to be honest.

Ross


