Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 58BA8609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 12:12:17 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id c9so1565268qcz.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 05:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UXK/ahAzDpdBOzHwNdmHPUKKe9ecrIl526zg/4VuJEY=;
	b=aIcDLpYUtKPeejLcX6jBe12k54+VJ+nQnA/BdK8nLj2eHGPBljwdNKQs0mMY6Pnsmi
	FEwii/bJtbbzfKX7JrNl//olau2nEhPSGlP7qzKPuyqRNTCNYsm0WKHnG6w1pqJpk85W
	9Q/e3bNFuP68P93fB6tcHUMVvJ8KmCu5CTvZVBLBY6JnMP1BN197Qb2t71WjAASIkw0k
	RLB9fvXUZ0jJdK2GQuZI95tCdQOE6+d+1meIMatatpfcpuGu0CQnnLhdhv3RY0S9VczB
	Hh9MNVpmqwyogvG7rNt7FK+0S2ExUVATY4Ch05it+fQMdSp1Ctwii6a/gB+eMuueSjR9
	//aQ==
X-Gm-Message-State: ALoCoQmuIPZ0+u3OfSYgTmcKc6CpaXSwQhe3OOpo10s9TmT7+J5XKR07R8oQxVwMKPD888rsrfb6
X-Received: by 10.140.40.84 with SMTP id w78mr18188477qgw.87.1411474338200;
	Tue, 23 Sep 2014 05:12:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 05:11:58 -0700 (PDT)
In-Reply-To: <1411355889-28946-1-git-send-email-rongqing.li@windriver.com>
References: <1411355889-28946-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 13:11:58 +0100
Message-ID: <CAJTo0LaT1nDpoi0Ftuh3S=jSAs9NfqPVj=MyYc7bME0-2By5ng@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pinentry: add recipes
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
X-List-Received-Date: Tue, 23 Sep 2014 12:12:21 -0000
Content-Type: text/plain; charset=UTF-8

On 22 September 2014 04:18,  <rongqing.li@windriver.com> wrote:
> +DESCRIPTION = "\
> +       Pinentry is a collection of simple PIN or passphrase entry dialogs which \
> +       utilize the Assuan protocol as described by the aegypten project; see \
> +       http://www.gnupg.org/aegypten/ for details. \
> +       This package contains the curses (text) based version of the PIN entry dialog."

That last line of the description is incorrect.

Ross

