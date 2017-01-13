Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EAB3F605C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 10:52:22 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id v23so43907789qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 02:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mSNQtaZVkzMsugxssFH2lGP+8hl3IIjh2dNvd2yNFqk=;
	b=KZ3ATh+JcmY1+jottX5KEuyyw69mxyzhLqLAPm1L1eZRV5t6RCQbiphWE3tG3lTtzN
	RqsbN7wgEo9D9q5J6vXFrXYUMuhhMJvcUl6SVmTwAn7GRWY7mRKEobMeSKN3phm7fGwt
	1g5QRBW5+iXqvSCUwPM57IDBCDcE4O/3HzFtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mSNQtaZVkzMsugxssFH2lGP+8hl3IIjh2dNvd2yNFqk=;
	b=BkOCKY1qGunxcPRSQY97Hp5K9SNyCmEuqCHHKorowKcEXORjyc9byzIoyWfv1WPArR
	CZkC3elSMSKmo7OegGEBIPlSc86Nfsw0uwiXpYMIYRy1ZiTSzQ/rs7oYtf8OZNr5ae0o
	kiD8S8aK8kpiWehpJ8Lv3WeGJf420kgcx9Jc+LdR99B5ZqzElnTZ/ZYxYYyp6Kk/A7UV
	RXumJzeotdfZCtywR64wzpA56b/73sKUkxSrYX/dnbOJI434j4Y+rK5jzORtCsOrgul5
	nyn1OBex6pBHzGN9TbNMWc3Czd9gio1jSozmSrnyQzfkf3qR5xQ7odcdS4TJtG2+NywW
	fSgw==
X-Gm-Message-State: AIkVDXIdRAW8xqBn88B2lHyOhhnl9q9/foBabuHHlfACksRJI+6XdksuFNj5iYI9tNZY1A3Gd291hFDTCL3I0k8i
X-Received: by 10.200.53.71 with SMTP id z7mr16828074qtb.203.1484304742725;
	Fri, 13 Jan 2017 02:52:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.19.82 with HTTP; Fri, 13 Jan 2017 02:52:02 -0800 (PST)
In-Reply-To: <aebeba45c22d2749a821849d93ee99e40712601a.1481549486.git.jussi.kukkonen@intel.com>
References: <cover.1481549486.git.jussi.kukkonen@intel.com>
	<aebeba45c22d2749a821849d93ee99e40712601a.1481549486.git.jussi.kukkonen@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 13 Jan 2017 11:52:02 +0100
Message-ID: <CAP71Wjyn-=gb2bLYrmNxw-Yngxy1=dVssCna=OtD8ktJoTWj3A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] piglit: Package tests in compressed form as well
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
X-List-Received-Date: Fri, 13 Jan 2017 10:52:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 12, 2016 at 2:35 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Modify packaging so that generated tests are available in two forms:
> * piglit-generated-tests contains the tests as they are now (1.5GB
>   when installed)
> * piglit-generated-tests-compressed contains a tar.gz with the same
>   files (45 MB when installed)
>
> Add wrapper script that decompresses the tests at runtime: this
> requires 1.5GB free space.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

What is the status of this patch? looks like a good thing to get
afaik. is there anything needed to get it merged?

thx!

