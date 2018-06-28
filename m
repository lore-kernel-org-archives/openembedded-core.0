Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 835B97470F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 12:55:51 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id s198-v6so1192639oih.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nuvZ2pYqP0w2TeRePJ2EuGLDmvTRPXIqKiSGR4T0j4k=;
	b=yJZYHrgLMNVUDASoRT/2LAMbL13KfTyyz9RpKHSFx0aJU+VgXl+U7pseolzRt+SbBb
	mSD4WexL3LGt7vW5k9ZJAeQ6DlKshLb0PcbaL3Qjq/5CKV2Xy6Idp7ydn8s/tOfhiiei
	pfUD5R06GfsVjOFDcZKuRnmPo1p59mShON0ODO+flZLMB438uPHTmd9NdVb+tWNm6jdp
	eNo90V8OZkiGeT5umXIwFs8XRxB6m8dtqPs/PZclZjf9pJ67P0bg5B3gharjwo0CK1Pq
	6PfpwpXoPX0jWt5WiABSggrZrFFZ4r12HSj0wnrnb33R53FB0PjqXLnn8sKF1uuOLIgF
	h6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nuvZ2pYqP0w2TeRePJ2EuGLDmvTRPXIqKiSGR4T0j4k=;
	b=bqzCAxWMteeDJg+7K737ZL/N4IT8K9X889mGPm9gOVNhE4A8dKQFAMhz/JiwGVl8RR
	7KiOnOvk1moVKJbtf+C5DEwkylf1qBulb3mw0AbvhXbFotoElgze9MCz5RssSawbeSKt
	ic4mZxeghTMvYgCBk105IJuXER7kkfyU/wuFbRHknd5mCBoHW02LTuxbADQbSus7wCwP
	eDgBRfahJe6GKwPBFW7biYWWIAQ66WxeMb1DYC9uhzUD1xAds+pz3K1nOJ/Vn2acmCQa
	uOJ+JNStR7mXVGrhyLCtxGdVkbMk0MNBN57I1YbKcNxlalDznbqA0alG0BJ3ZwXSNz0J
	oVSA==
X-Gm-Message-State: APt69E0SIQUNqF6ANrGjXNv/mt3PVc14NvEKnvfp0UqGLFbjkug3NBoM
	oruLZh0xCtK1QOokc2Zlnm5B/wn1ov/o3hF4GIHYGA==
X-Google-Smtp-Source: AAOMgpdPeJBLe00qDwDvTNyZyrCOY7fvEAMSftJc5diMAKjSPAHpNgf/M6IYeEd50baZnIpb6aZ0dh8Zm1eI0BLteMI=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr5922673oix.235.1530190552364;
	Thu, 28 Jun 2018 05:55:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 05:55:31
	-0700 (PDT)
In-Reply-To: <1528165980-163833-3-git-send-email-hongzhi.song@windriver.com>
References: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
	<1528165980-163833-3-git-send-email-hongzhi.song@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jun 2018 13:55:31 +0100
Message-ID: <CAJTo0LY10iykY=1Q0=xMtbZjHEgMx2_4cF-yNuB+96x4vEjpdg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][PATCH 2/2 v4] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Thu, 28 Jun 2018 12:55:51 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 June 2018 at 03:33, Hongzhi.Song <hongzhi.song@windriver.com> wrote:
> +    # kfifo
> +    @OETestID(33)
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    def test_kfifo_test(self):

These test IDs don't exist in Testopia, which is what the test IDs are
referencing.  Presumably they're internal WR identifiers?  Please
remove them.

Ross

