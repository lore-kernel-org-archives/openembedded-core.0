Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCpv2-0003Rz-20
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 12:20:28 +0100
Received: by mail-vc0-f178.google.com with SMTP id m8so4001392vcd.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 03:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Tkwxc+vJHnX6jpVM2wa6mggVEd5frw3BiQvaYS/qknw=;
	b=Tsn68lwIeOH1uuZc1tpj0/P9Oc//XHdLWdPWHPFM7Rx+jCcdIXgfqbzdnCiSaZ9KwR
	LIIGxju9bQFgFW06bev22TrHu1UTsyq0d2JBNsqjFA5OrUJ8mwvjdiE6/laNzflqz7uN
	UfDtdHp+iCdCrMUv1oU/9KYOtZcsDwFIdmCWidajMRLNOc63CFr3bNBmsOi2AeIBUqrZ
	gudtfiJZRSksAFUuOeEn1pk6weiIr1q/8u2eRyILdJ29uWKohaQY+ZwkMAIpmw4Eo34z
	93q0fOOhRNQxcVQQpDEye6baY3cZunUE8SHDndGny+r7H6MYLkc2kri3PH+Y4eP8lM3e
	Moyg==
X-Received: by 10.220.156.75 with SMTP id v11mr9294671vcw.1.1362481438529;
	Tue, 05 Mar 2013 03:03:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Tue, 5 Mar 2013 03:03:38 -0800 (PST)
In-Reply-To: <1552403.roegCEAHfx@helios>
References: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
	<1552403.roegCEAHfx@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2013 11:03:38 +0000
Message-ID: <CAJTo0LaGO+MGywaqEcTcE4s5K3naCn8=z_crXDg2jT8jddp1jg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlV2CSu+p5Gf0hnKWPgcXOTUjuQBCKH1GNA9i5akgIhbLJBqBtkuckIWpBPxjdGPXm8yAul
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: always use oe.lsb.distro_identifier method
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 11:20:29 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2013 10:54, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Unfortunately this has been merged before I had a chance to reply. FYI I put
> the code in here to read the files directly on purpose, because most distros
> bundle up the lsb_release tool with all of the LSB dependencies, so if you
> want to set up a headless server without some of the LSB dependencies (which
> include X11) you won't have the lsb_release tool and NATIVELSBSTRING is
> "Unknown". Yes, I know we have this problem with NATIVELSBSTRING already.

Score one for Debian, which ships lsb_release in a dedicated package
for this exact reason. :)

Ross


