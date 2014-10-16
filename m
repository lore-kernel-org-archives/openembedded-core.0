Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 337A960DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 16:46:16 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id dc16so2614651qab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=120MKlenll4cuLCOgE0r15xkdlXvVZxnNss+ASGUnzs=;
	b=IKgFVLGCGfF2BCzGRoCXP7dB1ItCP35qZx1CqEvxHT9zZrjWZKZhvC2dVhipXp6UpC
	VTCsSWM4dGXh2laY6muG7FrY0+Dna3ZQQb6v+kzZHpx4UKH/XKazUsiwReaevMzDyxwl
	im1jD0msyFZV5fv/P9yF0kbld5A8vYuaEyZVcy4+VKVLtbwY9jd8OltOTxwMnKO0cWzj
	DxV+9MuKAnxE7Pj6Mf0Rb9+mdG6B9HQ1tMUN9Gwz3HQNJd3s3RM3f9bURrv7HViy0cd7
	gpcXYP00vvkutXjF6PoVQv4z/10xGzDd+6WjGPbbqUq/zeVvpbGha9+wG44ewGfFciGL
	5Grg==
X-Gm-Message-State: ALoCoQkuB7ohmnCb9KrRK6v2CQbhrqnq97i8d5wEji6EQst20UZ9/47cQUTdIHkaieByATGZOIdo
X-Received: by 10.229.72.73 with SMTP id l9mr4007311qcj.12.1413477977700; Thu,
	16 Oct 2014 09:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 16 Oct 2014 09:45:57 -0700 (PDT)
In-Reply-To: <CAJTo0La9iMQ4ZiSuTFo35271c2McpzkSvugOEqL6dBNoncdkZQ@mail.gmail.com>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
	<CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
	<CAJTo0La9iMQ4ZiSuTFo35271c2McpzkSvugOEqL6dBNoncdkZQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 17:45:57 +0100
Message-ID: <CAJTo0LYNjC6knwruug3cNP6DTwYGvBzDAxgseUnaVWRx0d+Y0g@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Thu, 16 Oct 2014 16:46:17 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 16:31, Burton, Ross <ross.burton@intel.com> wrote:
> There's a openssl 1.0.1j out now (fixing FOUR (!) CVEs, including
> "disabling SSLv3 didn't work"...).  I think considering the situation
> we'd take the upgrade for dizzy, even though we've frozen.  Anyone
> volunteering to take lead of upgrading dizzy to 1.0.1j and backporting
> the relevant patches to the previous releases? (eg daisy is on
> 1.0.1g).

For anyone else interested, I've currently got 1.0.1j patches for
dizzy in testing.  There's been debate over whether we backport the
fixes to daisy's 1.0.1g, or upgrade as the number of fixes is
growing...

Ross

