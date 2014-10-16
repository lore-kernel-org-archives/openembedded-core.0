Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3D74A60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 21:31:45 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id w8so3003055qac.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 14:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CZan8iRopiCSV0t01LbAUMMKpDidS4SE070KiaqoFMI=;
	b=SG1i0/JJgBeQnTPhOpOIyADOkb3kg39WEgYT0kb7Unjm6wul+1ToFBC09kQ++YmGb3
	QWfgrCMG1gTtloEo3kPVxu68wcdpZx/5nwMtjyvHPm0bWfRSV7NqtQdv6pKwuA9Tfst2
	oyc2MlkP/g5j+GjWUvqImOLPQilTwfs5TfI67tvUM9UElvOj7ERYhp6g9jTbOrh6GgnK
	MWbiKQCSL3O1Pt08d4vKCIrU5XfQQnB1IRWisHyI9oN+etzdST26KvEcRxywA6TZhf3p
	hfJn4sFCotYOCzx+MLlQ7n99ojNcrwdbN5O3S+9J301BDo3zqPdzEo6B6tJP4xx+yF3G
	hGyA==
X-Gm-Message-State: ALoCoQkttXJyUvjtbtIby7oyMstqf1jwSfF8rEON78yUj5uhUQe82RKUc21Frc6eopENqi05/lCA
X-Received: by 10.140.30.53 with SMTP id c50mr5923890qgc.77.1413495106143;
	Thu, 16 Oct 2014 14:31:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 16 Oct 2014 14:31:25 -0700 (PDT)
In-Reply-To: <CAJTo0LYZHWzJFtt3xZksna7dj7qx9Esqkn+ONwRBz=S66-sEJQ@mail.gmail.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<CAJTo0LYZHWzJFtt3xZksna7dj7qx9Esqkn+ONwRBz=S66-sEJQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 22:31:25 +0100
Message-ID: <CAJTo0LasCv77b3-Uk6CcBAhgOq6za09_piEoM_eKguFOnuCN0Q@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Oct 2014 21:31:49 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2014 12:20, Burton, Ross <ross.burton@intel.com> wrote:
> Does this CVE also apply
> to readline 5.2 that we ship as a non-GPLv3 alternative?

Answering my own question, whilst the CVE report says it affects 5.3,
the vulnerable function isn't in 5.2.

Ross

