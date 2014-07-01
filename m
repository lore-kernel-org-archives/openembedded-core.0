Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id B189D60169
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:56:55 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z60so3895996qgd.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 13:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VJ6FctHn8lv2wDdl1fM02hMlFXzEMkWjDnTyFbneQQU=;
	b=llY2d2E9qVltM1ARmrVxAF8gyoMStS9qCtO8aiE8vIpeKaV+7feWn7MCRE5aadixWa
	yfdIg65F4vibpsfUfRyKzFkn9i4yX4wtwyUKkK/D1hSNZC+2Cp+871kS+iWxHoUPItxK
	fSpeiSUNMP8IesIvJIg6bHpJpQfHYW9f5b+4YxpUHFgDdXpP47/gwlq+ExurqVfPOCrN
	Fw31z0+X0K1n/sCRGTs3i5wHH1mD/vD5S35UiswcPXZIzcLaOqOZKmlVcDl2nNU863IF
	xSHI3eVuM8yACy8tSoCMT0KEjVgPa4sPhT5llmykGUeLmQCxw8W/762DPLVr3MtSLiCP
	1y0Q==
X-Gm-Message-State: ALoCoQnPcjt3Ge00WJrrO+RzJc84idX1ZxSVchjv7FrtcfgPMtEQr/lK6tdlQcDLHMbQx25r0J5E
X-Received: by 10.229.13.134 with SMTP id c6mr73994658qca.13.1404248216354;
	Tue, 01 Jul 2014 13:56:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 1 Jul 2014 13:56:35 -0700 (PDT)
In-Reply-To: <7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
	<7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Jul 2014 21:56:35 +0100
Message-ID: <CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] db: Uprev to 6.0.30
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
X-List-Received-Date: Tue, 01 Jul 2014 20:57:03 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2014 21:01, Mark Hatle <mark.hatle@windriver.com> wrote:
> +LICENSE = "AGPL-3.0"

Presumably AGPL-v3 has the same clauses that caused
INCOMPATIBLE_LICENSES to exist?

Does this mean that we should update the documentation to add AGPL-3.0
to the list of licenses being blacklisted in no-v3 builds, and that in
no-v3 images we can't have rpm on the target?

Ross

