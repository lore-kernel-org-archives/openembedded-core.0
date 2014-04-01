Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B18F6EE45
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:17:01 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id i13so9392764qae.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 07:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lOM+b/Be1J37EnvhCBFqmCxMQz/ZQPczf3SlTxll1N4=;
	b=ANYOq5W27GWMxqZT5xnoNgujM4nkAi9dGQVmB1oDIUjuAC/hYI8HBSI5lG8rG+vuer
	Q4oV6PHLiWvI9c+M0SqGN4XQes+8LM8fctleKHPpoBv0lyPn4zEvvPvkSlpG/JtY9QPC
	JispXsJsexOvm0P30sxEauNgpuzCiDFW5de4elMRjMOhsfW5rNu2/woES81/dBx/c47o
	1Awq1kIz3MXfoMJ96opAdiFWG9uj6SpFrJlJDXzJWPAAqS+BMLIKK6yb+aZYNU4PhK+P
	FsHGOvtIp/dGtBSoRu7fRBQ2JUj9MppmGbYrlurKW9JMO+NDWrK+T8DusemD7N4xPCRs
	CjXg==
X-Gm-Message-State: ALoCoQnJleP+wFm6RMt5SNjWUJ7ENjnKogFOuab9/4U/XefG5y5h4SUxvbm2K35TUChtUvk7SYRV
X-Received: by 10.224.75.5 with SMTP id w5mr16491791qaj.52.1396361822392; Tue,
	01 Apr 2014 07:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 1 Apr 2014 07:16:42 -0700 (PDT)
In-Reply-To: <533AC1EF.7090600@windriver.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
	<1396349467.1432.4.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76D4F@IRSMSX105.ger.corp.intel.com>
	<533AB0A2.1000608@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E2B@IRSMSX105.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E47@IRSMSX105.ger.corp.intel.com>
	<533AC1EF.7090600@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Apr 2014 15:16:42 +0100
Message-ID: <CAJTo0La=GF4A5vzO86pqJj2HLjAeKdLYEUN=Q-0+5qpCn4LH4A@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 14:17:05 -0000
Content-Type: text/plain; charset=UTF-8

On 1 April 2014 14:41, Florin Sarbu <florin.sarbu@windriver.com> wrote:
> Well, as far as I see it, these 2 packages (connman and libpcap) are aware
> only of bluez4 at the moment.

ConnMan supports both, and libpcap uses the libbluetooth API so that
should link fine against either as that API didn't change much.

Ross

