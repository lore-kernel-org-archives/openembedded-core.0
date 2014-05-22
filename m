Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (unknown [209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C596960196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:10:31 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id i50so5335948qgf.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 03:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Vxi+aXwbQrXa0XOW2yf7/V75sq/YCn23WqJMSHq2tuw=;
	b=SBmtublsHKbk1w8hFzsxtaTE3tmxpmAfu6ejvnlgUQRhRKSq3VAnWcWOsAuM/a4KTl
	oaB3N3sPKzRnCi6LGm/wymMooc/PcVaSfQ7ER8jqYkq6Iz3ALFr+LreMhN0G/cs+7mO5
	gaBQ9NPyRWQwiHuBtZz5f5oMRGaukBQcyYZSF7VIhYPezxIhLKhRPR60suSXSaGR9JQe
	YmIrtVeC++fRMcDs/vfDksQdLsOst8DNrHI05x0EzSShYRLNQqn6CO9nKsSEGhXxNMGU
	/cFVbxH0ZH8G+voezUXTRqWYeDc0GZv0RMhpP/arcK/izc5VIBOKGMY8PzJYrcDB3I1s
	K+hw==
X-Gm-Message-State: ALoCoQmiaos9xrLmP/LQieQuNFpOrWsWK91XkxG9WapmwADXg3+tGmvEfj0zvXwuEmlodLi5r5w/
X-Received: by 10.140.109.70 with SMTP id k64mr74561705qgf.92.1400753432901;
	Thu, 22 May 2014 03:10:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 22 May 2014 03:10:12 -0700 (PDT)
In-Reply-To: <537DCA50.2020106@gersys.de>
References: <CAPbeDCmO-PZOr+8uohAQy5cQR4LPV+-3=048hhLWAijuU5cNWg@mail.gmail.com>
	<537DCA50.2020106@gersys.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 May 2014 11:10:12 +0100
Message-ID: <CAJTo0LY6+fwJAnvgq-BUAp=kArxosj9J4wYRsvh42QvawfScpA@mail.gmail.com>
To: Sebastian Wiegand <sebastian.wiegand@gersys.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/16] CVE Patches and updates
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
X-List-Received-Date: Thu, 22 May 2014 10:10:33 -0000
Content-Type: text/plain; charset=UTF-8

On 22 May 2014 10:58, Sebastian Wiegand <sebastian.wiegand@gersys.de> wrote:
> Reworked and fixed the error message, too.

Can you send this patch using e.g. git format-patch so the commit
message is correct, and add a signed-off-by.

Ross

