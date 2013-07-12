Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id DC49F6A465
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:32:21 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so8317824veb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cJtwrFBe3BzLz3P2RxsEMn2D3aMI7fah+1R30sY10a8=;
	b=IcFC0JHGR4GQiq4dIQyRALglFaeyrWApDAPt9qB2HN5IE91ZOPZAPhd1SAR9+qPQw9
	9jhnbeAzlYp8wl6ZU4ISSVNpKYvesRX0AEuaSulDWl/8MveJ33Ca36C7U4yrtGXTFl0t
	z72CKeyVisDPC+BG55rTM60t7aINsE7qhXP4ILOkvxXI6ofhTw+MBR/er5hhaqvmnQFu
	+8+reJzjj1H3LHVt+2GYUUSqZeD1m0tj4gBzKbC8bdv+PPuL2HrSx0JTquiqsjRBMVQY
	26fJloMak2WKOS93SXXqkxxQOwUtqkQ+04BVSlqwQSc2v4Z+j8Ax899YesIekz9+L2OM
	c56Q==
X-Received: by 10.220.73.66 with SMTP id p2mr24998208vcj.94.1373646742426;
	Fri, 12 Jul 2013 09:32:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 09:32:01 -0700 (PDT)
In-Reply-To: <51DEFA34.70405@linux.intel.com>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
	<51DEF360.8030509@linux.intel.com>
	<53609789-437E-429A-997E-7A1BECF21A48@mentor.com>
	<51DEFA34.70405@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 17:32:01 +0100
Message-ID: <CAJTo0LYmH8sDrpfYOhSd8WXKeoKGd-JiVu1EHMuj5vRLYBcxtQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlpZD2lmgaKrrWQbFkHoely17kW24oJwBDk2Bzcxkke0O+pytnkDIWqrshUZS/S+Az3FVwd
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Fri, 12 Jul 2013 16:32:22 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 19:32, Saul Wold <sgw@linux.intel.com> wrote:
>> We are seeing different checks for different recipes. Do you guys think
>> that it is possible to handle them in bbclass.
>>
> How different are they, there is the DISTRO_FEATURE check and then typically
> the service file or the init file is sed'ed and installed.

My initial thoughts were to keep it simple and have a
do_install_append() that deleted the sysvinit or systemd files
depending on DISTRO_FEATURES, leaving installing the files themselves
(from upstream, from a file, whatever) up to the recipe because that's
where the complications are.

Ross

