Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8FB7135C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:00:51 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so6463299qaq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F6n2vB7mImrXV/NGz1UJPIZIvC8/dLcgNX3JPn64HMA=;
	b=IH34awaHc+o67ZDOrqFVIdMXasvZQ6e+68VaJspkMZTdRcIsvYCFsCQOgCj2xLGZOU
	t6qJST0eVTxMZXqxyP3ISMGtBZslWQJmbT6TcFpUX18TqQTGg6bEK3uUAw2+QBZof6W6
	kOyna8BcEOZog3psfrXMTj54oxzs4CbAsbXOgGHdZzzEwz2MKE9/QdwSGdlOBHuvumWr
	DXzb0cA42UaKCw9/cMJPXdpx8bfA9WNZasU7wjcuHOsIgWr4Fw8cj5ikXUJdYAi25IFU
	4PlpUSzQxre5w8sNjJlP8As+f70OUYJG/jl6Tt8FP+JQsppycE8Knav3jYC/zYlKRDUS
	OUgg==
X-Gm-Message-State: ALoCoQkerJ3eVTQyLHHwtSvinvi7C1ipWcOXx1rq0y4tD8mUs4/fvfluty2AzLRzLRalcShmVLN8
X-Received: by 10.229.137.131 with SMTP id w3mr56235536qct.23.1409670053174;
	Tue, 02 Sep 2014 08:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 08:00:33 -0700 (PDT)
In-Reply-To: <09976ba7b8afef4bca4ac35d9a66f08bfa98a047.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<09976ba7b8afef4bca4ac35d9a66f08bfa98a047.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 16:00:33 +0100
Message-ID: <CAJTo0La+ffRiR5btGaJyUa1N3pFfPdBqdXDMAFoei0z5dxWCzw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/26] systemd: add support for executing scripts under /etc/rcS.d
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
X-List-Received-Date: Tue, 02 Sep 2014 15:01:01 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
> This patch adds support for systemd to execute scripts under /etc/rcS.d.

Did this patch come from the Debian package?  If so please state this
and include a link so we can keep in sync with their patch.

Ross

