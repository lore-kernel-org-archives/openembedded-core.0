Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1So9n9-0003XD-Q2
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 10:58:04 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 01:46:53 -0700
Received: by qabj34 with SMTP id j34so1375579qab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 01:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=HUp5ddhOz/Gjaoz45Nbj0n7xW6oZ/HSMcl4wk1hWkEU=;
	b=M5m0wrhssDmOJoldqGXKa0UKd+twJkH8ez6Qx+AWAFG4SeSxwTnBZ6kJZbXxccy0hl
	qcHhEYEtwzVYwyVd7vxSEjzku6s8w9EWhn/fP5br9b/4hRJeLyKZa53ZvnWJs1jqqKj8
	DrgEMAwFG3RfgeTKaDorOq89yFHFBBj91qVSBNIGFFyxMoOoH3TUwFlJ306iNZiVtuS5
	TMneZH/gYWPS4C2XTSc8MxzS5qg3V/ws7Ys60BIg55MvrCiLOkMlok1b5VxmwWoclRLc
	i6LV7nxAG/sISuD1NAbKQ/rUx6bmi+xmah+gmTQibL6cKe2yOlihEGKpRftl2xJZ+I8Y
	YahQ==
Received: by 10.224.39.75 with SMTP id f11mr60506594qae.70.1341823612212; Mon,
	09 Jul 2012 01:46:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Mon, 9 Jul 2012 01:46:31 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207070604390.17884@oneiric>
References: <alpine.DEB.2.02.1207070604390.17884@oneiric>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2012 09:46:31 +0100
Message-ID: <CAJTo0Lb2Ezy9LRtnSt-zWic1SMX2kQfroYm8bnEFyCJ=8_WvTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQksxtPgCOslKhQ3PfzDxJy/9Fe07Fi+4m0Wcma1vBHAVUWel3l4ZH3LqxEriEn7SwdCfaT5
Subject: Re: fetcher protocols not worth documenting?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 08:58:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 7 July 2012 11:06, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   currently summarizing the variations of fetch protocols and a brief
> search of oe-core shows no apparent uses of any of:
>
> * cvs
> * bzr
> * hg
> * osc
> * perforce
> * ssh
> * svk
>
> so, under the circumstances, i'm just going to ignore those.  and
> isn't svk entirely unsupported these days, anyway?  or am i
> misremembering?

It's probably worth documenting that they exist so that potential
users don't get put off, or re-invent the fetchers.

Yes, svk has been discontinued.

Ross


