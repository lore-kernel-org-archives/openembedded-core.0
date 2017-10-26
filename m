Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B0CFB71B1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 21:33:40 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id y39so4480014wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vaT3Rxf1gbQUySo851dOxG9vOrAzWkSseNtaQTpMeM0=;
	b=ITeDuRQNn5rzIEjT2QyWCXyf8E2HCd5851A3Wtuc0dzzwzLY9Idgl9J+zYm59yWLZn
	axzez68z632QTUkkptpatiiAK9IpyPw2AaxXHPClJU7UWnV48HsTQjWG2V6dZn6C8JEv
	zmRBeiSkYGIKpXgE7ctjfYMLylUn2KTjQtTQTL4aujE+591aAug5ewJXJRziftHZz3kY
	UBuuENQeNJ35ox0shqikY3RrTNarIYSnIiyF2Eel1hCkafw1O1t5jK+uAdluxtVyp2r7
	+jaudJIG6Bq4kFcivqrEUj1W6SY+Xi4E8UumuoPn14eIF3Uq10+8Kiu0LzXDeZmF1fro
	WC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vaT3Rxf1gbQUySo851dOxG9vOrAzWkSseNtaQTpMeM0=;
	b=PJYY4FZIt0Q16X0isWQKH5KxoOLF7prQkW/YHkuzVM4A90wS/m13c+P4kIa0pW7qB2
	Jm2H5tqm2Y0a8QC2wAcLtD26Dmu20Uohf0nhDr59vn+lVZ0dHhbIeKR48z3itxNMJsXi
	m79bqGqZaBo7n4IigyChiAgx+sXbcUpBXgtKEjJyVEVgFDGp8gK+eG/wXsFnn1UBxADb
	udD/dh1OwzTfRjxCEuGdIYKrR9HVLVVY0x+1BE6k0CU8JUpxZ4YJZ0lYXzd5NQhS+65U
	grWHuc+UsxEGnTGVGCyuGGoGQRlbjvm1UsFPtmQ0PX8p7lsaoW8+JS5XlfNg5i4UkNn6
	mZuA==
X-Gm-Message-State: AMCzsaUY8AG2uY9FJVicOi0oGmPNIkBURklgffptdxBf6KsatTuYxJnc
	2tF50gSYYGN0GnCVbgcFGYPFcgg6zjDHNOkscSk=
X-Google-Smtp-Source: ABhQp+S8XwiuPwLcqK49fKYPJe64mVzcf7R49l8yeukZUD4YQOxAUSaL59bERWXj+R7fuAz85jt/TUiumKqa4IGwAew=
X-Received: by 10.223.160.161 with SMTP id m30mr6275190wrm.27.1509053621459;
	Thu, 26 Oct 2017 14:33:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 26 Oct 2017 14:33:40 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
	<CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Oct 2017 14:33:40 -0700
Message-ID: <CAJ86T=UBBYf2WBsFsm2c-g0tdPvgtabgaz3zFNbk03i8_4U02A@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Thu, 26 Oct 2017 21:33:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 26, 2017 at 1:51 PM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> I think values for the BACKFILL_CONSIDERED can be used, but only if they are literals.  I don't think any variable expansion occurs when getVar() is used at the point of backfilling.

Maybe the assumption is that MACHINE_FEATURES_BACKFILL_CONSIDERED will
only be set from the machine config and
DISTRO_FEATURES_BACKFILL_CONSIDERED will only be set from the distro
config. Don't they work even in that case?

> I think the a better way of setting MACHINE or DISTRO_FEATURES would be to directly append/remove  using overrides.

Yes, of course. If you want to control machine or distro features
directly that that's the way it should be done. The BACKFILL
infrastructure is there for a very special case - to try to keep a
consistent behaviour for users who set fixed values for machine or
distro features and don't keep those definitions up to date with
changes in oe-core.

