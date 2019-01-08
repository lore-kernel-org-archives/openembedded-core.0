Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id A92A160721
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 18:56:06 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id u16so4447117otk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 10:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a3fMeI2WzCnd42Cego/YTOBeRgiatt7T0cw3jLC/r2M=;
	b=at/iyum9ry0RCBgj8rvJO/xgasirhhNByDU/NQvro8QYeHpJrFjRVm/Z4Uu1WCcKUs
	8j8irY8+X5V+ziwMAojtq26FcOEkJWBCfcOLqV2aeLDPouDEulo10W8J+fGwZjEErKjZ
	q21iVUFEkDlEPfGFEvhTuX0PLtQQ1LGK0NN0v2ZPE0UynVl6x6FZjnyO18Y12zwC/Rea
	WxY4M1XkIA62zWmmFBUjrDfjctBe26UJTHkBCIJNV3S7asldaSMb+AXz8zkBN4egf+tq
	faLa8jcMAOocn6yAx3UroXPAOHWym9ioWNha4XGuIJyypZn8lWeT4KTlXlkVwePK0MiU
	7YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a3fMeI2WzCnd42Cego/YTOBeRgiatt7T0cw3jLC/r2M=;
	b=XSVme9uviGfI400WG2CX5ihoT2xi7DtwZPIYuD6vUAsEK6lKQUlrehE4UNYc802gBy
	87cePIfjZ6ktJPSMf07INHmfcSkQfmvmNKNJNgxNJRNmfRdw1xPjXbf1shmK3h2ZRLui
	IAS4X93BC9N/kW/nZl9JqO6emwAxKsq2oRzSmpdODUxX7iqwyLNAvs62NeCuQzNz6ILA
	80XWOjtVBBjtHerTP7CnhmVsfNp+6PKcRIZUQ/2lUSwzXpe0P7AqVMct1DNDBvaiVEOk
	F22w1PbUKsTXLOIqrShwjHYj+PUHxF5Ll/sMK3Cp+m6S9M64YZnDOxnQiPhvjvbHMbkO
	k3IQ==
X-Gm-Message-State: AJcUukfC+QUTMMAHFjOaAkI1jX87kF304dBKKvsEWr++gaf9Pr4eT2Dk
	xV2nD1yHxrzUnsSefBeacBM32rZFazcz9pcVBJM=
X-Google-Smtp-Source: ALg8bN44Nt4+GbDxO4KCnXkj/opJdqskgUJ5fsV5kR6RZHw15qWoaKf6AF00q2zK7s7jlIMkTEnfmlBTmyMtT3t6q2Y=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr1990951otl.153.1546973767864; 
	Tue, 08 Jan 2019 10:56:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
	<CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
In-Reply-To: <CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Jan 2019 19:55:55 +0100
Message-ID: <CANNYZj_gZFZpJaLkSSeabMDkFAw2oO+vM80H_q6o9cBsKaeycg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Reimplement perl recipe using perl-cross and update perl to 5.28.1
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
X-List-Received-Date: Tue, 08 Jan 2019 18:56:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 19:49, Khem Raj <raj.khem@gmail.com> wrote:
> There were several recipes in extended layers such as
> meta-openembedded which failed
> in last attempt, have someone considered the failures that I reported
> last time ?
> maybe Richard can stage it in master-next and we can give it another shot.

Are you sure you are not confusing this with an alternative attempt to
upgrade perl by Jens Rehsack?

I did test meta-oe, and identified one recipe (adduser) that needs
adjustment. I'll post the patch as soon as this is merged. If you can
test meta-oe once more against the latest version of my patches, I'd
appreciate.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity

Alex

