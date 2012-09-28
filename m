Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THc8p-0001cC-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:06:11 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 07:52:59 -0700
Received: by obceq6 with SMTP id eq6so3177128obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=q7WaxQZvVOG7Hk3RYHLo+9NEL3LNmO38MFViwBWViGY=;
	b=LkCN8xk4bjdJgY1boIWOWb5Nz9ZPeCTWK7sF2RRbHWAdPr0/q54GLu6cYK/ttn4BFY
	nXtaolww1CCynXdJP1cm9GytSvRTarXD30t3aVfShrng2gGYuOMEiex+xNs/6JVaXZiw
	ZpedKdhN308gmo25kyb40cdHiJGP8jla1ymIYEtlvt1PdNLMFUi3igqTj7nvcURPyBkz
	FJqXUv4Duh+oLCL9o+pust233bdry1o2DaJz9ZIYWPAvsvIYxO74Bnou4CBzvuqySRGP
	SfQh84NHGYlfi9P3CzAUo2FbOcY2NMbjDggZWrbMLxTzS5Rn178sW6Y30su4lqXP2Gxm
	v4FQ==
Received: by 10.182.179.100 with SMTP id df4mr6078221obc.59.1348843978247;
	Fri, 28 Sep 2012 07:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 28 Sep 2012 07:52:38 -0700 (PDT)
In-Reply-To: <1348795994-21695-10-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-10-git-send-email-msm@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Sep 2012 15:52:38 +0100
Message-ID: <CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
X-Gm-Message-State: ALoCoQlP/tZaPEBHKBpFn0cSDItp7RABiQz4OUgSth+ln1jS66DpEvzfy3AQYZPdW/ThsPrp+frY
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 10/10] libx11.inc: fix build issues for older CentOS distros
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
X-List-Received-Date: Fri, 28 Sep 2012 15:06:11 -0000
Content-Type: text/plain; charset=UTF-8

On 28 September 2012 02:33, Matthew McClintock <msm@freescale.com> wrote:
> Fixes these sorts of issues present on older gcc (CentOS 5.x in this case)
>
> | cc1: error: unrecognized command line option "-Werror=implicit"
> | cc1: error: unrecognized command line option "-Werror=nonnull"

Took me a minute to realise why this happens.  This happens when
cross-building because although configure is checking that the flags
it uses are supported by the compiler, it's only doing that for the
cross and not the host compiler.  Right?

(upstream bug alert)

Ross


